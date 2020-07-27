FROM julia:1.3.1

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
	ca-certificates \
        autoconf \
        build-essential \
        git \
        mc \
        nano \
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

RUN julia install.jl
RUN julia -e 'using Pkg; for pkg in collect(keys(Pkg.installed()))
Base.compilecache(Base.identify_package(pkg))
    end'
RUN chmod -R a+rX $JULIA_DEPOT_PATH
