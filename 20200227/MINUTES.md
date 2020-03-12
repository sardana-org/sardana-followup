# Minutes from the Sardana Follow-up Meeting - 2019/02/27

Held on 2020/02/27 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Juliano Murari, Aureo Freitas
## Agenda

1. Urgent user problems/issues - Round table
* DESY:
    * counter/timer controller which was accessing generic Tango Device
      where users provide the code. This specific implementation was accessing
      Amptek which was not ready. All this was causing scans to hang.
      The debugging process was very painful. Finally it is solved but still
      need to be clarified if there is something in the code to be fixed and
      how to improve the debugging.
      We could implement [sardana-org/sardana#793](https://github.com/sardana-org/sardana/issues/793)
      to mitigate the problem.
      * [ ] Zibi will review the last debug information from Thorsten.
    * shutdown period - no much to report
* MAXIV:
    * pseudo counter refactoring to use just 2 channels in progress
      [sardana-org/sardana#1287](https://github.com/sardana-org/sardana/issues/1287)
    * problem with continuous scans going too fast to retrieve the data from Lima
    * ini file which grows on the Taurus GUI in operation for long time.
      After the meeting Zibi proposed [sardana-org/sardana#1307](https://github.com/sardana-org/sardana/pull/1307).
* ALBA
    * BL01 - two macros running in parallel could cause problems
             [sardana-org/sardana#1291](https://github.com/sardana-org/sardana/issues/1291).
             Already fixed in [sardana-org/sardana#1298](https://github.com/sardana-org/sardana/pull/1298)
    * BL09 - problems with taurusGUI - already fixed in develop - latest taurus develop is fixing it. 
    * BL04
        * PyTango#292 problem - no usage of taurus.Devices for the moment
        * EnsureOmniThread necessary to run macros in two doors in parallel
          Already fixed in [sardana-org/sardana#1298](https://github.com/sardana-org/sardana/pull/1298)
        * Memory increases in ascanct - see investigation in [sardana-org/sardana#1095](https://github.com/sardana-org/sardana/issues/1095)
    * ID Pool & BL MacroServer communication between two separate networks
        * [ ] Juliano will share the code of the _proxy/mirror_ controller that they use
* Other
    * Question about two Pools connected to the same MacroServer - there are known limitations
      e.g. the measurement group can not have channels from different Pools, pseudo elements can
      not be based on elements from different Pools 
    * Shape column in the expconf is not user friendly if you change binning/ROI - see disucssion in
      [https://github.com/sardana-org/sardana/issues/1296](https://github.com/sardana-org/sardana/issues/1296)
    * Question on how to integrate hardware which needs power on and power off after the measurement?
      Maybe we need a _cleanup_ method in the controllers (similarly to the prepare).
      
2. Review pending points from the previous meeting
    - [ ] (Software limits not checked properly) Should we couple `steps_per_unit` with the limits?
        - Remove it from the pending points and tread in the backlog.
    - [ ] What about SOLARIS involvement in the Sardana project?
        - Grzegorz was not at the meeting hence no update.
    - From previous meeting:
        - [ ] (Pseudomotors not reaching positions) Need status update from the control group.
            - Grzegorz was not at the meeting hence no update.
        - [ ] (Missing default attribute values on Pool start) Further investigation needed. It should be decoupled from memorized attributes and memorized value should be preferred.
            - We could remove it from the pending points but first Aureo/Juliano will ask Henrik. 
        - [ ] Zibi will try the MaxIV beats configuration and put it in the wiki afterwards
            - [ ] Alejandro is working on that. Hopefully on the next meeting we will have something in the wiki.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
            - No update.
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
            - No update
        - [ ] (Newsletter: Add few words on Python3) It will be delayed to add also materials from training at ALBA.
            - [ ] materials are there, just put a link with the number of slides to be used
        - [ ] Reproduce problems with Sardana Workshop on buster -> it could be related to the problem with the limits
            described above. To be fixed before Tango Meeting
            - After the meeting Zibi had removed the AttributeProxy usage in the limits protection
              [sardana-org/sardana#1302](https://github.com/sardana-org/sardana/pull/1302)
        - [ ] (Configure CI on buster) Problems with test suite on Python 3.6.
            - [ ] no update
3. Overview of current developments / PR distribution
    * How Tango issues affects Sardana?
        * https://github.com/tango-controls/pytango/issues/292 and https://github.com/tango-controls/cppTango/issues/686
        * https://github.com/tango-controls/pytango/issues/307 and https://github.com/sardana-org/sardana/pull/1298
    * Several PMTV and macroexecutor/sequencer improvement PRs
    * showscan online improvements
    * 2nd Ctrl+C abort the macro
        * [ ] Meet Teresa and Zibi to live test it
    * Jan20 release
        * Taurus release - we will help with the tests
        * PR from the milestone,
            - measuremnt group configuration tests are in progress
            - MaxIV said they will have more time in the next weeks to work on the PR they were assigned
        * We will remove the deprecated features 
            * [ ] Zibi will propose an issue to discuss these deprecation warnings
        * Release process
4. Sardana Meeting satellite to Tango Meeting 2020
    * No official Sardana meeting will be held
    * Informal meeting (if there is an interest) could be held in parallel to the Executive Meeting.
    * It would be interesting to present Sardana status at Tango Meeting. Who could do it? Teresa offered her help.
6. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    * We presented the main sections of the questionnaire
    * The possibility to leave comments when one replies that he does not use a feature
      is missing.
    * We agreed that first we will fill the results based on some exemplary system as a test
      to see how easy it is to interpret the results using the resulting excell sheet.
      * [ ] Zibi will send the corrected questionnaire.   
7. AOB
    * Next meeting is planned for 26.03.2020 at 14:00.
