# Minutes from the Sardana Follow-up Meeting - 2019/10/24

Held on 2019/10/24 at 14:00

Participants: ALBA - Zbigniew Reszela and Marc Rosanes, DESY - Teresa Núñez, MAXIV - Antonio Milán, SOLARIS - Grzegorz Kowalski

1. Urgent user problems/issues - Round Table 
   * MAXIV
       * fscan does not work (priority); for Grzegorz it worked in spock a year ago or so 
       * for hangs at nanoMAX should help 2.8.3 hotfix 
   * ALBA
       * BL09 upgrade to Python3 
           * problems with MotorInterface - increase of threads in the Pool
               * could be due to DeviceProxies to internal devices of the Pool?
               * similar problems seen by Solaris but on Python 2
           * problems with storing HDF5 in NFS 
       * Necessity to use secret passwords in macros [#1219](https://github.com/sardana-org/sardana/issues/1219), currently not a priority.
       * Complex macro execution GUIs: settings with REDIS [#1200](https://github.com/sardana-org/sardana/pull/1200)
       * Continuous scans when motor velocity exceeds the maximum limit - increase the dead time and slow down the motor [#1217](https://github.com/sardana-org/sardana/pull/1200)
       * File Beats with custom module for MxCube application, anyone developed a similar module for Sardana
           * [ ] Antonio will share MaxIV beats configuration
   * SOLARIS
       * Pool hanging when using motor for Kepco Power Supply, could hang when parsing the power supply
       * [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
   * DESY
       * Ctrl+C problem (happens most of the times with Lamda and Pilatus) maybe related to [#978](https://github.com/sardana-org/sardana/issues/978) (priority)
2. Review pending points from the previous meeting
   - it is a good idea to maintain this point in the agenda
   - [ ] Review pending points from the previous meetings and add it to this section for the next one
   
   Points pendinf from the previous meeting
   - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
   - [ ] Problem with CT acquisition, the values are shifted, problem solved by checking the state in ReadOne. Problem reproducible only on one beamline, but the issue should be created anyway
        - For the moment was considered as high priority only for ALBA.
   - [x] Snap macros: names should be changed to follow other macros scheme
   - [ ] Newsletter: Add few words on Python3
   - [ ] Questionnaire   
3. Overview of current developments / PR distribution
    * SEP16 ([#726](https://github.com/sardana-org/sardana/pull/726))
    * MultiDeviceTestContext ([tango-controls/pytango#314](https://github.com/tango-controls/pytango/pull/314))
    * Pending PR (QtSpock, MacroID, Redis, etc...)
4. Sardana Workshop @ ICALEPCS2019
   - TODOs:
        - [ ] Configure CI on buster
        - [ ] Reproduce problems with Sardana Workshop on buster
5. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
   - Google Forms seems to be enough, but we are open for other proposals.
   - Examplary questions for [acquistion and motion](https://hackmd.io/@JsXMWaPlRri6iWJcBA8f-A/BypraXAKH)
        - used tags:
            - bool - question yes/no
            - multi - multiple options
            - open - open question
            - new - question about an enhancement proposal
   - We need to reserve place for open questions at the end of the secion e.g. Which other feature is missing?
   - Questionnaire will also ask about about popularity of feature requests  
   - We foresee that this questionnaire will be filled by both the scientist and the control engineer.
   - We will continue on the next follow-up meeting.
6. Discussion about Newsletter ([#32](https://github.com/sardana-org/sardana-followup/issues/32))
   - For the moment let's continue on the Wiki and then, before the release, we will move it to the final destination.
7. AOB
   - Next meeting on 21.11.2019 will be organized by Teresa.
