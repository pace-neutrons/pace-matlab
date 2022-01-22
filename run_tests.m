cwd = pwd;
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
