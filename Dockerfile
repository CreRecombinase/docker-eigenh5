FROM rocker/verse:3.5.3
MAINTAINER "Nicholas Knoblauch" nwknoblauch@gmail.com

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
	lbzip2 \
	git \
	libfftw3-dev \
	libgsl0-dev
	libhdf5-dev \
	libprotobuf-dev \
	libsqlite3-dev \
	libssl-dev \
	protobuf-compiler \
	sqlite3 \
	tk-dev \
	unixodbc-dev \
	&& install2.r --error \
	hdf5r \
	## from bioconductor
	&& R -e "install.packages('devtools');devtools::install_github('CreRecombinase/EigenH5','chunkreader');devtools::install_github('stephenslab/ldshrink','refactor');BiocManager::install('VariantAnnotation')"
