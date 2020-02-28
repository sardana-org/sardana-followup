# Minutes from the Sardana Follow-up Meeting - 2019/01/16

Held on 2019/01/16 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Juliano Murari, SOLARIS - Grzegorz Kowalski

1. Urgent user problems/issues - Round table
    - SOLARIS - nothing, machine start up
    - DESY - nothing
    - MAX IV - nothing
    - ALBA:
        - migration to Py3
        - issue in PyTango with proxies (the same as on other beamline), caused by disposable TaurusAttributes
        - `DevLong64` is a problem on 32-bit machines
2. Review pending points from the previous meeting
    - [ ] (Pseudomotors not reaching positions) They will check if the above suggestions (either in Sardana or in the icePAP itself) explain the problem.
        - need status update from the control group
    - [X] (Software limits not checked properly) Juliano will check, if this issue is solved.
        - corner case with improper motor configuration
        - low resolution motor can reach software limit but still move
        - it can be reproduced only with wrong value for `steps_per_unit`
        - [ ] (new point) should we couple `steps_per_unit` with the limits?
        - there is an issue about this ([#9](https://github.com/sardana-org/sardana/issues/9))
    - [X] We agree in accepting SEP16, Zibi will send some e-mail about this.
        - done
    - [ ] (Missing default attribute values on Pool start) Zibi will talk to Henrik to clarify the use cases that he has in mind.
        - agreed solution ([#1236](https://github.com/sardana-org/sardana/pull/1236)) is not a way to go, further investigation needed
        - it should be decoupled from memorized attributes and memorized value should be preferred
    - From previous meeting:
        - [ ] Zibi will try the MaxIV beats configuration and put it in the wiki afterwards
            - no updates
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
            - no updates
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
            - no updates
        - [X] Problem with CT acquisition, the values are shifted, problem solved by checking the state in ReadOne. Problem reproducible only on one beamline, but the issue should be created anyway
            - For the moment was considered as high priority only for ALBA.
            - done
        - [ ] Newsletter: Add few words on Python3
            - no updates
            - it will be delayed to add also materials from training at ALBA
        - [ ] Reproduce problems with Sardana Workshop on buster -> it could be related to the problem with the limits described above. The problem arised in slit scans, where attribute proxies were created and not used any more. The scans were hanging. It has to be further investigated.
            - disposable `AttributeProxy` can create problems
            - no updates
            - to be fixed before Tango Meeting
        - [ ] Configure CI on buster
            - problems with test suite on Python 3.6
3. Overview of current developments / PR distribution
    - Jan20 release
        - first Py3-only release (3.0.0)
        - remove deprecated things, review changelogs, create and discuss a list of deprecations
        - console size: MAX IV probably affected ([#1246](https://github.com/sardana-org/sardana/pull/1246) for Py2)
        - new Ctrl+C related code is nice, but it does not solve the problem
            - it's still possible to hang the system
            - it adds new information for the user
            - it's not possible to abort a long sleep
        - some PRs and issues were added to the [release](https://github.com/sardana-org/sardana/milestone/7)
    - MG API
        - Roberto implemented API for all parameters except Synchronization which is out of scope of this PR
        - automatic tests are still missing
4. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - Google Forms are not so easy to create
    - all changes are in the repo
    - Google Forms are looking promising
5. AOB
    - Jan20 release meeting - 30.01.2020
    - next meeting: 20.02.2020 14:00 - organized by Zibi (date changed to 27.02.2020)
    - [ ] (new point) what about SOLARIS involvement in the Sardana project?
