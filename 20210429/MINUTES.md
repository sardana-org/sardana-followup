# Minutes from Sardana Follow-up Meeting - 2021/04/29

Held on 2021/04/29 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Johan Forsberg, SOLARIS - Michal Piekarski

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
    - Yes, the questionnaire is now officially closed. No more answers will be accepted.
2. Discussion about _Bug squashing party_ - Virtual meeting based on the questionnaire's results
    - The event will take 3 consecutive days, only mornings
    - [ ] Zibi will prepare a poll to select the best dates.
3. Urgent user problems/issues - Round table
   - ALBA (not really urgent issues)
     - Next beamline migrated to Sardana 3
       - They suffer from slow Taurus GUI due to the massive amount of events coming from motors 25 per s from 8 motors.
       - Tango event change criteria can not be used - another DS requires this frequency of events
     - Macro output unicode extended characters crashes macroserver [#1553](https://github.com/sardana-org/sardana/issues/1553)
     - one-point scan [#1303](https://github.com/sardana-org/sardana/issues/1303)
   - DESY, MAXIV and SOLARIS: no update
    
4. Review pending points from the previous meeting
    - From the last meeting
        - [ ] MacroServer startup hook (that would be called automatically after starting the server - an opposite to the atexit)
            - Should we create a feature request for that?
            - At DESY they use this kind of hooks which are integrated in the Sardana startup procedure
            - [ ] Zibi will create a feature reqeust. 
        - [ ] Alba EM plugin - Alba asks MAX IV to check the PR
             - [ ] Johan will take a look on the PR
        - [ ] Wrong time estimation in continuous scans reported by beamline scientists - calculation methods need to be reviewed (as we show it to the users
        it needs to be accurate) 
              - Not high priority for ALBA anymore to review these calculations.
        - [ ] Zibi will update on "Cannot recreate measurement group with same name" [#1528](https://github.com/sardana-org/sardana/issues/1528)
              - No update
     - From the previous meetings:
        - [ ] Before starting the scan, Sardana should verify the states of measurement channels. 
            _ No update
        - [ ] Alba propose examples on how to program without on_stop() and on_abort() Macro methods.
            - No update - To be removed from the list
        - [ ] Shutter integration in continuous scans: status update
            - No update - To be removed from the list
        - [ ] MaxIV beats configuration status: update from Alejandro's work
            - there are some unsolved issues with distinguishing timestamps (on the level of milisecs) in Sardana logs by Elastic - more investigation is needed
            - Alejadnro uploaded his work to the [ELK project](https://github.com/sardana-org/ELK) 
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
            - MAX IV created a script (called Sherlock) to check Pool configuration - it check if all dependent elements exist (by ID)
            - still in development - showing missing elements aliases instead of just IDs might be a nice feature
            - Could we add Sherlock script to the plugins catalogue?
            - In progress - let's see if for the next one the project could be made public
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
            - No update - to be removed from the list.
        - [x] Verify if Sardana axis/controller attribute are memorized by default
            - Yes, axis/controller attributes are memorized by default.
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
            - No update
    
5. Sardana release Jan21
   - Tests on Windows and Debian 10 - OK
   - Tests on Debian 9 (almost finished) and CentOS 7.7 - in progress
   - What with _singularity_ (MAXIV environment)?
     - We won't wait for these test.
     - MAXIV is starting to use conda environments directly.  
   - Next step: write newsletter and review if all relevant changes are in the docs.
     - Zibi will write the newsletter
    
6. Overview of current developments / PR distribution
    - Macro plots appear twice in QtSpock [#1570](https://github.com/sardana-org/sardana/issues/1570)
      - Bug or feature?
        - all clients could show that there is something running
        - it should be consistent between the clients
        - what about the macro buttons? all of them change colours when a macro is run on a Door?
    - Create controller from a Macroserver with two pools [#589](https://github.com/sardana-org/sardana/issues/589)
       - Design proposed. Any volunteers to work on that?
       - More than one Pool is used only at ALBA
    - Consider removing dtype from the measurement group configuration[#1561](https://github.com/sardana-org/sardana/issues/1561)
      - Anyone knows on recorders usign this information?
    - Refactor hooks for move macros [#1544](https://github.com/sardana-org/sardana/pull/1544)
    - Fix1537 move regscan to scans [#1540](https://github.com/sardana-org/sardana/pull/1540)
    - Last scan macro data http://github.com/sardana-org/sardana/issues/290#issuecomment-819440784
      - it is necessary to implement the last scan macro data.
    - sardana CLI [#286](https://github.com/sardana-org/sardana/issues/286)
      - Anyone volunteering to work on this? Would allow us to remove annoying taurus log messages when launching expconf, showscan in Spock.
       - [ ] Johan will try to work on that. Thanks!
    - Not possible to call mAPI methods (macro API) after stopping/aborting a macro (SF#9) [#10](https://github.com/sardana-org/sardana/issues/10)
    - Execute post-scan also in case of stop, abort and exception [#1538](https://github.com/sardana-org/sardana/pull/1538)
    - Give priority to General Conditions [#1481](https://github.com/sardana-org/sardana/pull/1481) 
      - will be necessary for DESY soon (their solution does not work with Python 3)
7. Migration to gitlab and rename master branch to main/stable.
   - To be done right after the release?
   - Mention it in the release announcement?
     - send another email right after the release announcing the migration
8. AOB
- 27.05.2021 next meeting organized by Teresa (DESY).
