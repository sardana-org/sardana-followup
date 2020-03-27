# Minutes from the Sardana Follow-up Meeting - 2020/03/26

Held on 2020/03/26 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Aureo Freitas

1. Urgent user problems/issues - Round table
* DESY:
  * nothing to report
* ALBA:
  * migrating third beamline to python3, it is one of the most complicated and
    it is almost done. There were two strange crashes of sardana during continuous
    scans. They are not reproducible but between them they were able to run for a
    week without problems. In order to investigate them, cores will be now dumped
    if sardana crash again. The migration of the fourth beamline has started.
  * stress tests are being done mainly to track the increase of memory consumption in
    Pool and Macroserver. This issue was reported a year ago by DESY, observing an
    increase of the memory consumption in the MacroServer produced by storing the
    Scan records, there is a issue about that. It was suggested to use a different
    library for implementing the malloc function, Alba confirms that this dicreases
    the memory consumption of the Macroserver. Alba is using this solution in one
    beamline and it will be used in others. It is easy to switch for running in this way.
    For the Pool the same change implemented in the Macroserver helps but does not solve
    the problem, there is still an increase of the memory consumption when running big scans.
    This increase is only observed when software synchronizer and tangoattribute countertimer
    are used together.
  * investigation of how to add the control of the shutter during continuos scans.
    One beamline wants to open the shutter at the beginning of the continuos scans and
    close it when the scan is done. There are different possibilities to implement this,
    they are under invertigation. The workaround used now is implement the control of
    the shutter in a triggergate controller. Another way is add two synchronizations
    one for the controllers and other for the shutter, but the sep 6 does not contemple this.
    In MaXIV they have made a tango device for controlling this, but they do not use the
    continuous scans of sardana.
* MaX IV:
   * no issues related to sardana.
   * Vincent is working in removing Taurus and Tango dependencies from Sardana.
     Zibi suggests to remove first the tango dependencies. This was already an idea.
     Removing Taurus dependencies was not in mind, but the idea is not rejected.
     It will be good to introduce this PR incrementaly, ex. tango dependencies in motion,
     in adquisiton, in data storage ...so would be easier to evaluate and integrate.
      
2. Review pending points from the previous meeting
    - [ ] What about SOLARIS involvement in the Sardana project?
      Nobody from Solaris, no update
    - From previous meeting:
        - [ ] Pseudomotors not reaching positions: need status update from Solaris control group.
	      Nobody from Solaris, no update
        - [ ] Missing default attribute values on Pool start: need feedback from Aureo/Juliano after asking Henrik
	     They have not worked any more. They have to work in some features of the PR.
	     Something in the design has to be revised and changed. The memorized attributes are tango
	     dependent and this has to be changed.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
	     There is no repository with beats configuration, but they analized it.
	     In Alba were using Logstash and spliting the entries, filebeats
	     comes with this possibility, it splits by itself using modules. Performance and readibility
	     are being investigated and compared. Perhaps the parsing of log lines could be done in
	     a filebeat sardana module.
	     In Alba also analyse metricbeat: https://www.elastic.co/beats/metricbeat
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
	     No update
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
	     No update
        - [ ] Few words on Python3 in Newsletter: status update
	     No update
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
	     No update
3. Overview of current developments / PR distribution
        - [ ] 2nd Ctrl+C abort the macro: status update
	     No update
	- [ ] Zibi will review the last debug information from Thorsten
	     Zibi analysed the last logs, PR for dumping status information of the counter/timers is done.
	     See discussion in PR#1308
	- [ ] Juliano will share the code of the proxy/mirror controller that they use
	     Aureo will provide the code after the meeting.
    * How Tango issues affects Sardana?
        * https://github.com/tango-controls/pytango/issues/292 and https://github.com/tango-controls/cppTango/issues/686
	 Zibi advanced in the workarounds in Taurus for that. The bug affects the 4th beamline migrating
	 to python3. It would be imposible to migrate it to python3 if this is not solved.
	 Three workarounds, proposed as WIP PR to Taurus, are evaluated. One seems to solve the problem.
	 cpptango has alspo a PR to solve the issue and will be evaluated.
	 Could be that the PRs for Taurus are not needed any more.
        * https://github.com/tango-controls/pytango/issues/307 and https://github.com/sardana-org/sardana/pull/1298
	 Jairo is working on this, it is not easy to solve in pytango, probably it has to be done in cpptango and
	 see how locks are constructed.
    * Several PMTV and macroexecutor/sequencer improvement PRs
        No update
    * showscan online improvements
        There are two PRs related. One changing the way the trends are updated (it was based on event and now is
	done periodically), this PR is integrated. In other one Tiago works in data inspection for showscan
	online (work in progress).
    * Jan20 release:
	Some PRs have been integrated but there are still 8 PRs to be reviewed and merged. They have been assigned.
    * sardana-org/sardana#1315
        We will all think about it and reply in the issue. PR will be created afterwards when we agree on
	what to remove and what will stay.
        
4. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    The questionnaire was sent and filled. We have checked our answers to see if the results can be
    easily analysed. Try to see if we can change the colors of the grafics for stadistics.
 
5. AOB
    * These points want to be done this year for Sardana at Alba:
      * Plugings
      * Configurations (evaluating possibilities)
      * Review of issues

    * Next meeting is planned for 07.05.2020 at 14:00, organized by MaXIV
