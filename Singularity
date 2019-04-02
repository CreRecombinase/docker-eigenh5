Bootstrap: docker
From: rocker/tidyverse

%post
    echo "CXX17=g++-8" >> $(R RHOME)/etc/Makeconf
    echo "CXX17STD = -std=gnu++17" >> $(R RHOME)/etc/Makeconf
    sudo apt-get install -y --no-install-recommends software-properties-common
    add-apt-repository -y ppa:ubuntu-toolchain-r/test
    g++-8 --version
    apt-get update -qq && apt-get -y --no-install-recommends install g++-8
    installGithub.r --deps TRUE	grimbough/Rhdf5lib CreRecombinase/EigenH5@chunkreader stephenslab/ldshrink@refactor CreRecombinase/SeqSupport CreRecombinase/RSSp
    R -e "BiocManager::install('VariantAnnotation');devtools::install_bitbucket('Wenan/caviarbf',subdir='caviarbf-r-package/caviarbf')""
