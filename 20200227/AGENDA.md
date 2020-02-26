# Sardana Follow-up Meeting - 2020/01/16

To be held on 2020/02/27 at 14:00

## Agenda

1. Urgent user problems/issues - Round table
2. Review pending points from the previous meeting
    - TODO: add points from the 20200116 meeting whenever minutes are available
    - [ ] (Pseudomotors not reaching positions) They will check if the above suggestions (either in Sardana or in the icePAP itself) explain the problem.
    - [ ] (Software limits not checked properly) Juliano will check, if this issue is solved.
    - [ ] We agree in accepting SEP16, Zibi will send some e-mail about this.
    - [ ] (Missing default attribute values on Pool start) Zibi will talk to Henrik to clarify the use cases that he has in mind.
    - From previous meeting:
        - [ ] Zibi will try the MaxIV beats configuration and put it in the wiki afterwards
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
        - [ ] Problem with CT acquisition, the values are shifted, problem solved by checking the state in ReadOne. Problem reproducible only on one beamline, but the issue should be created anyway
            - For the moment was considered as high priority only for ALBA.
        - [ ] Newsletter: Add few words on Python3
        - [ ] Reproduce problems with Sardana Workshop on buster -> it could be related to the problem with the limits
            described above. The problem arised in slit scans, where attribute proxies were created and not used
            any more. The scans were hanging. It has to be further investigated.
        - [ ] Configure CI on buster
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
