Bootstrap: docker
From: rocker/r-base:latest

%post

    echo "CXX17FLAGS =$(R CMD config CXXFLAGS) -I/opt/intel/mkl/include -Wno-deprecated-declarations -Wno-ignored-attributes" >> $(R RHOME)/etc/Makeconf
    echo "CXX11FLAGS =$(R CMD config CXX11FLAGS) -I/opt/intel/mkl/include -Wno-deprecated-declarations -Wno-ignored-attributes" >> $(R RHOME)/etc/Makeconf
    echo "CXX14FLAGS =$(R CMD config CXX14FLAGS) -I/opt/intel/mkl/include -Wno-deprecated-declarations -Wno-ignored-attributes" >> $(R RHOME)/etc/Makeconf
    echo "CXXFLAGS =$(R CMD config CXXFLAGS) -I/opt/intel/mkl/include -Wno-deprecated-declarations -Wno-ignored-attributes" >> $(R RHOME)/etc/Makeconf
    echo "CXX17PICFLAGS = -fpic" >> $(R RHOME)/etc/Makeconf
    echo "SHLIB_CXX17LD = g++-8 -std=gnu++17" >> $(R RHOME)/etc/Makeconf
    echo "SHLIB_CXX17LDFLAGS = -shared" >> $(R RHOME)/etc/Makeconf
    echo "FFLAGS = $(R CMD config FFLAGS) -I/opt/intel/mkl/include" >> $(R RHOME)/etc/Makeconf
    echo "SAFE_FFLAGS = $(R CMD config SAFE_FFLAGS) -I/opt/intel/mkl/include" >> $(R RHOME)/etc/Makeconf
    echo "FCFLAGS = $(R CMD config FCFLAGS) -I/opt/intel/mkl/include" >> $(R RHOME)/etc/Makeconf
    apt-get update -y -qq	   
    apt-get install -y apt-transport-https
    wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
    echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list
    echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list.d/unstable.list
    apt-get install -y gnupg
    apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
    apt-get update -y -qq	
    apt-get install -y --allow-unauthenticated intel-mkl-64bit-2019.3-062 r-cran-devtools r-cran-xml libcurl4-openssl-dev libssl-dev libxml2-dev
    R -e "install.packages(c('remotes','devtools'))"		  
    update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so     \
                    libblas.so-x86_64-linux-gnu      /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so.3   \
                    libblas.so.3-x86_64-linux-gnu    /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so   \
                    liblapack.so-x86_64-linux-gnu    /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so.3 \
                    liblapack.so.3-x86_64-linux-gnu  /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
    echo "/opt/intel/lib/intel64"     >  /etc/ld.so.conf.d/mkl.conf
    echo "/opt/intel/mkl/lib/intel64" >> /etc/ld.so.conf.d/mkl.conf
    ldconfig
    echo "MKL_THREADING_LAYER=GNU" >> /etc/environment
    installGithub.r --deps TRUE	RcppCore/RcppParallel grimbough/Rhdf5lib CreRecombinase/EigenH5@chunkreader CreRecombinase/SeqSupport CreRecombinase/RSSp
    R -e "BiocManager::install('VariantAnnotation');devtools::install_github('stephenslab/ldshrink','refactor')"
    apt-get remove -y apt-transport-https
