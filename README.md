# PACE-neutrons

PACE is a suite of programs for data analysis of inelastic neutron scattering spectra, written in both Python and Matlab.

The packages included in PACE are:

* [Horace](https://github.com/pace-neutrons/Horace/) - 
  A Matlab program for the visualisation and analysis of large datasets from time-of-flight neutron inelastic scattering spectrometers.
* [Euphonic](https://github.com/pace-neutrons/euphonic) - 
  A Python program for simulating phonon spectra from DFT output (CASTEP or Phonopy).
* [Brille](https://github.com/brille/brille) - A C++/Python program for Brillouin zone interpolation.
* [SpinW](https://github.com/spinw/spinw) - A Matlab program for simulating spin wave (magnon) spectra.

The Python programs have separate PyPI packages 
([Euphonic](https://pypi.org/project/euphonic/) and [Brille](https://pypi.org/project/brille/)).

This package provides a Matlab toolbox (`.mltbx` file) comprising all the Matlab packages
and interfaces to the Python packages.


## Getting Started

Please download the latest released `pace.mltbx` file from the release menu on the right of this page.
Then run Matlab and open this file in Matlab. This should install the PACE toolbox.
You can also manually install the toolbox using:

```matlab
matlab.addons.toolbox.installToolbox('/path/to/pace.mltbx')
```

Once installed, you can activate the PACE environment (which puts adds the required folders to your path) with:

```matlab
pace.on()
```

Then you can use the Horace and SpinW programs as normal.

## Python setup

In order to use Euphonic or Brille you must also have a Python environment set up.
Please see this 
[documentation](https://uk.mathworks.com/help/matlab/matlab_external/install-supported-python-implementation.html)
on setting up a Matlab-compatible Python environment.
Windows users should note that *Matlab does not support the Python versions installed from the Microsoft Store*.
In this case, please install Python from [python.org](https://www.python.org/download) 
or use [Conda](https://docs.conda.io/en/latest/miniconda.html) 
or [Mamba](https://github.com/conda-forge/miniforge#mambaforge).
Finally, please note that depending on your Matlab version, only specific Python versions are supported.
The supported versions are listed 
[here](https://www.mathworks.com/content/dam/mathworks/mathworks-dot-com/support/sysreq/files/python-compatibility.pdf).
Note that in any case, the newest Python version (3.10) is *not* supported by Matlab,
and neither Euphonic nor Brille will work on Python 2.
Euphonic and Brille are developed on Python 3.7 and 3.8, but should also work with 3.9.

Once you have set up Python, check your Python installation using something like:

```matlab
py.print('hello world!')
```

You can then either install Euphonic and Brille manually using `pip` in the Python environment
(please see the documentation for Euphonic and Brille for how to do this),
or you can use the built-in scripts to do this:

```matlab
pace.install_python_modules()
```
