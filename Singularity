Bootstrap: docker
From: zamora/r-devtools

%post
    apt-get update -qq && apt-get install -y g++-8
    echo "CXX17=g++-8" >> $(R RHOME)/etc/Makeconf
    echo "CXX17STD = -std=gnu++17" >> $(R RHOME)/etc/Makeconf
    R -e "install.packages('BiocManager');devtools::install_github('grimbough/Rhdf5lib');devtools::install_github('CreRecombinase/EigenH5','chunkreader');devtools::install_github('stephenslab/ldshrink','refactor');devtools::install_github('CreRecombinase/SeqSupport');devtools::install_github('CreRecombinase/RSSp');BiocManager::install('VariantAnnotation');devtools::install_bitbucket('Wenan/caviarbf',subdir='caviarbf-r-package/caviarbf')"
