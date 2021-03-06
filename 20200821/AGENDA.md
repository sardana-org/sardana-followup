# Sardana Follow-up Meeting - 2020/08/21

To be held on 2020/08/21 at 11:00

## Agenda

1. Urgent user problems/issues - Round table
2. Review pending points from the previous meeting
    - [ ] Add migration guide for Sardana 2 -> Sardana 3 to
          the [docs](https://sardana-controls.org/devel/guide_migration.html)
    - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
          MAX IV and DESY need to test and review the new implementation.
    - [ ] MAX IV will provide a docker image to add to CI.
    - From previous meetings:
        - [ ] What about SOLARIS involvement in the Sardana project? 
        - [ ] Shutter integration in continuos scans: status update
        - [ ] Pseudomotors not reaching positions: need status update from Solaris control group.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
        - [ ] Few words on Python3 in Newsletter: status update
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
3. Overview of current developments / PR distribution 
    * Jan20 release:
        - skip Jan20 milestone and move issues to Jul20 milestone
        - review milestone
        - plan release
    * ...
4. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - Any feedback from your colleagues?
5. SEP19 ([#1328](https://github.com/sardana-org/sardana/pull/1328))
6. Demo 'Scan statistics'
7. AOB
