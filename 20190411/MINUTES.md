# Minutes

Minutes from the meeting held on 2019/04/11.

Participants:

- ALBA: Zbigniew Reszela
- DESY: Teresa Núñez
- MAXIV: Antonio Milán, Juliano Murari, Mirjam Lindberg, Darren Spruce, Áureo Freitas
- SOLARIS: Grzegorz Kowalski

## Actions
* define criteria for configuration tools comparison
* use Slack a little and evaluate
* create project for porting to Python 3

## 1. Presentation: Actual state of DSConfig
* `sardana-dsconfig` prepared specifically to handle Sardana
* elements and their configuration stored in Excel file (not FODS)
* separate sheets for different types of elements
* dump live system configuration to json file
* workflow: take existing config -> update from Excel file -> push to Tango
* `json2tango` pushes json configuration to Tango DB
* IDs for existing items are kept, new IDs are assigned by `sardana-dsconfig` script
* separate tool for generating Excel files from json
* Ansible module for populating Tango DB currently in development

## 2. Round table
* SOLARIS
	- `regscan` doesn't check motor limits, rather trivial issue
	- Spock console in Qt ([taurus/#900](https://github.com/taurus-org/taurus/issues/900))
* ALBA
	- default values are not filled in macroexecutor, introduced with optional parameters
	- problems with synchronization configuration, introduced by SEP18
	- `expconf` popups
* MAX IV
	- MacroServer hangs ([#1023](https://github.com/sardana-org/sardana/issues/1023))
		- script provided to reproduce the problem
		- attributes are being read asynchronically
		- logger consumes large amounts of memory
		- no memeory problems on Tango 7
		- hard to reproduce on Tango 9 (4 days with no problem)
		- depends on PyTango version
	- problems with prescan snapshot ([#1080](https://github.com/sardana-org/sardana/issues/1080))
* DESY
	- problems with hanging scans, usually caused by devices
	- ~~timescan is not working with general hooks~~
		- ~~when hook is activated it produces an error~~
		- ~~by design, `pre-acq` is called only once~~
		- the problem was caused by custom version used at DESY

## 3. Overview of current and planned development
* SEP2 ([#775](https://github.com/sardana-org/sardana/pull/775))
	- HDF5 virtual data sets can be used as links to actual data
	- the number of data points needs to be known in advance
	- normal dataset with URIs can be created and then moved to virtual at the end of the scan (`end_record_list`)
	- documentation is missing
	- Dummy2DController does not support all available synchronization types
	- planned for July
* CI for Windows ([#1078](https://github.com/sardana-org/sardana/pull/1078))
	- Linux on Docker - available only in paid AppVeyor plans
	- PyTango DatabaseDS will simplify setup
		- it doesn't work with latest PyTango ([pytango/#266](https://github.com/tango-controls/pytango/issues/266))
		- Antoine knows something about this issue
* Roadmap for Python3 support ([#1089](https://github.com/sardana-org/sardana/issues/1089))
	- first integrate SEP2, non-WIP PRs and as many WIP PRs as possible
	- check what was done in Taurus
	- evaluate `six` vs. `futurize` vs. any other porting library
	- identify possible problems with `str` vs. `bytes`
	- ESRF will need Python 3 enabled MacroServer this summer

## 4. Jan19 release summary
* memory problems with testsuite, solved my reducing number of created elements
* problem with creating news on Tango website
* next release (Jul19) handled by Teresa and Antonio

## 5. Sardana presence on upcoming events
* Docs Camp
	- can be organized at DESY after Tango Meeting
	- 2 days (6-7 June)
* Workshop
	- last time it was an introduction to Sardana

## 6. Any other business
* Spock console as Qt widget
	- jupyter
	- [qtspock](https://github.com/DESY-P02-1/qtspock)

## 7. Next meeting on May 16th 14:00. Organized by Zibi.
