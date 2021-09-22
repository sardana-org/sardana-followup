# Sardana Follow-up Meeting - 2021/09/23

To be held on Thursday 2021/09/23 at 14:00

## Agenda

1. Presentation by Teresa of the Sardana configuration tool used at DESY.

2. Urgent user problems/issues - Round table

3. Review pending points from the previous meeting
     - From previous meetings:
        - [ ] MacroServer startup hook (that would be called automatically after starting the server - an opposite to the atexit)
              - Zibi wanted to create a PR
        - [ ] Wrong time estimation in continuous scans reported by beamline scientists - calculation methods need to be reviewed (as we show it to the users
        it needs to be accurate) 
              - Not high priority for ALBA anymore to review these calculations.
        - [ ] MaxIV beats configuration status:
            - there are some unsolved issues with distinguishing timestamps (on the level of milisecs) in Sardana logs by Elastic - more investigation is needed
        - [ ] Users can break Sardana by messing with configuration in Tango DB:
     	    - status of the diagnostics script
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
      
4. Overview of current developments / PR distribution
    - sardana CLI [#286](https://github.com/sardana-org/sardana/issues/286)
      - Johan wanted to work on that
    - General Conditions [#1481](https://github.com/sardana-org/sardana/pull/1481)
    
5. Migration to gitlab and rename master branch to main/stable.

6. AOB
