# Minutes from the Sardana Follow-up Meeting - 2021/01/20

Held on 2021/01/20 at 11:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV -  Abdullah Amjad, SOLARIS - Michal Piekarski and Stanisław Cabała, MBI Berlin - Daniel Schick

## Minutes

1. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
  - Answers for all institutes?
    Still missed people from MaxIV
  - Visualization of the result?
    No update. Guifre wanted to work on that, but no news from him.
2. Discussion about Bug squashing party - Virtual meeting based on questionnaire's results
    Still not decission about the date.
3. Urgent user problems/issues - Round table
    - DESY: nothing (just after Lockdown)
    - Alba:
      - Documentation about how to properly deal with exceptions in macros is added ([#1461](https://github.com/sardana-org/sardana/pull/1461)).
      - Problems appering with tango8 and tango9 when setting ORBendPoint like in tango7 are solved
        and documented ([#1470](https://github.com/sardana-org/sardana/pull/1470). Solution already applied
	and working in one beamline.
      - showscan is broken in spock, Zibi will work on that.
      - macros running in paralell in two doors miss events, the problem comes probably from Tango.
        Ex. one macro moves a motor and the other in other door run acquisition for the detector suscribing
	to events, this hangs the macroserver. Zibi will create an issue, it is reported to Tango/PyTango.
   - MaxIV:
       - in shutdown, they plan to work in Sardana and contribute more.
   - Solaris:
        - finishing migration to sardana3. Problems discussed with Zibi. There were configuration
	  problems, due to the latency time of the controllers.
	  A PR was proposed and it is merged. Zibi will add this to the documentation.
   - MBI:
        - created an issue about automatic determination of the shape of 1D and 2D controllers, a PR from
	  Zibi was tested. A disscussion about this point will be done at the end of the meeting.
	- question about starting Sardana already answered by Zibi in the documentation about setting the
	  ORBendPoint.
	  https://sardana-controls.org/users/configuration/index.html
        - increasing the use of macros and of submacros in macros using the return value.
	  Daniel thinks that it is a bit overload how to do it now. He asks if it would be possible to simply call
	  a macro and get the value. Zibi will check the possibilities already available. At MBI it is used:
	   
	  self.execMacro("twice 1").getResult()

	  
4. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] Post motor polling related issues in [#1431](https://github.com/sardana-org/sardana/issues/1431)
	      No updates.
        - [ ] Find a way of doing stuff with hardware on the beginning and end of the acquisition in 0D (i.e switch on/off hardware) ([#1322](https://github.com/sardana-org/sardana/issues/1322))
            - PR should be posted for the discussion
            - adding `Start` method is a reasonable option
	      No updates
    - From the previous meetings:
        - [ ] SOLARIS: Cannot stop multiple motors movement in backlash direction [#1421](https://github.com/sardana-org/sardana/issues/1421). Status update
	      Update from Solaris: the problem was that if one moves one motor in backlash direction and make ctrl-C the motor stops
	      but if there are multiple motors the backlash is done and the people think that ctrl-C does not work.
	      They have investigated this and figured out that with one motor the flag for stopping is applied but in a group the flag is
	      applied to the group and not to all the elements. A PR is done where the stop flag is passed to each element of
	      the motor group. One has to decide the correct behaviour: Solaris suggest that a first ctrl-c would do the backlash
	      but if a second one is executed the backlash would not be done (stop/abort difference).
	      Daniel agrees with that and thinks it is the way the hardware does.
	      Zibi suggests to accept the current PR but create an new issue for distinguishing between stop and abort
	      (one/two ctrl-C)
	      A discussion about the motor group devices arised, the possibility of avoiding the creation will be analysed by
	      Zibi, it could be that they are not actually needed.
        - [ ] How to make scans depending on the status of the beam - organize a dedicated meeting to unify the existing solutions (Requirements must be documented) - see discussion started in [#1450](https://github.com/sardana-org/sardana/issues/1450)
	      Teresa put in the PR what is done at DESY.
	      Solaris and MBI use the acquisition hooks, but like this you can not store the repeated points.
	      Zibi and Teresa will meet for discussing about that.
	  
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
	   Not updates.
        - [ ] MAX IV will provide a docker image to add to ContinousIntegration.
	   It will be reported in the next meeting.
        - [ ] Shutter integration in continuos scans: status update.
	   No updates.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
	   No news.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible).
	   No updates.
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
	   No updates.
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update.
	   Zibi will dedicate time to this. It could be an issue with the packages
	   coming from the distribution. The problems with the test suite are solved updating
	   tango. The CI part is related to github vs gitlab.

5. Overview of current developments / PR distribution
    - Problems for axis attributes with same name but different properties [#1436](https://github.com/sardana-org/sardana/issues/1436)
      Not updates (due to the holidays period) Henrik and Zibi will do the pair-programming.
    - Travis is discontinuing the unlimited CI service for OSS projects [#1433](https://github.com/sardana-org/sardana/issues/1433)
      It is the point 6 of the agenda.
    - Allow SWMR mode and avoid flock problems with NXscanH5_FileRecorder [#1457](https://github.com/sardana-org/sardana/issues/1457)
      A PR is done, Carlos will review it.
    - Decouple attributes default values from memorized values [#1458](https://github.com/sardana-org/sardana/issues/1458)
      Not updates
    - SEP19
      Zibi will start soon. He will develop the unit test for the macromanager. Unit test will avoid regressions.
    - Step scans burst/points_per_step parameter [#1450](https://github.com/sardana-org/sardana/issues/1450)
      Related to the point "How to make scans depending on the status of the beam" (previous discussion)
    - pre- and post-move hooks not available in mv macro [#1471](https://github.com/sardana-org/sardana/issues/1471)
      A propostion: add pre-mv and post-mv to mv, have sardana custom setting to call them in a mv or not.
      Meanwhile work on general hooks with more granularity, add hooks to macros or groups of macros.
    - Access motor name of a mv or scans.
      It is proposed to add a motor attribute to all macros with pre/post-moves
    - PseudoCounters accessing pseudocounters.
      It does not work if sardana is reinitialized. It sounds like a bug.
      Zibi will look into that.
    
6. Migration to gitlab
    Travis will not support the public OS for free, we are alredy using the budget
    of minutes. Tango will move to gitlab.
    The migration to gitlab will also imply a migration of the documentation, gitlab pages could host it.
    We could wait and see the experience of other projects.
    Solaris and MaxIV have their own repos in gitlab, but they agree on waiting.
    We agree on keeping github.
    
    
7. Sardana release Jan21
   - Who are the release managers?
     Zibi will check it.
   - Preselect milestone scope

   Solaris uses releases, the MBI will use them, so we decide that a release will be done.
   The milestones should be solved.
   https://github.com/sardana-org/sardana/milestone/8
   New issues could be added.

   The manual tests will be done in:
   debian9, debian10, centos, windows, singularity (conda images - debian)

   Taurus will not do a release now.

8. AOB
    - 1D/2D shape
    The shape has to be set in the MG and if it is changed there is an error
    telling that it is not determined the first time is called and in the other
    scans is not called any more. There is probably a bug in the
    backwards compatibility layer when a reshape is done:
 
    https://github.com/sardana-org/sardana/pull/1466/files#diff-b4dc204bf8202495936aa3777355984035597d4d9da04f35dbe9342c312782a5R666

    The idea is that the shape will dissapear of expconf (leave it as only readable) and it will be read at
    the begining of each scan for 1D, 2D and pseudocounters.

    - RoIs settings set in a file.

    Deeper discussion will be done. Check is the Snapshot can be used.

    - Check points from last meeting not treated in this one (from Minutes)

    - Next meeting is scheduled for 2021-02-18 and will be organized by MaxIV.
