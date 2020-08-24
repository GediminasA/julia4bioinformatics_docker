import Pkg
Pkg.add(Pkg.Types.PackageSpec[Pkg.PackageSpec(; name = "ArgParse", ), Pkg.PackageSpec(; name = "CSV", ), Pkg.PackageSpec(; name = "Clustering", ), Pkg.PackageSpec(; name = "CodecZlib", ), Pkg.PackageSpec(; name = "DataFramesMeta", ), Pkg.PackageSpec(; name = "DataFrames", ), Pkg.PackageSpec(; name = "DataStructures", ), Pkg.PackageSpec(; name = "FASTX", ), Pkg.PackageSpec(; name = "FastaIO", ), Pkg.PackageSpec(; name = "IntervalSets", ), Pkg.PackageSpec(; name = "OrderedCollections", ), Pkg.PackageSpec(; name = "Query", ), Pkg.PackageSpec(; name = "Statistics", ), Pkg.PackageSpec(; name = "StringDistances", ), Pkg.PackageSpec(; name = "StatsBase", ), Pkg.PackageSpec(; name = "TextWrap", ), Pkg.PackageSpec(; rev = "workaround_23", name = "XAM", )])
Pkg.add(Pkg.PackageSpec(; url = "https://github.com/kmsquire/ArgParse2.jl", name = "ArgParse2",))
for name in String[] # pkg_names_to_test
Pkg.add(name)
Pkg.test(name)
end
Pkg.add(collect(values(Pkg.Types.stdlibs())))
for (uuid, info) in Pkg.dependencies()
Pkg.add(info.name)
end
for (uuid, info) in Pkg.dependencies()
if info.name in String[]
project_file = joinpath(info.source, "Project.toml")
test_project_file = joinpath(info.source, "test", "Project.toml")
if ispath(project_file)
project = Pkg.TOML.parsefile(project_file)
if haskey(project, "deps")
project_deps = project["deps"]
for entry in keys(project_deps)
Pkg.add(entry)
end
end
if haskey(project, "extras")
project_extras = project["extras"]
for entry in keys(project_extras)
Pkg.add(entry)
end
end
end
if ispath(test_project_file)
test_project = Pkg.TOML.parsefile(test_project_file)
if haskey(test_project, "deps")
test_project_deps = project["deps"]
for entry in keys(test_project_deps)
Pkg.add(entry)
end
end
end
end
end
for (uuid, info) in Pkg.dependencies()
Pkg.add(info.name)
end
Pkg.add(Pkg.Types.PackageSpec[Pkg.PackageSpec(; name = "ArgParse", ), Pkg.PackageSpec(; name = "CSV", ), Pkg.PackageSpec(; name = "Clustering", ), Pkg.PackageSpec(; name = "CodecZlib", ), Pkg.PackageSpec(; name = "DataFramesMeta", ), Pkg.PackageSpec(; name = "DataFrames", ), Pkg.PackageSpec(; name = "DataStructures", ), Pkg.PackageSpec(; name = "FASTX", ), Pkg.PackageSpec(; name = "FastaIO", ), Pkg.PackageSpec(; name = "IntervalSets", ), Pkg.PackageSpec(; name = "OrderedCollections", ), Pkg.PackageSpec(; name = "Query", ), Pkg.PackageSpec(; name = "Statistics", ), Pkg.PackageSpec(; name = "StringDistances", ), Pkg.PackageSpec(; name = "StatsBase", ), Pkg.PackageSpec(; name = "TextWrap", ), Pkg.PackageSpec(; rev = "workaround_23", name = "XAM", )])
Pkg.add(Pkg.PackageSpec(; url = "https://github.com/kmsquire/ArgParse2.jl", name = "ArgParse2",))