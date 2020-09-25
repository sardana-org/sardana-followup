# Sardana Follow-up Meeting - 2020/09/25
To be held on 2020/09/25 at 10:00
## Agenda
1. Sardana v3 release summary
2. Urgent user problems/issues - Round table
3. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] How to make scans depending on the status of the beam - organize a dedicated meeting to unify the existing solutions.
        - [ ] problems with fscan with virtual motors, an issue will be created if needed
    - From previous meetings:
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
          MAX IV and DESY need to test and review the new implementation.
        - [ ] MAX IV will provide a docker image to add to CI.
        - [ ] Shutter integration in continuos scans: status update
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
        - [ ] Few words on Python3 in Newsletter: status update
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
4. Overview of current developments / PR distribution
    - ?
5. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
6. Bug squashing party (November-December)
7. Demo QtSpock
8. AOB
    - Your experience with Sardana channel on Slack so far?
