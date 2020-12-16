# Sardana Follow-up Meeting - 2020/12/16

To be held on 2020/12/16 at 11:00 by ALBA

## Agenda

1. Comments on the Sardana Status on Tango Virtual Meeting 2020 - presentation available on Wiki.
2. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - Feedback from the institutes
3. Bug squashing party - Virtual meeting based on questionnaire's results
4. Urgent user problems/issues - Round table
5. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] Post motor polling related issues in [#1431](https://github.com/sardana-org/sardana/issues/1431)
        - [ ] Find a way of doing stuff with hardware on the beginning and end of the acquisition in 0D (i.e switch on/off hardware) ([#1322](https://github.com/sardana-org/sardana/issues/1322))
            - PR should be posted for the discussion
            - adding `Start` method is a reasonable option
    - From the previous meetings:
        - [ ] SOLARIS: Cannot stop multiple motors movement in backlash direction [#1421](https://github.com/sardana-org/sardana/issues/1421)
        - [ ] How to make scans depending on the status of the beam - organize a dedicated meeting to unify the existing solutions (Requirements must be documented) - see discussion started in [#1450](https://github.com/sardana-org/sardana/issues/1450)
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
        - [ ] MAX IV will provide a docker image to add to CI.
        - [ ] Shutter integration in continuos scans: status update.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible). 
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update.
6. Overview of current developments / PR distribution
    - Problems for axis attributes with same name but different properties [#1436](https://github.com/sardana-org/sardana/issues/1436)
    - Travis is discontinuing the unlimited CI service for OSS projects [#1433](https://github.com/sardana-org/sardana/issues/1433)
    - Allow SWMR mode and avoid flock problems with NXscanH5_FileRecorder [#1457](https://github.com/sardana-org/sardana/issues/1457)
    - Decouple attributes default values from memorized values [#1458](https://github.com/sardana-org/sardana/issues/1458)
    - SEP19
7. AOB
    - Document preferred communication channels [sardana-followup#30](https://github.com/sardana-org/sardana-followup/issues/30)
        - Experience with Sardana channel on Slack so far? 
            -  Do we need it?
        - GitHub discussions - see [reszelaz/sardana discussions](https://github.com/reszelaz/sardana/discussions)
