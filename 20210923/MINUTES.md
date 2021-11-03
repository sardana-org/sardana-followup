# Minutes from the Sardana Follow-up Meeting - 2021/09/23

To be held on Thursday 2021/09/23 at 14:00

Participants:
- MAXIV: Johan, Henrik, Vincent
- ALBA: Zbignew, Marc, Saida
- DESY: Teresa
- Max Born: Daniel

## Agenda

0. Zibi presented two students (Marc and Saida) working at ALBA, on some sardana configuration related projects.

1. Presentation by Teresa of the Sardana configuration tool used at DESY.
  - The tool is called "sardana-aio" (all-in-one)
  - Based on an XML file, listing everything that should go into the sardana config, 
    + controllers 
    + properties
    + measurement groups
    + default values (can be done with custom python code)
  - Validates that Tango devices are running and not in FAULT
  - A GUI is developed, and being taken into production

2. Urgent user problems/issues - Round table
   - MAX IV
     - [X] Ctrl-C crash at MAX IV related to reading State. Henrik made a MR: https://github.com/sardana-org/sardana/pull/1695
     - [ ] Issue at MAX IV related to ADLINK controller from ALBA, related to the State. Seems this is only in use at some specific place at ALBA. Zibi will check with them.
   - ALBA
     - [ ] Exotic problem with stateless subscriptions in PyTango that can cause issues in "fast dummy motor controller". Happens when taurus tries to subscribe but fails. Can be caused by changing event config. No decision on how to proceed.
     - [ ] `self.<macro name>` exceptions are uninformative.
     - Migration of final sardana 2 beamlines -> 3. 
     - [ ] Scans using two different pools together experience hangs. Perhaps some cases are related to state attribute polling. 
   - DESY
     - [X] Moving two pseudomotors belonging to same controller caused problems in sardana 3.1.3. This has been solved.
   - Max Born
     - [ ] Issue with Ctrl-C in spock in latest Sardana versions. The old behavior worked nicely with IPython, e.g. running macros in a loop, but due to how the signal is caught this no longer works.
     - [ ] Problem with pseudocounters of pseudocounters. They work when first created, but not later (e.g. after restart). There is some problem with the order in which they get created.
   
3. Review pending points from the previous meeting
     - From previous meetings:
        - [ ] MacroServer startup hook (that would be called automatically after starting the server - an opposite to the atexit)
              - Zibi wanted to create a PR
        - [X] Wrong time estimation in continuous scans reported by beamline scientists - calculation methods need to be reviewed (as we show it to the user it needs to be accurate) 
              - Not high priority for ALBA anymore to review these calculations.
              - Zibi created Issue #1692 about this.
        - [X] MaxIV beats configuration status:
            - there are some unsolved issues with distinguishing timestamps (on the level of milisecs) in Sardana logs by Elastic - more investigation is needed
            - Possibly there could be issues with log line ordering with only millisecond precision.
            - There is an ELK project in the sardana org somewhere.
        - [ ] Users can break Sardana by messing with configuration in Tango DB:
     	    - status of the diagnostics script
            - Demo of "sherlock" by Henrik/MAX IV https://gitlab.com/MaxIV/app-maxiv-sherlock
              + We could add checking of attribute event settings 
              + Should be listed in the Sardana plugins catalog!
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() 
            - How to deal with exceptions in the controllers: Review the docs?
            - Proposal for updating docs: https://github.com/sardana-org/sardana/issues/1693
            - Henrik/MAXIV will look into adding functionality to the IcePap controller to show motor OFF state.
        
     - New:
       - GUIs sardanaeditor and "showscan offline" will likely be removed from sardana as a result of low interest in the sardana user survey. Zibi will make a PR.

4. Overview of current developments / PR distribution
  - sardana CLI [#286](https://github.com/sardana-org/sardana/issues/286)
    - Johan wanted to work on that
  - General Conditions [#1481](https://github.com/sardana-org/sardana/pull/1481)
    - Still pending some other things, e.g. https://github.com/sardana-org/sardana/pull/1666
    
5. Migration to gitlab and rename master branch to main/stable.
  - Mainly Carlos and Benjamin will perform the migration 
    - Carlos will make announcement, leaving at least two weeks for users to respond
    - Bunch of other things to also migrate
  - Documentation build is currently broken anyway
   
6. Sardana release 3.2 (Jul21 milestone)
  - Need to wait for Taurus to make a release ~2 weeks.
  - Solaris and DESY are supposed to handle this release
  - The bug squashing party merged an issue that also requires some discussion
    - Stored start-time should be when the scan starts, not when the macro starts (Henrik)
  - Various things left open from the bug squashing party for the future.

7. AOB
  - Question from Vincent on what the conditions are for merging a PR.
    - Zibi: no formal conditions, but there should be a review. The demands depend on the nature of the PR. For some areas there are some de-facto experts that should at least have a look.
    - Reviewing including testing that it works.
    - Ideally, integrators from different institutes should be involved.
  
