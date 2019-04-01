## Emacs, make this -*- mode: sh; -*-
Bootstrap: docker
From: rocker/tidyverse

%post
    mkdir /R_libs
    echo "R_LIBS_USER=/R_libs" >> $(R RHOME)/etc/Renviron
    echo "CXX17=g++-8" >> $(R RHOME)/etc/Makeconf
    echo "CXX17STD = -std=gnu++17" >> $(R RHOME)/etc/Makeconf
    apt-get update -qq && apt-get -y --no-install-recommends install g++-8

    installGithub.r --deps TRUE	grimbough/Rhdf5lib CreRecombinase/EigenH5@chunkreader stephenslab/ldshrink@refactor CreRecombinase/SeqSupport CreRecombinase/RSSp
    R -e "BiocManager::install('VariantAnnotation');devtools::install_bitbucket('Wenan/caviarbf',subdir='caviarbf-r-package/caviarbf')""
