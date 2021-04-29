# Sardana Follow-up Meeting - 2021/04/29

To be held on 2021/04/29 at 14:00

## Agenda

1. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
  - No new answers from MaxIV (currently 4 of them) since the last meeting
  - We gathered in total - 42 answers - many thanks to all!
    - ALBA - 16 answers (6 from labs)
    - DESY - 15 answers
    - IPANEMA - 1 answer
    - MaxIV - 4 answers
    - MBI - 3 answers
    - SOLARIS - 1 answer
    - Unknown - 2 answers
  - Are we closing the questionnaire?
2. Discussion about _Bug squashing party_ - Virtual meeting based on the questionnaire's results
3. Urgent user problems/issues - Round table
4. Review pending points from the previous meeting
    - From the last meeting
        - [ ] MacroServer startup hook (that would be called automatically after starting the server - an opposite to the atexit)
              - Should we create a feature request for that?
        - [ ] Alba EM plugin - Alba asks MAX IV to check the PR
        - [ ] Wrong time estimation in continuous scans reported by beamline scientists - calculation methods need to be reviewed (as we show it to the users
        it needs to be accurate) 
              - Not high priority for ALBA anymore to review these calculations.
        - [ ] Zibi will update on "Cannot recreate measurement group with same name" [#1528](https://github.com/sardana-org/sardana/issues/1528)         
     - From the previous meetings:
        - [ ] Before starting the scan, Sardana should verify the states of measurement channels.
        - [ ] Alba propose examples on how to program without on_stop() and on_abort() Macro methods.
            - No update
        - [ ] Shutter integration in continuous scans: status update
            - No update
        - [ ] MaxIV beats configuration status: update from Alejandro's work
            - there are some unsolved issues with distinguishing timestamps (on the level of milisecs) in Sardana logs by Elastic - more investigation is needed
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
            - MAX IV created a script (called Sherlock) to check Pool configuration - it check if all dependent elements exist (by ID)
            - still in development - showing missing elements aliases instead of just IDs might be a nice feature
            - Could we add Sherlock script to the plugins catalogue?
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
        - [ ] Verify if Sardana axis/controller attribute are memorized by default
            - Yes, axis/controller attributes are memorized by default
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
    
5. Sardana release Jan21
   - Tests on Windows and Debian 10 - OK
   - Tests on Debian 9 and CentOS 7 - in progress
   - What with _singularity_ (MAXIV environment)?
   - Next step: write newsletter and review if all relevant changes are in the docs.  
    
6. Overview of current developments / PR distribution
    - Macro plots appear twice in QtSpock [#1570](https://github.com/sardana-org/sardana/issues/1570)
      - Bug or feature?
    - Create controller from a Macroserver with two pools [#589](https://github.com/sardana-org/sardana/issues/589)
      - Design proposed. Any volunteers to work on that?
    - Consider removing dtype from the measurement group configuration [#1561](https://github.com/sardana-org/sardana/issues/1561)
      - Anyone knows on recorders usign this information?
    - Refractor hooks for move macros [#1544](https://github.com/sardana-org/sardana/pull/1544)
    - Fix1537 move regscan to scans [#1540](https://github.com/sardana-org/sardana/pull/1540)
    - Last scan macro data http://github.com/sardana-org/sardana/issues/290#issuecomment-819440784
    - sardana CLI [#286](https://github.com/sardana-org/sardana/issues/286)
      - Anyone volunteering to work on this? Would allow us to remove annoying taurus log messages when launching expconf, showscan in Spock.
    - Not possible to call mAPI methods (macro API) after stopping/aborting a macro (SF#9) [#10](https://github.com/sardana-org/sardana/issues/10)
    - Execute post-scan also in case of stop, abort and exception [#1538](https://github.com/sardana-org/sardana/pull/1538)
    - To be filled during the meeting...
    
7. Migration to gitlab and rename master branch to main/stable.
   - To be done right after the release?
   - Mention it in the release announcement? 
    
8. AOB
