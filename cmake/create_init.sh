#!/bin/bash

if [ ! -d $1 ]
then
    mkdir "$1"
fi

cat << EOF > $1/+pace/on.m
function on()
    % Initialises the path for PACE projects
    %
    % Usage:
    % >> pace.on
    %
    % This will add paths for Horace, Herbert and SpinW.
    % To access euphonic use: euphonic.<command>
    if isunix(), py.sys.setdlopenflags(int32(10)); end
    horace_on();
    addpath(genpath(fullfile(fileparts(mfilename('fullpath')), '..', 'spinw')));
end
EOF

cat << EOF > $1/+pace/install_python_modules.m
function install_python_modules()
    % Installs required Python modules for Euphonic and Brille
    %
    % Usage:
    % >> pace.install_python_modules
    %
    % This will check you Python environment and install the modules using pip. 
    euphonic.install_python_modules();
    brille.install_python_modules();
end
EOF

exit 0
