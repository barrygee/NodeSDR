#!/bin/bash

# This script will set up all NodeSDR modules
# If modules already exist, they will be rebased back to their main. 
# Merge conflicts should be resolved manually
# You can skip the building of any modules by commenting them out in the list below
NodeSDR_MODULES=(
    NodeSDR-Core
    NodeSDR-Data-Store
    NodeSDR-Authentication
    NodeSDR-SDR-Controller
    NodeSDR-Frontend
)

for module in "${NodeSDR_MODULES[@]}"; do

    cd app/modules

    if [ ! -d $module ]; then
        git clone https://github.com/barrygee/$module.git
    fi
        
    cd $module
        git checkout main
        git pull origin main
    
    cd ../../

done