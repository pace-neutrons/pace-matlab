include(Download)

message(STATUS "Downloading PACE")

download(
    PROJ SPINW
    GIT_REPOSITORY https://github.com/mducle/spinw.git
    GIT_TAG e3e57aae432f6737aff81d31ccda6e7dce741cef
    GIT_SHALLOW 1
)

download(
    PROJ HORACE_WIN
    URL https://github.com/pace-neutrons/Horace/releases/download/v3.6.1/Horace-3.6.1-win64-R2019b.zip
)

download(
    PROJ HORACE_LNX
    URL https://github.com/pace-neutrons/Horace/releases/download/v3.6.1/Horace-3.6.1-linux-R2019b.tar.gz
)

download(
    PROJ EUPHONIC_MATLAB
    URL https://github.com/pace-neutrons/horace-euphonic-interface/releases/download/v0.3.1/horace_euphonic_interface.mltbx
    DOWNLOAD_NO_EXTRACT TRUE
)

download(
    PROJ BRILLEM
    URL https://github.com/brille/brillem/releases/download/v0.2.0/brillem.mltbx
    DOWNLOAD_NO_EXTRACT TRUE
)
