# Sardana Follow-up Meeting - 2021/06/10

To be held on 2021/06/10 at 14:00

## Agenda

1. Discussion about _Bug squashing party_ - Virtual meeting based on the questionnaire's results
2. Urgent user problems/issues - Round table
3. Review pending points from the previous meeting
     - From previous meetings:
        - [ ] MacroServer startup hook (that would be called automatically after starting the server - an opposite to the atexit)
              - Zibi wanted to create a PR
        - [ ] Alba EM plugin
	      - Johan wanted to have a look to the PR
        - [ ] Wrong time estimation in continuous scans reported by beamline scientists - calculation methods need to be reviewed (as we show it to the users
        it needs to be accurate) 
              - Not high priority for ALBA anymore to review these calculations.
        - [ ] Zibi will update on "Cannot recreate measurement group with same name" [#1528](https://github.com/sardana-org/sardana/issues/1528) 
        - [ ] Before starting the scan, Sardana should verify the states of measurement channels.
        - [ ] MaxIV beats configuration status:
            - there are some unsolved issues with distinguishing timestamps (on the level of milisecs) in Sardana logs by Elastic - more investigation is needed
        - [ ] Users can break Sardana by messing with configuration in Tango DB:
	    - status of the diagnostics script
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
  
    
4. Overview of current developments / PR distribution
    - Macro plots appear twice in QtSpock [#1570](https://github.com/sardana-org/sardana/issues/1570)
      - Bug or feature?
    - Create controller from a Macroserver with two pools [#589](https://github.com/sardana-org/sardana/issues/589)
      - Design proposed. Any volunteers to work on that?
    - Consider removing dtype from the measurement group configuration [#1561](https://github.com/sardana-org/sardana/issues/1561)
      - Anyone knows on recorders usign this information?
    - Refractor hooks for move macros [#1544](https://github.com/sardana-org/sardana/pull/1544)
    - Last scan macro data http://github.com/sardana-org/sardana/issues/290#issuecomment-819440784
    - sardana CLI [#286](https://github.com/sardana-org/sardana/issues/286)
      - Johan wanted to work on that
    - Not possible to call mAPI methods (macro API) after stopping/aborting a macro (SF#9) [#10](https://github.com/sardana-org/sardana/issues/10)
    - Execute post-scan also in case of stop, abort and exception [#1538](https://github.com/sardana-org/sardana/pull/1538)
    - General Conditions [#1481](https://github.com/sardana-org/sardana/pull/1481)
    
5. Migration to gitlab and rename master branch to main/stable.

6. AOB
