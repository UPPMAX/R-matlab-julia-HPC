args = argv();

function [n_workers, grid_size] = parse_args(args)

  if length(args) == 0
      args = [1 1];
  end

  n_workers = str2double(args{1});
  assert(isnumeric(n_workers) && n_workers > 0 && n_workers < 256*256);

  grid_size = 16384;
  if length(args) == 2
      grid_size = str2double(args{2});
  end
  assert(isnumeric(grid_size) && grid_size > 0);
end

[n_workers, grid_size] = parse_args(args)
disp(['Number of workers: ', num2str(n_workers)]);
disp(['Grid size: ', num2str(grid_size)]);


