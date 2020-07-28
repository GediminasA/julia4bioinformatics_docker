import CSV # pkg_names_to_import
import CodecZlib # pkg_names_to_import
import DataFramesMeta # pkg_names_to_import
import DataFrames # pkg_names_to_import
import ArgParse # pkg_names_to_import
import DataStructures # pkg_names_to_import
import OrderedCollections # pkg_names_to_import
import TextWrap # pkg_names_to_import
import XAM # pkg_names_to_import
import FASTX # pkg_names_to_import

import Pkg
for (uuid, info) in Pkg.dependencies()
if info.name in String[] # pkg_names_to_test
ENV["PREDICTMD_TEST_PLOTS"] = "true"
ENV["PREDICTMD_TEST_GROUP"] = "all"

include(joinpath(info.source, "test", "runtests.jl"))
end
end
