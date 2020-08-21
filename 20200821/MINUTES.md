# Minutes from the Sardana Follow-up Meeting - 2020/08/21

Held on 2020/08/21 at 11:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Aureo Freitas (Mirjam Lindberg, David Erb), Solaris - Michal Piekarski 

1. Urgent user problems/issues - Round table

Alba:
- a fourth beamline finished the migration to python3, not tried with users
  due to reduce operation, it will start after summer shutdown
- one beamline was updated to the last python2 release and found a problem
  related to the MacroButton.
- bug 1351, it happens in loop of movements whe one motor has backlash, the
  backlash movement crash with the next motor in the loop, there is
  no lock protection for backlash movements. Workaround: put the motor
  with backlash (if only one) at the end of the loop. A fix has to be done.
- documentation about the diferent ways of interacting with Tango devices from
  the macros was put in Sardana FAQ due to the confusion of some users.
- it was requested the possibility of modifying the ScanUser environment
  variable, a PR (#1355) was created allowing that.
- a discussion was started (PR #1356 - WIP) about adding missing epoch to
  spec recorder.
- PR sent by Tiago (#1367) for solving the problem with functions that
  were not taken by the MacroServer.
- PR (#1386) for adding scan widgets was sent.
- PR (#1355) for adding custom data to the scan was sent.
- added the possibility of adding custom data to the scan files (using
  the function addCustomData), the way used by spec was looked at.

MaXIV:
- they are testing python3 with the last release, they found some problems with
  python but the main problem was with nexus5. They manages to solve the
  problems using singularity and dockers and now they are ready. They have
  still problems with controllers talking directly to the hardware.
  Next week they want to deploy sardana3 for one beamline.
  The main issue is with controllers and macros developed by the users.
  David is working in two new controllers talking directly to the
  hardware. Some problems trying to understand the behaviour of the
  TriggerGateController, it does not work with the time scan.

Solaris:
- issues about Sardana customization. It was asked for an easy way to set
  the logging level (they want to set it to INFO) and about naming templates
  (the default ones do not follow their naming convention and renaming by hand
  is a lot of work). Zibi suggested to use the Sardana custom
  settings. In solaris they use a sardana config file and also define there
  the name convention. 
- QtSpock: is integrated in a gui but once the scan is finished the command
  prompt does not appear, they found a way to workaround this but is not
  practicable for the users.
- they are now working on making scans depending on the status of the beam.
  There are many implementations (DESY, MaXIV, Alb), it should be unified
  (a dedicated meeting will be scheduled for that)
- how to import modules from controllers is an issue. SEP19 improves
  that but it is known that it should be improved in sardana. For now the
  python path environment could be used, or the PoolPath property of the Pool
  device.

DESY:
- tests of sardana3 were done: it is already possibleto use at DESY with
  all the DESY related Sardana tools. Some beamlines use it.
- problems with fscan with virtual motors, an issue will be created if needed.

Extra issues reported by Zibi:
  - from Daniel Schick
    * asked for inverting the flow information between Sardana core and the
    controllers in case the controllers could push the information to the
    core (issue #1343). The compatibility with the current implementation
    should be kept.
    * asked for handling motor limits from the hardware controllers
    (issue #1344).
    Both issues require major changes. They will be investigated.
  - from David (MaXIV)
    * asked for timestamps in the scan, there is an issue about that. Perhaps
    could be configurable to get an extra timestamp for each channel, other
    question is how to put it in NeXus.

  - from Solaris
    * plugin interface for storing scan state, considering the case if the
    scan was crashed and how to resume when starging again, it is not possible
    now. Alba also wanted to resume sequencies if they crash.
    - plugin interface for storing macroserver environment, for ex. Tango
    DB. With a plugin mechanism could be choosen where to store it.


2. Review pending points from the previous meeting
    - [x] Add migration guide for Sardana 2 -> Sardana 3 to
          the [docs](https://sardana-controls.org/devel/guide_migration/index.html)
	  It is done. 
 
    - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
          MAX IV and DESY need to test and review the new implementation.
	  Still not proposed by Alba, they will provide it.

    - [ ] MAX IV will provide a docker image to add to CI.
          It was some idea for extending the continuous integration, but is
	  still not done. We will have a look to was Taurus did, they use
	  github workflow instead of travis, we will see that and also
	  the singularity images.

    - From previous meetings:
        - [x] What about SOLARIS involvement in the Sardana project?
	      Michal takes the responsability.
        - [ ] Shutter integration in continuos scans: status update
	      No update.
        - [x] Pseudomotors not reaching positions: need status update from Solaris control group.
	  It was not a sardana issue but an icepad issue, they solved it.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
	  Not update.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
	  Not update
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
	  Not update
        - [ ] Few words on Python3 in Newsletter: status update
	  This documentation is done, a couple of words will be written in
	  the newsletter.
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
	  Not update, still not migrated to buster
3. Overview of current developments / PR distribution 
    * Jan20 release:
        - skip Jan20 milestone and move issues to Jul20 milestone
        - review milestone
        - plan release
	 It was discussed in an extra meeting. There were two PR missed:
	 #1342 (StateOne method) and #1109 (QtSpock), there will be reviewed
	 but the release will not wait.
	 Aureo will start today. The Milestone was rename to Jul20,
	 the newsletter will be written.
	 The platforms for manual tests would be debian9 (used by Alba
	 and DESY. DESY will try to test it, if not Alba will do it),
	 Windows (it will be done by Alba), Centos7.7 and Singularity + Docker
	 (it is used and it will be done by MaXIV), Centos7.6 (it is used
	 at Solaris, it will be done by them, but the test of Centos7.7 could
	 be enough for both).
    * pytest can be used to run tests, instead of unittests.
    * ct macros was too slow and it was done some automatic tests and it
      was identified some issue. With pushing events it would be room for
      improvement. Issue #1352 introduce AcquisitionState. It would save
      deadtime, but it has to be continued, just now only is done in the
      Pool but there are other places.
      
4. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - Any feedback from your colleagues?
   Some questions will be removed. It should be released with the sardana
   release, in the same mail will be asked for feedback.
   
5. SEP19 ([#1328](https://github.com/sardana-org/sardana/pull/1328))
   There are not much update. There is some comment from Solaris with some
   idea. MaxIV and DESY gave some feedback. DESY wanted to keep the old
   plugin system and MaxIV is interested in the new case. Both should be
   kept.
 
6. Demo 'Scan statistics'.
   There was an old PR and it is finally integrated. There are some solutions
   in other institutes, a common one should be decided.
   This PR find some statistics of the scan and take some decission.
   The statistics could be done per hand after the scan or automatically
   using the general Hooks.
   Zibi did a demo about this.
   DESY and Solaris have another solutions for that, in MaXIV there is not
   a general automatic solution for that.
   
7. AOB
   - Comments about Slack communication channel. Not too much experience from
   any of us. We will test it and let's see how it work, it could be annouced
   to the community if it works fine.
   - Next Meeting 17.09.20 14:00, hosted by Aureo.
