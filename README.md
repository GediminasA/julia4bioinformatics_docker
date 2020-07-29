# julia4bioinformatics_docker
Dedicated for creation of julia docker image containing some libs 4 bioinformatics.
It is generated using https://github.com/bcbi/SimpleContainerGenerator.jl (and file example_4_generation.jl).

To generate such repository:
 1. follow guidelines from  https://github.com/bcbi/SimpleContainerGenerator.jl ;
 2. modify the generated install_packages.jl script. Currently it has a feature/bug that all non standard revisions are finally forgotten. A patch is to copy the line #2 to the end of the file.
 3. Modify  docker file to add conda and mamba install.
 4. Unregistered conda packages cannot be smoothly wrapped up in a container. I would recommend use the source of such packages (if registration is not feasible) and to add them via LOAD_PATH variable.
