                shell> pwd            #Check were you are currently located
                (@v1.8) pkg> generate new_pack
                     Generating  project new_pack:
                     new_pack\Project.toml
                     new_pack\src\new_pack.jl
                shell> cd new_pack
                     `path-to-folder\new_pack`
                (@v1.8) pkg> activate .
                       Activating project at `path-to-folder\new_pack`
                (new_pack) pkg> add CSV
                (new_pack) pkg> status
                       Project new_pack v0.1.0
                       Status `path-to-folder\new_pack\Project.toml`
                       [336ed68f] CSV v0.10.9
                (new_pack) pkg> activate
