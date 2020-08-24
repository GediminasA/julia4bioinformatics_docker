import SimpleContainerGenerator

mkpath("julia4bioinf")
cd("julia4bioinf")

pkgs = [
	(name = "ArgParse",),
	(name = "CSV",),
	(name = "Clustering",),
	(name = "CodecZlib",),
	(name = "DataFramesMeta",),
	(name = "DataFrames",),
	(name = "DataStructures",),
	(name = "FASTX",),
	(name = "FastaIO",),
	(name = "IntervalSets",),
	(name = "OrderedCollections",),
	(name = "Query",),
	(name = "Statistics",),
	(name = "StringDistances",),
	(name = "StatsBase",),
	(name = "TextWrap",),
	(name = "XAM",rev="workaround_23"),
]

julia_version = v"1.4.0"


SimpleContainerGenerator.create_dockerfile(pkgs,
                                           pwd();
                                           julia_version = julia_version,no_test=["Query","Statistics","StringDistances","StatsBase","FastaIO","IntervalSets","Clustering","CodecZlib","CSV","TextWrap","OrderedCollections","CodecZlib","DataFramesMeta","DataFrames","DataStructures","FASTX","XAM","ArgParse"])

println("check the julia4bioinf/simplecontainergenerator_container_files/install_packages.jl ; cd julia4bioinf;  run docker build -t galzbutas/julia4bioinf .")

