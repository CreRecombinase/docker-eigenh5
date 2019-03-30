## Emacs, make this -*- mode: sh; -*-
Bootstrap: docker
From: zamora/r-devtools

%post
    mkdir /R_libs

    apt-get update -qq && apt-get install -y g++-8
    echo "R_LIBS_USER=/R_libs" >> $(R RHOME)/etc/Renviron
    echo "CXX17=g++-8" >> $(R RHOME)/etc/Makeconf
    echo "CXX17STD = -std=gnu++17" >> $(R RHOME)/etc/Makeconf
    R -e "install.packages('BiocManager');devtools::install_github('grimbough/Rhdf5lib');devtools::install_github('CreRecombinase/EigenH5','chunkreader');devtools::install_github('stephenslab/ldshrink','refactor');BiocManager::install('VariantAnnotation')"
