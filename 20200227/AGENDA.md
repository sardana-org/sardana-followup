# Sardana Follow-up Meeting - 2020/02/27

To be held on 2020/02/27 at 14:00

## Agenda

1. Urgent user problems/issues - Round table
2. Review pending points from the previous meeting
    - [ ] (Software limits not checked properly) Should we couple `steps_per_unit` with the limits?
    - [ ] What about SOLARIS involvement in the Sardana project?
    - From previous meeting:
        - [ ] (Pseudomotors not reaching positions) Need status update from the control group.
        - [ ] (Missing default attribute values on Pool start) Further investigation needed. It should be decoupled from memorized attributes and memorized value should be preferred.
        - [ ] Zibi will try the MaxIV beats configuration and put it in the wiki afterwards
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
        - [ ] (Newsletter: Add few words on Python3) It will be delayed to add also materials from training at ALBA.
        - [ ] Reproduce problems with Sardana Workshop on buster -> it could be related to the problem with the limits
            described above. To be fixed before Tango Meeting
        - [ ] (Configure CI on buster) Problems with test suite on Python 3.6.
3. Overview of current developments / PR distribution
    * How Tango issues affects Sardana?
        * https://github.com/tango-controls/pytango/issues/292 and https://github.com/tango-controls/cppTango/issues/686
        * https://github.com/tango-controls/pytango/issues/307 and https://github.com/sardana-org/sardana/pull/1298
    * Several PMTV and macroexecutor/sequencer improvement PRs
    * showscan online improvements
    * Jan20 release
    * ...
4. Sardana Meeting satellite to Tango Meeting 2020?
5. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
6. AOB
