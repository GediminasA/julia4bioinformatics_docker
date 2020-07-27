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

RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  ArgParse    ;precompile");using ArgParse '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  https://github.com/kmsquire/ArgParse2.jl    ;precompile");using ArgParse2 '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  BGZFStreams    ;precompile");using BGZFStreams '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  BioAlignments    ;precompile");using BioAlignments '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  BioSequences    ;precompile");using BioSequences '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  Clustering    ;precompile");using Clustering '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  CodecZlib    ;precompile");using CodecZlib '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  CSV    ;precompile");using CSV '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  DataFrames    ;precompile");using DataFrames '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  DataFramesMeta    ;precompile");using DataFramesMeta '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  DataStructures    ;precompile");using DataStructures '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  FastaIO    ;precompile");using FastaIO '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  FASTX    ;precompile");using FASTX '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  IntervalSets    ;precompile");using IntervalSets '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  Query    ;precompile");using Query '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  XAM#workaround_23    ;precompile");using XAM '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  Statistics    ;precompile");using Statistics '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  StringDistances    ;precompile");using StringDistances '
RUN julia -O3 -e 'using Pkg;Pkg.REPLMode.pkgstr("add  StatsBase    ;precompile");using StatsBase '

