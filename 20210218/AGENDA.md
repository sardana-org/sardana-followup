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
    - ALBA
        - Allow to use ScanDir, ScanFile and channel name in value_ref_pattern - [#1500](https://github.com/sardana-org/sardana/issues/1500)
        - Pool does not start if controller code is not available and controller's channels belong to the measurement group - [#1499](https://github.com/sardana-org/sardana/issues/1499)
        - Add the possibility to perform a continuous scan with a single point [#1501](https://github.com/sardana-org/sardana/issues/1501)
        - Wrong PseudoMotor first movement after externally changing physical motor [#1502](https://github.com/sardana-org/sardana/issues/1502)
        - Motion hangs when moving a motor group up to hardware limit [#1503](https://github.com/sardana-org/sardana/issues/1503)
5. Review pending points from the previous meeting
    - Growing list of pending points. What we should do about it?
    - From the last meeting:
        - [ ] showscan is broken in spock, Zibi will work on that.
        - [ ] macros running in paralell in two doors miss events, the problem comes probably from    Tango. Ex. one macro moves a motor and the other in other door run acquisition for the detector suscribing to events, this hangs the macroserver. Zibi will create an issue, it is reported to Tango/PyTango.
        - [ ] finishing migration to sardana3. Problems discussed with Zibi. There were configuration problems, due to the latency time of the controllers. A PR was proposed and it is merged. Zibi will add this to the documentation.
        - [ ] increasing the use of macros and of submacros in macros using the return value. Daniel thinks that it is a bit overload how to do it now. He asks if it would be possible to simply call a macro and get the value. Zibi will check the possibilities already available. At MBI it is used: `self.execMacro("twice 1").getResult()`
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
    - Add script to upgrade mntgrp from Sardana 2 to Sardana 3 - [#1488](https://github.com/sardana-org/sardana/pull/1488)
    - WIP: Add hook execution logging - [#1496](https://github.com/sardana-org/sardana/pull/1496)
    - WIP: Make Sardana storage Tango independent - [#1495](https://github.com/sardana-org/sardana/pull/1495)
    - WIP: Add RoI pseudo counters [#1482](https://github.com/sardana-org/sardana/pull/1482)
    - WIP: Generic data recorder [#1478](https://github.com/sardana-org/sardana/pull/1478)
    - Sardana upload to conda-forge
    - Shape is read only axis parameter
    - Documentation was improved: SEP2 and SEP18
    - All GUI related issues were marked with a label - soon a student from ALBA  - Gabriel will start working on them


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

