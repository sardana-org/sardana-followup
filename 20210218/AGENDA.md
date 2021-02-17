# Sardana Follow-up Meeting - 2021/02/18

To be held on 2021/02/18 at 14:00

## Agenda

1. Lavue demo by Jan Kotanski (DESY)
2. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
  - Answers for all institutes?
  - Visualization of the result?
3. Discussion about Bug squashing party - Virtual meeting based on questionnaire's results
4. Urgent user problems/issues - Round table
    - MAX IV
        - Run hooks even if the scan fails.
        - Before starting the scan, Sardana should verify the states of measurement channels.
5. Review pending points from the previous meeting
    - Growing list of pending points. What we should do about it?
    - From the last meeting:
        - [ ] Post motor polling related issues in [#1431](https://github.com/sardana-org/sardana/issues/1431)
        - [ ] Find a way of doing stuff with hardware on the beginning and end of the acquisition in 0D (i.e switch on/off hardware) ([#1322](https://github.com/sardana-org/sardana/issues/1322))
            - PR should be posted for the discussion
            - adding `Start` method is a reasonable option
    - From the previous meetings:
        - [ ] SOLARIS: Cannot stop multiple motors movement in backlash direction [#1421](https://github.com/sardana-org/sardana/issues/1421). Status update. Zibi suggests to accept the current PR but create an new issue for distinguishing between stop and abort.
        - [ ] A discussion about the motor group devices arised, the possibility of avoiding the creation of the Tango devices was proposed by @tiagocoutinho (in the past it was already mentione in [sardana-org/sardana#1338](https://github.com/sardana-org/sardana/issues/1338#issuecomment-637646445).
        - [ ] How to make scans depending on the status of the beam - organize a dedicated meeting to unify the existing solutions (Requirements must be documented) - see discussion started in [#1450](https://github.com/sardana-org/sardana/issues/1450). Zibi and Teresa met and they will report.
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
        - [ ] MAX IV will provide a docker image to add to CI.
        - [ ] Shutter integration in continuos scans: status update.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible).
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update.
        - [ ] Teresa will investigate how do they store the ROI configuration (if store at all)
        - [ ]   macro plots in spock do not appear until macro finishes #166 - try with QtSpock.
        - [ ] Verify if Sardana axis/controller attribute are memorized by default.
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
        - [ ] Decouple attributes default values from memorized values #1458
            DESY, MAXIV agree on the changes; SOLARIS will answer later.
        - [ ] Recent comment from the DESY users: using hooks may get complicated, even if they
        are nice feature - Clarify exactly what it means


6. Overview of current developments / PR distribution
    - Problems for axis attributes with same name but different properties [#1436](https://github.com/sardana-org/sardana/issues/1436)
    - Allow SWMR mode and avoid flock problems with NXscanH5_FileRecorder [#1457](https://github.com/sardana-org/sardana/issues/1457). Carlos will review it.
    - Decouple attributes default values from memorized values [#1458](https://github.com/sardana-org/sardana/issues/1458)
    - SEP19. Update from Zbi.
    - Step scans burst/points_per_step parameter [#1450](https://github.com/sardana-org/sardana/issues/1450)
    - pre- and post-move hooks not available in mv macro [#1471](https://github.com/sardana-org/sardana/issues/1471). A propostion: add pre-mv and post-mv to mv, have sardana custom setting to  call them in a mv or not.
      Meanwhile work on general hooks with more granularity, add hooks to macros or groups of macros.
    - Access motor name of a mv or scans.
      It is proposed to add a motor attribute to all macros with pre/post-moves
    - PseudoCounters accessing pseudocounters.
      It does not work if sardana is reinitialized. It sounds like a bug.
      @dschick will try to reproduce the problem and report it as an issue.
    - 1D/2D shape should go out from the configuration. [#1466](https://github.com/sardana-org/sardana/pull/1466/files#diff-b4dc204bf8202495936aa3777355984035597d4d9da04f35dbe9342c312782a5R666). Already merged.
    - RoIs settings set in a file. A PR was merged.


7. Migration to gitlab. Travis is discontinuing the unlimited CI service for OSS projects [#1433](https://github.com/sardana-org/sardana/issues/1433).

8. Renaming of master branch to main.

9. Sardana release Jan21
   - Who are the release managers? Zbi and Michal.
   - Preselect milestone scope

   Solaris uses releases, the MBI will use them, so we decide that a release will be done.
   The milestones should be solved.
   https://github.com/sardana-org/sardana/milestone/8
   New issues could be added.

   The manual tests will be done in:
   debian9, debian10, centos, windows, singularity (wrappling a docker image build on top of the conda base image)

   Taurus will not do a release now.


10. AOB

