function run_tests(python_path)
% Runs tests of PACE toolbox

% Set up Horace / SpinW if not setup
if isempty(which('herbert_init.m'))
    mltbxdir = fullfile(fileparts(mfilename('fullpath')), 'mltbx');
    if ~exist(mltbxdir, 'dir')
        mltbxdir = fullfile(mltbxdir, '..', 'build', 'mltbx');
    end
    toolboxfile = fullfile(mltbxdir, 'pace.mltbx');
    if exist(toolboxfile, 'file')
        disp('#### Installing pace.mltbx ####');
        matlab.addons.toolbox.installToolbox(toolboxfile);
        pace.on();
    else
        assert(~isempty(which('horace_on')), 'Cannot find PACE installation');
        horace_on;
    end
end

% Set up Python if not setup
try
    pe = pyenv
    use_pyenv = true;
    isloaded = pe.Status == 'Loaded';
catch 
    pe = pyversion
    use_pyenv = false;
    isloaded = pe.isloaded;
end
if ~isloaded && nargin > 0
    if use_pyenv, pyenv('Version', python_path); else, pyversion(python_path); end
end
try
    py.importlib.import_module('euphonic');
catch ME
    if contains(ME.message, 'ModuleNotFoundError')
        pace.install_python_modules();
    end
end

% Runs the tests
root_dir = fullfile(fileparts(mfilename('fullpath')), 'pace-integration');
% Stupid Herbert setup error
try
    ws = read_sqw(fullfile(root_dir, 'quartz/cut1d.sqw'));
end
res = runtests(fullfile(root_dir, 'EuphonicDisp2SqwTest.m'))
passed = [res.Passed];
if ~all(passed)
    quit(1);
end
cd(fullfile(root_dir, 'iron_spinwaves'));
run('run_spinw_horace_test.m');
cd(root_dir);
run('brille_spinwaves/run_test.m');
