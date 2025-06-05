Extra MATLAB Exercises
----------------------

.. challenge:: Run the following function serially, then parallelize the loop and rerun it with ``parpool`` using 6 workers. Compare the runtimes and output orders.

  .. code-block:: matlab

    function t_out = greetings()
      % Planets (incl. dwarf) in ascending order of distance from Sun
      planets = ["Mercury" "Venus" "Earth" "Mars" "Ceres" ...
          "Jupiter" "Saturn" "Uranus" "Neptune" "Pluto" ...
          "Orcus" "Salacia" "Haumea" "Quaoar" "Makemake" ...
          "Gonggong" "Eris" "Sedna"];
      tic
      % parallelize the following
      for idx=1:length(planets)
        disp("Hello from "+planets(idx))
      end
      t_out = toc;
    end

.. challenge:: Compare 2 ways to parallelize code.

  1. Run the following code with the MATLAB batch command with ``iter=10000`` and set the number of workers equal to 6.

   .. code-block:: matlab

      function [dstats, t] = dice_stats_par(iter)
      % All numbers N for which there exist fair "dice" with N faces
      nsides = [2:22 24:2:32 36 38 48 50 60 62 92 100 120];
      % pre-allocate array for stats
      dstats = zeros(numel(nsides),4);

      tic
      % parallelize or serialize as desired
      parfor nf = 1:numel(nsides)
          rolls = randi([1,nsides(nf)], [iter, 1], 'uint32');
          mmm = [nsides(nf) mean(double(rolls)) median(rolls) mode(rolls)];
          dstats(nf,:) = mmm;
          % parfor loop requires us to set whole row at once
          % Trying to set a slice of the row results in this Error:
          %   The parfor-loop variable 'dstats' is indexed using the loop variable,
          %   but it is not a valid sliced output variable.
      end

      % make dstats results readable
      dstats = array2table(dstats, 'VariableNames',{'D','Mean','Median','Mode'});
      writetable(dstats,'dice_stats_out.txt','Delimiter','\t')
      t=toc;
      disp(t)
      end

    You can play with the number of workers to see how the running time changes, and try submitting from the MATLAB command line or regular terminal.

    2. What happens if you try to run this code unmodified with a batch submission script like the `monte_carlo_pi.m` script was run in class? How are the results in your output script different from what your fetched at the MATLAB command line? Why?

.. solution::

   2. If you try to, say, modify your ``parallel_example-<cluster>.sh`` to take ``dice_stats_par.m`` without modifying the latter, in the output log file, you will find that the resulting data table has been printed as many times as the number of tasks you assigned with ``--ntasks-per-node``, and the time will have been much longer.


