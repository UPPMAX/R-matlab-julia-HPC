# A Julia notebook: Pluto

## Activate the Pluto environment we installed earlier

``` { .julia-repl }
(@v1.11) pkg> activate pluto-env
julia> using Pluto
```

## Start Pluto

### First try:

``` { .julia-repl }
> Pluto.run()
```

- At some places it actually starts a web browser

### Otherwise, do

``` { .julia-repl }
julia> Pluto.run(; launch_browser=false)
```

and note the url given and paste it into a browser opened from the menu of ThinLinc.

### Otherwise, do

``` { .julia-repl }
julia> Pluto.run(; host="0.0.0.0")
```

- Note the url given and paste it into a browser opened from the menu of ThinLinc.
- also note the node you got when starting the interactive session (like ``n701`` or similar on Tetralith).
- change ``0.0.0.0`` to that hostname
- Example for Tetralith to be in web browser url: ``http://n701:1234/?secret=mAzEDw9R``

## How does it look like?

![Pluto start](../img/Pluto_start.png)

- Welcome page

![Pluto getting_started](../img/Pluto_getting_started.png)

- Pluto cells

![Pluto cells2](../img/Pluto_cells2.png)
