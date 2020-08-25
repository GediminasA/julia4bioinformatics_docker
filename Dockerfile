FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get install -yq --no-install-recommends apt-utils build-essential bzip2 ca-certificates cmake coreutils curl emacs  emacs nano vim fonts-liberation gettext gfortran git git-all git-flow git-lfs gnupg gpg gpg-agent gzip hdf5-tools libcurl4-openssl-dev libgconf-2-4 libgtk2.0-0 libnss3 libpgf-dev libpgf6 libpgf6-dbg libpng-dev libssl-dev libxss1 libxtst6 locales lsb-release m4 nano openssh-client openssl pdf2svg poppler-utils qt5-default screen sudo texlive-binaries texlive-latex-base texlive-latex-extra texlive-luatex texlive-pictures tmux  tree unzip vim wget xdg-utils zip zlib1g-dev
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV SHELL=/bin/bash LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 PROMPT_COMMAND="echo -n [$()]"
RUN mkdir -p /tmp/simplecontainergenerator_containers-julia-gpg-key
RUN cd /tmp/simplecontainergenerator_containers-julia-gpg-key && curl https://julialang.org/juliareleases.asc --output juliareleases.asc
RUN cd /tmp/simplecontainergenerator_containers-julia-gpg-key && gpg --import juliareleases.asc
RUN rm -rf /tmp/simplecontainergenerator_containers-julia-gpg-key
RUN mkdir -p /tmp/simplecontainergenerator_containers-download-julia
RUN cd /tmp/simplecontainergenerator_containers-download-julia && wget -O julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.4/julia-1.4.0-linux-x86_64.tar.gz
RUN cd /tmp/simplecontainergenerator_containers-download-julia && wget -O julia.tar.gz.asc https://julialang-s3.julialang.org/bin/linux/x64/1.4/julia-1.4.0-linux-x86_64.tar.gz.asc
RUN cd /tmp/simplecontainergenerator_containers-download-julia && gpg --verify julia.tar.gz.asc
RUN rm -rf /opt
RUN mkdir -p /opt
RUN cd /tmp/simplecontainergenerator_containers-download-julia && tar xzf julia.tar.gz -C /opt --strip-components=1
RUN rm -rf /tmp/simplecontainergenerator_containers-download-julia
RUN rm -rf /tmp/simplecontainergenerator-containers-build-depot
RUN mkdir -p /tmp/simplecontainergenerator-containers-build-depot 
RUN cd /tmp && JULIA_DEPOT_PATH=/tmp/simplecontainergenerator-containers-build-depot /opt/bin/julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(; verbose=true)'
RUN rm -rf /tmp/simplecontainergenerator-containers-build-depot
RUN rm -rf /opt/etc/julia/startup.jl
RUN rm -rf /opt/share/julia/compiled
RUN rm -rf /usr/bin/julia
RUN mkdir -p /opt/etc/julia
RUN rm -rf /opt/simplecontainergenerator_containers
RUN mkdir -p /opt/simplecontainergenerator_containers
RUN mkdir -p /opt/simplecontainergenerator_containers/backup_of_dockerfile
RUN mkdir -p /opt/simplecontainergenerator_containers/depot_backup_simplecontainergenerator
RUN mkdir -p /opt/simplecontainergenerator_containers/depot_backup_packagecompiler
RUN mkdir -p /opt/simplecontainergenerator_containers/packagecompiler_depot
RUN mkdir -p /opt/simplecontainergenerator_containers/julia_depot
RUN mkdir -p /opt/simplecontainergenerator_containers/julia_project
RUN mkdir -p /opt/simplecontainergenerator_containers/sysimage
RUN mkdir -p /usr/bin
COPY Dockerfile /opt/simplecontainergenerator_containers/backup_of_dockerfile/Dockerfile
COPY simplecontainergenerator_container_files/backups_of_simplecontainergenerator_1.jl /opt/simplecontainergenerator_containers/backups_of_simplecontainergenerator_1.jl
COPY simplecontainergenerator_container_files/backups_of_simplecontainergenerator_2.jl /opt/simplecontainergenerator_containers/backups_of_simplecontainergenerator_2.jl
COPY simplecontainergenerator_container_files/install_packages.jl /opt/simplecontainergenerator_containers/install_packages.jl
COPY simplecontainergenerator_container_files/julia.sh /usr/bin/julia
COPY simplecontainergenerator_container_files/no_sysimage_julia.sh /usr/bin/no_sysimage_julia
COPY simplecontainergenerator_container_files/packagecompiler_install.jl /opt/simplecontainergenerator_containers/packagecompiler_install.jl
COPY simplecontainergenerator_container_files/packagecompiler_run.jl /opt/simplecontainergenerator_containers/packagecompiler_run.jl
COPY simplecontainergenerator_container_files/precompile_execution.jl /opt/simplecontainergenerator_containers/precompile_execution.jl
COPY simplecontainergenerator_container_files/startup.jl /opt/etc/julia/startup.jl
RUN chmod 444 /opt/etc/julia/startup.jl
RUN chmod 555 /usr/bin/julia
RUN chmod 555 /usr/bin/no_sysimage_julia
RUN cd /tmp && JULIA_DEBUG=all SIMPLECONTAINERGENERATOR_CONTAINER_NO_TEMP_DEPOT="true" /usr/bin/no_sysimage_julia /opt/simplecontainergenerator_containers/install_packages.jl
RUN JULIA_DEBUG=all /usr/bin/no_sysimage_julia -e 'import Pkg; Pkg.add(Pkg.PackageSpec(; url = "https://github.com/kmsquire/ArgParse2.jl", name = "ArgParse2",)); Pkg.resolve()'
RUN cd /tmp && JULIA_DEBUG=all /opt/bin/julia /opt/simplecontainergenerator_containers/backups_of_simplecontainergenerator_1.jl
RUN cd /tmp && JULIA_DEBUG=all /opt/bin/julia /opt/simplecontainergenerator_containers/backups_of_simplecontainergenerator_2.jl
RUN cd /tmp && JULIA_DEBUG=all /opt/bin/julia /opt/simplecontainergenerator_containers/packagecompiler_install.jl
RUN cd /tmp && SIMPLECONTAINERGENERATOR_CONTAINER_NO_TEMP_DEPOT="true" /usr/bin/no_sysimage_julia /opt/simplecontainergenerator_containers/packagecompiler_run.jl
RUN cd /tmp && JULIA_DEBUG=all /usr/bin/no_sysimage_julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(; verbose=true)'
RUN cd /tmp && JULIA_DEBUG=all /usr/bin/julia -e 'import InteractiveUtils; InteractiveUtils.versioninfo(; verbose=true)'
RUN rm -rf /opt/bin/julia/compiled
RUN rm -rf /opt/etc/julia/compiled
RUN rm -rf /opt/share/julia/compiled
RUN rm -rf /opt/simplecontainergenerator_containers/depot_backup_simplecontainergenerator/compiled
RUN rm -rf /opt/simplecontainergenerator_containers/depot_backup_packagecompiler/compiled
RUN rm -rf /opt/simplecontainergenerator_containers/packagecompiler_depot/compiled
RUN rm -rf /opt/simplecontainergenerator_containers/julia_depot/compiled
RUN rm -rf /opt/simplecontainergenerator_containers/julia_project/compiled
RUN rm -rf /opt/simplecontainergenerator_containers/sysimage/compiled
RUN find /opt -type d -print0 | xargs -0 chmod a+rx
RUN find /opt -type f -print0 | xargs -0 chmod a+r
RUN chmod a+rx /opt/bin/julia
RUN chmod a+rx /usr/bin/julia
RUN chmod a+rx /usr/bin/no_sysimage_julia
RUN curl -sSL https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.3-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda install -y -c conda-forge mamba \
    && conda clean --all --yes
ENV PATH /opt/conda/bin:$PATH
ENTRYPOINT ["/usr/bin/julia"]
