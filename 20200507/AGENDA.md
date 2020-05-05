# Sardana Follow-up Meeting - 2020/05/05

To be held on 2020/05/07 at 14:00

## Agenda

1. Urgent user problems/issues - Round table
2. Review pending points from the previous meeting
    - [ ] What about SOLARIS involvement in the Sardana project?
    - From previous meeting:
        - [ ] Alba beamlines migration to python 3: status update
        - [ ] Increase of memory consumption in Pool and Macroserver: status update
        - [ ] Shutter integration in continuos scans: status update
        - [ ] Pseudomotors not reaching positions: need status update from Solaris control group.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
        - [ ] Few words on Python3 in Newsletter: status update
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
3. Overview of current developments / PR distribution
        - [ ] 2nd Ctrl+C abort the macro: status update
    * How Tango issues affects Sardana?
        * https://github.com/tango-controls/pytango/issues/292 and https://github.com/tango-controls/cppTango/issues/686
        * https://github.com/tango-controls/pytango/issues/307 and https://github.com/sardana-org/sardana/pull/1298
    * Several PMTV and macroexecutor/sequencer improvement PRs
    * showscan online improvements
    * Jan20 release:
        * sardana-org/sardana#1315
    * ...
4. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
5. AOB
