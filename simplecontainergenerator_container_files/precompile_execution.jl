import ArgParse # pkg_names_to_import
import CSV # pkg_names_to_import
import Clustering # pkg_names_to_import
import CodecZlib # pkg_names_to_import
import DataFramesMeta # pkg_names_to_import
import DataFrames # pkg_names_to_import
import DataStructures # pkg_names_to_import
import FASTX # pkg_names_to_import
import FastaIO # pkg_names_to_import
import IntervalSets # pkg_names_to_import
import OrderedCollections # pkg_names_to_import
import Query # pkg_names_to_import
import Statistics # pkg_names_to_import
import StringDistances # pkg_names_to_import
import StatsBase # pkg_names_to_import
import TextWrap # pkg_names_to_import
import XAM # pkg_names_to_import
import Suppressor
import TestSetExtensions
import Coverage
import LightXML

import Pkg
for (uuid, info) in Pkg.dependencies()
if info.name in String[] # pkg_names_to_test
ENV["PREDICTMD_TEST_PLOTS"] = "true"
ENV["PREDICTMD_TEST_GROUP"] = "all"

include(joinpath(info.source, "test", "runtests.jl"))
end
end