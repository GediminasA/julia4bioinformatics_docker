export PREDICTMD_TEST_PLOTS="true"
export GKSwstype="100"
export PREDICTMD_TEST_GROUP="all"

export JULIA_DEPOT_PATH="/opt/simplecontainergenerator_containers/julia_depot"
export JULIA_PROJECT="/opt/simplecontainergenerator_containers/julia_project"
/opt/bin/julia "$@"
