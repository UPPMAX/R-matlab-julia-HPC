args = argv();

% args = { "1", "1" }
% disp(args)

if length(args) == 0 || length(args) > 2
  disp("ERROR: Incorrect number of arguments.");
  disp(" ");
  disp("Please specify:");
  disp(" ");
  disp("- the number of workers this calculation uses");
  disp("- (optionally) a grid size");
  disp(" ");
  disp("General usage:");
  disp(" ");
  disp("  matlab do_2d_integration.m [n_workers] [grid_size]");
  disp(" ");
  disp("Examples: ");
  disp(" ");
  disp("  matlab do_2d_integration.m 1");
  disp("  matlab do_2d_integration.m 1 16384");
  disp(" ");
  exit(42);
end

function [n_workers, grid_size] = parse_args(args)
  n_workers = str2double(args{1});
  assert(isnumeric(n_workers));
  assert(n_workers > 0);
  assert(n_workers < 256 * 256);
  grid_size = 16384;
  if length(args) == 2
      grid_size = str2double(args{2});
  end
  assert(isnumeric(grid_size));
  assert(grid_size > 0);
end

[n_workers, grid_size] = parse_args(args);
disp(['Number of workers: ', num2str(n_workers)]);
disp(['Grid size: ', num2str(grid_size)]);

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
    elseif ~isempty(regexp(hostname, '^r\d{1,4}$', 'once'))
        cluster = "rackham";
    else
        cluster = string(hostname);
    end
end

function s = integration2d(grid_size, n_workers, worker_index)
    assert(grid_size > 0);
    assert(n_workers > 0);
    assert(worker_index > 0);
    assert(worker_index <= n_workers);
    interval_size = pi / grid_size;
    my_sum = 0.0;
    grid_cells_per_worker = floor(grid_size / n_workers);
    begin_index = grid_cells_per_worker * (worker_index - 1) + 1;
    end_index = grid_cells_per_worker * worker_index;
    for i = begin_index:end_index
        x = interval_size * (i - 0.5);
        for j = 1:grid_size
            y = interval_size * (j - 0.5);
            my_sum = my_sum + sin(x + y);
        end
    end
    s = (interval_size^2) * my_sum;
end

assert(abs(integration2d(100, 1, 1)) < 0.0001);

% Start timer
tic;

partial_results = [];

parfor worker_index = 1:n_workers
    partial_results(worker_index) = integration2d(grid_size, n_workers, worker_index);
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
disp([
    char(language) char(',') ...
    char(hpc_cluster) char(',') ...
    num2str(grid_size) char(',') ...
    num2str(n_workers) char(',') ...
    num2str(core_secs)
  ]);

