# Minutes from Sardana Follow-up Meeting - 2020/09/25
To be held on 2020/09/25 at 10:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAX IV - Aureo Freitas, SOLARIS - Michael, MBI - Daniel Schick and IPANEMA - Marcuane

## Minutes
1. Sardana v3 release summary
  * MAX IV deployed in one beamline.
  * SOLARIS will wait for more time, migrating the plugins yet.
  * DESY is running develop version in some beamlines.
  * MBI is running develop version in some places as well.
  * ALBA running python3 version for several months but running the develop version yet.
  * All facilies will migrate for the official release soon.
2. Urgent user problems/issues - Round table
  - MAX IV: 
      - working in hybrid scan trigger gate (PandaBOX) implemented, python3 migration of another beamline and new recorder one file per scan.
      - Will organized a new meeting to treath how to do the multiple frames per step scan points.
      - Timestamp issue [#1371](https://github.com/sardana-org/sardana/issues/1371) - No update.
      - Migrate sardana plugins to github. Use pub maxiv repo until that: [repo](http://pubrepo.maxiv.lu.se/rpm/el7/x86_64/)
  - SOLARIS: 
      - Cannot stop multiple motors movement in backlash direction [#1421](https://github.com/sardana-org/sardana/issues/1421) - Need to review, probably a bug.
  - DESY: 
      - Nothing to report, working on python 3 migration.
  - MBI: 
      - has a hook in prescan hook which will aquire two frames per scan and generate two files.
      - Issue with API event timeout [#1417](https://github.com/sardana-org/sardana/issues/1417) - Tests in progress.
      - Happy to use raspberry pi as sardana clients.
      - [MBI git repo](https://github.com/MBI-Div-B)
  - ALBA: 
      - Finished beamline 11 to python3 and migrating beamline 29 to python3.
      - Improvements plugin catalogue.
  - IPANEMA:
      - When sardana 3.0.3 will be available on debian packages? ALBA will make it available soon.
      - Migration to sardana 3 issue [#1410](https://github.com/sardana-org/sardana/issues/1410).
      - Integrating equipments into sardana
3. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] How to make scans depending on the status of the beam - organize a dedicated meeting to unify the existing solutions. Status: To be handle in slack channel and issues thread [#1304](https://github.com/sardana-org/sardana/issues/1304). Requirements must to be documented.
        - [ ] problems with fscan with virtual motors, an issue will be created if needed. Status: No need anymore.
    - From previous meetings:
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
          MAX IV and DESY need to test and review the new implementation. No status update!
        - [ ] MAX IV will provide a docker image to add to CI. No status update!
        - [ ] Shutter integration in continuos scans: status update. No status update!
        - [ ] MaxIV beats configuration status: update from  Alejandro's work. No status update!
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible). No status update!
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that. No status update!
        - [ ] Few words on Python3 in Newsletter: status update. Done !
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update. Urgent for ALBA but no status update maybe migration to Debian 10!
4. Overview of current developments / PR distribution
    - https://github.com/sardana-org/sardana/projects/7
    - Scope to be defined: need to be based in questionary. New meeting will be called about it!
    - Link 3.0.3 release issues to that and maybe a hotfix release will be necessary.
5. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - All instituites will foward the questionary with beamlines and control group.
    - Ask the control system engineer to fill the questionary with beamline scientits 
6. Bug squashing party (November-December)
    - Virtual meeting based on questionary results (Look topic 4).
7. Demo QtSpock
8. AOB
    - Your experience with Sardana channel on Slack so far? 
        - Continue to evaluate slack channel until next follow up meeting.
        - Test communication notification system.

* Next follow-up meeting will be organized for SOLARIS - Michael and will be at November 5th.
