# Sardana Follow-up Meeting - 2021/03/25

To be held on 2021/03/25 at 14:00

## Agenda

1. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
  - Answers for all institutes?
  - Visualization of the result?
  - MAX IV - what features are being used at different sub-systems in a sheet format
2. Discussion about Bug squashing party - Virtual meeting based on questionnaire's results
3. Urgent user problems/issues - Round table
4. Review pending points from the previous meeting
    - From the last meeting
        - [ ] Before starting the scan, Sardana should verify the states of measurement channels.
     - From the previous meetings:
        - [ ] macros running in paralell in two doors miss events, the problem comes probably from    Tango. Ex. one macro moves a motor and the other in other door run acquisition for the detector suscribing to events, this hangs the macroserver. Zibi will create an issue, it is reported to Tango/PyTango.
        - [ ] increasing the use of macros and of submacros in macros using the return value. Daniel thinks that it is a bit overload how to do it now. He asks if it would be possible to simply call a macro and get the value. Zibi will check the possibilities already available. At MBI it is used: `self.execMacro("twice 1").getResult()`
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
        - [ ] MAX IV will provide a docker image to add to CI.
        - [ ] Shutter integration in continuos scans: status update.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update..
        - [ ] Verify if Sardana axis/controller attribute are memorized by default.
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
6. Overview of current developments / PR distribution
    - Apply position formatting to the limits [#1530](https://github.com/sardana-org/sardana/pull/1530)
    - Add server_init_hook [#1532](https://github.com/sardana-org/sardana/pull/1532)
    - Respect timer/monitor passed in measurement group configuration [#1521](https://github.com/sardana-org/sardana/pull/1521)
    - Problems for axis attributes with same name but different properties [#1436](https://github.com/sardana-org/sardana/issues/1436)
    - Allow SWMR mode and avoid flock problems with NXscanH5_FileRecorder [#1457](https://github.com/sardana-org/sardana/issues/1457). Carlos will review it.
    - SEP19. Update from Zbi.
    - pre- and post-move hooks not available in mv macro [#1471](https://github.com/sardana-org/sardana/issues/1471). A propostion: add pre-mv and post-mv to mv, have sardana custom setting to  call them in a mv or not.
      Meanwhile work on general hooks with more granularity, add hooks to macros or groups of macros.
    - Add script to upgrade mntgrp from Sardana 2 to Sardana 3 - [#1488](https://github.com/sardana-org/sardana/pull/1488)
    - WIP: Add hook execution logging - [#1496](https://github.com/sardana-org/sardana/pull/1496)
    - WIP: Make Sardana storage Tango independent - [#1495](https://github.com/sardana-org/sardana/pull/1495)
    - WIP: Add RoI pseudo counters [#1482](https://github.com/sardana-org/sardana/pull/1482)
    - WIP: Generic data recorder [#1478](https://github.com/sardana-org/sardana/pull/1478)
    - All GUI related issues were marked with a label - soon a student from ALBA  - Gabriel will start working on them
    
7. Migration to gitlab. 

8. Renaming of master branch to main.
    - Everyone agreed on this.

9. Sardana release Jan21
   - Who are the release managers? Zibi and Michal.
   - Preselect milestone scope

   Solaris uses releases, the MBI will use them, so we decide that a release will be done.
   The [milestones](https://github.com/sardana-org/sardana/milestone/8) should be solved.
   New issues could be added.

   The manual tests will be done in:
   debian9, debian10, centos, windows, singularity (wrappling a docker image build on top of the conda base image)

10. AOB
