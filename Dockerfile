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

RUN julia -O3 -e ' using Pkg;Pkg.REPLMode.pkgstr("add  https://github.com/kmsquire/ArgParse2.jl    ;precompile") ; using ArgParse2 '
