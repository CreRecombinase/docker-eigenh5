Bootstrap: docker
From: rocker/geospatial

%post
    apt-get update -y -qq	
    apt-get install -y --allow-unauthenticated hdf5
    installGithub.r --deps TRUE	CreRecombinase/EigenH5@chunkreader
