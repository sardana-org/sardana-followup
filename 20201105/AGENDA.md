# Sardana Follow-up Meeting - 2020/11/05

To be held on 2020/11/05 at 14:00 by SOLARIS

## Agenda

1. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - Feedback from the institutes
    - Bug squashing party - Virtual meeting based on questionnaire's results (November-December)?
2. Urgent user problems/issues - Round table
    - Sardana motors archiving at HDB++ ([#1429](https://github.com/sardana-org/sardana/issues/1429))
    - Controllers API ([#1430](https://github.com/sardana-org/sardana/issues/1430))
    - ?
3. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] MAX IV: Timestamp issue [#1371](https://github.com/sardana-org/sardana/issues/1371)
        - [ ] SOLARIS: Cannot stop multiple motors movement in backlash direction [#1421](https://github.com/sardana-org/sardana/issues/1421)
        - [ ] MBI: - Issue with API event timeout [#1417](https://github.com/sardana-org/sardana/issues/1417)
        - [ ] IPANEMA: - Migration to sardana 3 issue [#1410](https://github.com/sardana-org/sardana/issues/1410)
    - From previous meetings:
        - [ ] How to make scans depending on the status of the beam - organize a dedicated meeting to unify the existing solutions (Requirements must be documented)
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
        - [ ] MAX IV will provide a docker image to add to CI.
        - [ ] Shutter integration in continuos scans: status update.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible). 
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update.
4. Overview of current developments / PR distribution
    - ?
5. AOB
    - Experience with Sardana channel on Slack so far? 
        - Communication and notification system tests.
