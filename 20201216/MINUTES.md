# Minutes from the Sardana Follow-up Meeting - 2020/12/16

Held on 2020/12/16 at 11:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Aureo Freitas, SOLARIS - Michal Piekarski 

## Minutes

1. Comments on the Sardana Status on Tango Virtual Meeting 2020
    - it was OK
    - presentation available on Wiki.
3. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
  - Feedback from the institutes
      - 15 new answers from DESY - big thanks!
      - 1 updated answer from Solaris
      - Missing answers from MAXIV - (Zibi will try to help MAXIV e.g. by reviewing the questions together)
      - Extended the deadline till the next followup
      - Guifre offered help when working on visualization of the results
4. Bug squashing party (BSP) - Virtual meeting based on questionnaire's results
      - Still waiting for the results of the questionnaire.
      - Then we will decide the format of the BSP.
5. Urgent user problems/issues - Round table
    - General
        - update on windows python crash after exiting spock [#724](https://github.com/sardana-org/sardana/issues/724)
        - custom str data in H5 regression and how to store ROI info: [#774](https://github.com/sardana-org/sardana/issues/771)
            - [ ] Teresa will investigate how do they store the ROI configuration (if store at all)
        - change of TwoDExpChannel image/array size [#1296](https://github.com/sardana-org/sardana/issues/1296)
            - We need to remove shape from expconf
        - Multiple pseudo counters with different dimensionality of the same physical counter fail to initialize after pool restart [#1438](https://github.com/sardana-org/sardana/issues/1438)
            - Still pending to reply.
        - Allow for single file per scan (how to sync large hdf5 files) [#1452](https://github.com/sardana-org/sardana/issues/1452)
            - It was adviced to use pre-scan hooks to change the file
        - Accessing Tango from your macros question [#1453](https://github.com/sardana-org/sardana/issues/1453)
            - PR w was added with more details to the FAQ
    - DESY
        - During winter shutdown they will upgrade some beamlines to Sardana v3 (a little bit uncertain due to lockdown).
        - Not logging in 'prepare' method enhancement [#1435](https://github.com/sardana-org/sardana/issues/1435) - for the moment not priority.
    - MAXIV
        - macro plots in spock do not appear until macro finishes [#166](https://github.com/sardana-org/sardana/issues/166)
            - [ ] Try with QtSpock.
        - 1D used as Referable [#1445](https://github.com/sardana-org/sardana/issues/1445).
            - Work on this will need to start from adding Referable functionality to the 1D dummy controller.
            - For the moment not priority since they used 2D instead.
        - Stardana store memorized value for non-memorized values?
            - [ ] Verify if Sardana axis/controller attribute are memorized by default.
    - ALBA
        - Fix continuous readout of value references in hardware synchronized acquisition  bug [#1442](https://github.com/sardana-org/sardana/issues/1442) - this one later also affected MAXIV
            - Already fixed.
        - Spock does not have access to macros when PoolNames is wrong [#1447](https://github.com/sardana-org/sardana/issues/1447)
            - Not urgent.
        - Work being done on the 5th BL migration to Sardana v3 but won't probably be migrated in this winter shutdown.
    - SOLARIS
        - Preparing for migration of one of the BLs to Sardana v3 during the winter shutdown.
        - Hang scan due to the counter/timer controller timeout in StateOne()
            - [ ] How to deal with exceptions in the controllers: Review the [docs](https://sardana-controls.org/devel/howto_controllers/howto_controller.html#error-handling)
5. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] Post motor polling related issues in [#1431](https://github.com/sardana-org/sardana/issues/1431)
            - No update so far. SOLARIS already applied workaround to use Facede devices so they don't suffer it anymore.
        - [ ] Find a way of doing stuff with hardware on the beginning and end of the acquisition in 0D (i.e switch on/off hardware) ([#1322](https://github.com/sardana-org/sardana/issues/1322))
            - PR should be posted for the discussion
            - adding `Start` method is a reasonable option
            - No update.
    - From the previous meetings:
        - [ ] SOLARIS: Cannot stop multiple motors movement in backlash direction [#1421](https://github.com/sardana-org/sardana/issues/1421)
            - Pair-programming between Michal and Zibi is planned for the beginning of next year.
        - [ ] How to make scans depending on the status of the beam - organize a dedicated meeting to unify the existing solutions (Requirements must be documented) - see discussion started in [#1450](https://github.com/sardana-org/sardana/issues/1450)
            - No update.
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
            - No update
        - [ ] MAX IV will provide a docker image to add to CI.
            - No update
        - [ ] Shutter integration in continuos scans: status update.
            - MaxIV use hooks in step scan
            - In continuous scans still not defined how to do it.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
            - No update
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible).
            - No update
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
            - No update
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update.
            - No update
6. Overview of current developments / PR distribution
    - Problems for axis attributes with same name but different properties [#1436](https://github.com/sardana-org/sardana/issues/1436)
        - Pair-programming between Henrik and Zibi is pending.
    - Travis is discontinuing the unlimited CI service for OSS projects [#1433](https://github.com/sardana-org/sardana/issues/1433
        - No much work to be done if we go for GitHub Actions.
        - Waiting for Tango decission.
    - Allow SWMR mode and avoid flock problems with NXscanH5_FileRecorder [#1457](https://github.com/sardana-org/sardana/issues/1457)
        - Started using SWMR at DESY in PiLC Device Server (Sardana macros use these devices)
        - Jan's recorders are already storing with SWMR mode.
    - Decouple attributes default values from memorized values [#1458](https://github.com/sardana-org/sardana/issues/1458)
        - DESY, MAXIV agree on the changes
        - [ ] SOLARIS will answer later.
    - 2C Diffractometer not foreseen for development (Teresa even thinks it is not even in the HKL library).
    - SEP19
        - Fixing of the ~20 existing issues related to the plugin system will be in principle fixed only for the new plugin system based on entry points.
        - We all agreed on goinf for Option 2 (maintaining both plugins systems).
7. AOB
    - Document preferred communication channels [sardana-followup#30](https://github.com/sardana-org/sardana-followup/issues/30)
        - Experience with Sardana channel on Slack so far? 
        - GitHub discussions - see [reszelaz/sardana discussions](https://github.com/reszelaz/sardana/discussions)
        - We agreed to add to the documentation the following:
            - Official way of communication will be GitHub issues.
            - Mailing list will be for announcements. 
            - Slack #sardana channel in the tango-controls workspace will be just mentioned as a place where you can usually find the Sardana developers and which Sardana developers can use for internal communication.
    - Recent comment from the DESY users: using hooks may get complicated, even if they are nice feature
        - [ ] Clarify exactly what it means
        - Maybe related to using the same name of the hook but changing the implementation by many people?
    - Next meeting is scheduled for 2021-01-20 at 11:00 and will be organized by Teresa.
