#!/usr/bin/env matlab

function integration2d_main(varargin)
% Parse command-line arguments
args = varargin;
if isempty(args)
    args = argv(); % For CLI usage
end

if isempty(args) || length(args) > 2
    fprintf(['ERROR: Incorrect number of arguments.\n\n' ...
        'Please specify:\n\n' ...
        '- the number of workers this calculation uses\n' ...
        '- (optionally) a grid size\n\n' ...
        'General usage:\n\n' ...
        '  matlab -batch "integration2d_main(n_workers, grid_size)"\n\n' ...
        'Examples:\n\n' ...
        '  matlab -batch "integration2d_main(1)"\n' ...
        '  matlab -batch "integration2d_main(1, 16384)"\n\n']);
    error('Incorrect number of arguments');
end

n_workers = str2double(args{1});
disp(['Number of workers: ', num2str(n_workers)]);
assert(isnumeric(n_workers) && n_workers > 0 && n_workers < 256*256);

grid_size = 16384;
if length(args) == 2
    grid_size = str2double(args{2});
end
disp(['Grid size: ', num2str(grid_size)]);
assert(isnumeric(grid_size) && grid_size > 0);

% --- HPC cluster detection ---
function cluster = extract_hpc_cluster(hostname)
    if nargin == 0 || isempty(hostname)
        hostname = getenv('HOSTNAME');
    end
    if isempty(hostname)
        cluster = "unknown";
    elseif ~isempty(regexp(hostname, '^b-cn\d{1,6}$', 'once'))
        cluster = "kebnekaise";
    elseif ~isempty(regexp(hostname, '^cn\d{1,3}$', 'once'))
        cluster = "cosmos";
    elseif ~isempty(regexp(hostname, '^cosmos\d*\.int\.lunarc$', 'once'))
        cluster = "cosmos";
    elseif ~isempty(regexp(hostname, '^login\d$', 'once'))
        cluster = "dardel";
    elseif ~isempty(regexp(hostname, '^n\d{1,6}$', 'once'))
        cluster = "tetralith";
    elseif ~isempty(regexp(hostname, '^nid\d{1,6}$', 'once'))
        cluster = "dardel";
    elseif ~isempty(regexp(hostname, '^pelle\d*\.uppmax\.uu\.se$', 'once'))
        cluster = "pelle";
    elseif ~isempty(regexp(hostname, '^p\d{1,3}$', 'once'))
        cluster = "pelle";
    elseif ~isempty(regexp(hostname, '^rackham\d*\.uppmax\.uu\.se$', 'once'))
        cluster = "rackham";
    elseif ~isempty(regexp(hostname, '^r\d{1,3}$', 'once'))
        cluster = "rackham";
    else
        cluster = string(hostname);
    end
end

% --- 2D integration function ---
function s = integration2d(grid_size, n_workers, worker_index)
    assert(grid_size > 0 && n_workers > 0 && worker_index > 0 && worker_index <= n_workers);
    h = pi / grid_size;
    mysum = 0.0;
    workload = floor(grid_size / n_workers);
    begin_index = workload * (worker_index - 1) + 1;
    end_index = workload * worker_index;
    for i = begin_index:end_index
        x = h * (i - 0.5);
        for j = 1:grid_size
            y = h * (j - 0.5);
            mysum = mysum + sin(x + y);
        end
    end
    s = h^2 * mysum;
end

% --- Parallel computation ---
if n_workers > 1
    pool = gcp('nocreate');
    if isempty(pool) || pool.NumWorkers ~= n_workers
        if ~isempty(pool)
            delete(pool);
        end
        parpool(n_workers);
    end
else
    pool = [];
end

tic;
partial_results = zeros(1, n_workers);

parfor i = 1:n_workers
    partial_results(i) = integration2d(grid_size, n_workers, i);
end

integral_value = sum(partial_results);
duration_secs = toc;

error_value = abs(integral_value - 0.0);
core_secs = duration_secs * n_workers;
disp(['Integral value: ', num2str(integral_value)]);
disp(['Integral error: ', num2str(error_value)]);
disp(['Time spent on 1 core (seconds): ', num2str(duration_secs)]);
disp(['Time spent on all cores (seconds): ', num2str(core_secs)]);

language = 'matlab';
hpc_cluster = extract_hpc_cluster();
disp('language,hpc_cluster,grid_size,n_workers,core_secs');
disp([language ',', char(hpc_cluster) ',' num2str(grid_size) ',' num2str(n_workers) ',' num2str(core_secs)]);

if ~isempty(pool)
    delete(pool);
end

end

% For script execution, call the function if not loaded as a function
if ~isdeployed && isempty(getenv('MATLAB_TEST'))
    integration2d_main();
end
