Bootstrap: shub
From: nturaga/bioconductor_full

%post
    mkdir /R_libs
    echo "R_LIBS_USER=/R_libs" >> /usr/local/lib/R/etc/Renviron
    R -e "install.packages('devtools');devtools::install_github('CreRecombinase/EigenH5','chunkreader');devtools::install_github('stephenslab/ldshrink','refactor');BiocManager::install('VariantAnnotation')"
    
