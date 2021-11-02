# Sardana Follow-up Meeting - 2021/11/04

To be held on Thursday 2021/11/04 at 14:00

## Agenda

1. Presentation by Marc from ALBA of the Sardana integration with the Jupyter Lab

2. Presentation by Tomek from SOLARIS of the Vue Spock

3. Presentation by MAXIV of the `dsconfig` tool in the context of Sardana

4. Urgent user problems/issues - Round table

5. Review pending points from the previous meetings
     - From last meeting:
        - [ ] Issue at MAX IV related to ADLINK controller from ALBA, related to the State. Seems this is only in use at some specific place at ALBA. 
            - Zibi will check with them.
        - [ ] Exotic problem with stateless subscriptions in PyTango that can cause issues in "fast dummy motor controller". Happens when Taurus tries to subscribe but fails. Can be caused by changing event config. No decision on how to proceed.
        - [ ] `self.<macro name>` exceptions are uninformative.
        - [ ] Scans using two different pools together experience hangs. Perhaps some cases are related to state attribute polling.
        - [ ] Issue with Ctrl-C in spock in latest Sardana versions. The old behavior worked nicely with IPython, e.g. running macros in a loop, but due to how the signal is caught this no longer works.
        - [ ] Problem with pseudocounters of pseudocounters. They work when first created, but not later (e.g. after restart). There is some problem with the order in which they get created.
     - From previous meetings:
        - [ ] MacroServer startup hook (that would be called automatically after starting the server - an opposite to the atexit)
              - Zibi wanted to create a PR
        - [ ] Users can break Sardana by messing with configuration in Tango DB:
     	    - status of the diagnostics script
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
        - [ ] GUIs sardanaeditor and "showscan offline" will likely be removed from sardana as a result of low interest in the sardana user survey. Zibi will make a PR.
        
6. Overview of current developments / PR distribution
    
7. Migration to gitlab and rename master branch to main/stable.
    - From the last meeting
        - Mainly Carlos and Benjamin will perform the migration 
        - Carlos will make announcement, leaving at least two weeks for users to respond
        - Bunch of other things to also migrate
        - Documentation build is currently broken anyway

8. Sardana release 3.2 (Jul21 milestone)
    - From the last meeting
        - Need to wait for Taurus to make a release ~2 weeks.
        - Solaris and DESY are supposed to handle this release
        - The bug squashing party merged an issue that also requires some discussion
        - [ ] Stored start-time should be when the scan starts, not when the macro starts (Henrik)
        - Various things left open from the bug squashing party for the future.

9. AOB
