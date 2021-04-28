# Minutes from the Sardana Follow-up Meeting - 2021/03/25

Held on 2021/03/25 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Abdullah Amjad, Henrik Enquist, Johan Forsberg, SOLARIS - Michal Piekarski, MBI - Daniel Schick 

## Minutes
1. Demo of the [h5 session](https://sardana-controls.org/users/scan.html#nxscanh5-filerecorder) concept. 
    - Issue presented in [this](https://github.com/sardana-org/sardana/pull/1457) PR.
    - Discussion: find an automatic way of controlling a scan with h5 session, some ideas:
        - using pre/post scan hooks 
        - MacroServer startup hook (that would be called automatically after starting the server (an opposite to the atexit)
2. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - MAX IV submitted partial results - 2 weeks more time to gather the rest
    - after this time ALBA will prepare a visualisation and presentation of the results for the next meeting
3. Discussion about Bug squashing party - Virtual meeting based on questionnaire's results
    - still postponed - we need results first
4. Urgent user problems/issues - Round table
    - SOLARIS
        - No urgent issues - proceeds with Sardana 3 migration
    - MAX IV
        - No urgent issues - still in shutdown
    - DESY
        - No urgent issues
    - MBI
        - No urgent issues
        - Discussion: find a way to share macros with the Community
            - one place is [Macro Catalogue](https://sourceforge.net/p/sardana/macros.git/ci/master/tree/)
            - [plugin catalogue](https://github.com/sardana-org/sardana-plugins) does not contain macros 
            - organize one common place to keep all plugins/applications to be easy to find
            - adding more generic macros from all institutes to such a catalogue would be beneficial for the Community
            - final decision: we develop [plugin catalogue](https://github.com/sardana-org/sardana-plugins)
    - ALBA
        - Migration of the 5th beamline caused some troubles and rollback was needed. After locating problem on a PyTango/cppTango level
        ([#315](https://gitlab.com/tango-controls/pytango/-/issues/315)) migration has been made one more time - more stress test will be performed
        - Controller to NI hardware causes problems when Pool is shut down - it keeps hanging and hardkill is necessary - to be investigated
        - Alba EM plugin - Alba asks MAX IV to check the PR
        - hdf5 with VDS feature problems [#1510](https://github.com/sardana-org/sardana/pull/1510)
        - MS environment empty issue (DESY had similar problems)- now fixed [#1520](https://github.com/sardana-org/sardana/pull/1520)
        - Repeat result fails to be shown in Spock [#1518](https://github.com/sardana-org/sardana/issues/1518)
        - MeasurementGroup state is not evaluated if not acquiring [#1316](https://github.com/sardana-org/sardana/issues/1316)
        - Wrong time estimation in continuous scans reported by beamline scientists - calculation methods need to be reviewed (as we show it to the users
        it needs to be accurate)
            - Discussion: how to reduce dead time in step scans? 
                - Teresa and Zibi have discussed that topic in the past
                - some benchmarking has been made [#161](https://github.com/sardana-org/sardana/issues/161)
                - if we need really fast scans use hardware continuous scans
                - not always continuous scans can be used - reducing dead time in steps scans needs attention
        
        
5. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] Before starting the scan, Sardana should verify the states of measurement channels.
            - No update
    - From the previous meetings:
        - [X] macros running in paralell in two doors miss events, the problem comes probably from Tango. Ex. one macro moves a motor and the other in other 
        door run acquisition for the detector suscribing to events, this hangs the macroserver. [#1536](https://github.com/sardana-org/sardana/issues/1536)
            - Issue in PyTango reported [#315](https://gitlab.com/tango-controls/pytango/-/issues/315)
            - Changes in cppTango and PyTango are necessary
            - Alba prepared Debian packages for both with patches ([here](https://github.com/reszelaz/sardana-test))
        - [X] increasing the use of macros and of submacros in macros using the return value. Daniel thinks that it is a bit overload how to do it now. He asks if it 
        would be possible to simply call a macro and get the value. Zibi will check the possibilities already available. At MBI it is used: self.execMacro("twice 1").getResult()
            - investigation in progress [#1504](https://github.com/sardana-org/sardana/issues/1504)
        - [ ] Alba propose examples on how to program without on_stop() and on_abort() Macro methods.
            - No update
        - [X] MAX IV will provide a docker image to add to CI.
            - MAX IV will provide a Dockerfile
        - [ ] Shutter integration in continuos scans: status update
            - No update
        - [ ] MaxIV beats configuration status: update from Alejandro's work
            - contact with Alejandro has been established
            - there are some unsolved issues with distinguishing timestamps (on the level of milisecs) in Sardana logs by Elastic - more investigation is needed
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that.
            - MAX IV created a script (called Sherlock) to check Pool configuration - it check if all dependent elements exist (by ID)
            - still in development - showing missing elements aliases instead of just IDs might be a nice feature
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
            - No update
        - [ ] Verify if Sardana axis/controller attribute are memorized by default
            - No update
        - [ ] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
            - No update

6. Overview of current developments / PR distribution
    - Discussion: how to handle this section not to go through the list of recurrent issues/PRs?
        - do not make a static list in the agenda
        - add here issues only that need discussion
        - one can add points in this section during the meeting (if comment/help/review is necessary)
    - pre- and post-move hook [#1480](https://github.com/sardana-org/sardana/pull/1480)
        - some issues found - Daniel, Zibi and Teresa will stay in touch to solve them
    - Creating pseudocounters from pseudocounters 
        - it works until one restarts Sardana - then because of the order of adding the elements during startup, Sardana is missing them and 
        can't start at all
        - problem seem to occur only on real elements - on dummy ones it works
    - Apply position formatting to the limits [#1530](https://github.com/sardana-org/sardana/pull/1530)
        - docstring style is messing the sphinx build: change style or enable napoleon extension (if accepted) [#1533](https://github.com/sardana-org/sardana/pull/1533)  
    - Docstring styles [#1535](https://github.com/sardana-org/sardana/issues/1535)
        - docstring should be consistent
        - we keep the discussion open to see if there is any interest in the community to use a different docstring style than the reStructuredText (reST)
    - Move regscans to scans [#1540](https://github.com/sardana-org/sardana/pull/1540)
        - do we need backwards compatibility?
            - in DESY they use custom names
    - Set stop flags for each element in multiple elements movement [#1539](https://github.com/sardana-org/sardana/pull/1539)
        - at the moment bug fix is merged to develop after manual tests
        - automatic tests based on PyTest need some more attention and will be merged later not to delay the Release
    - Execute post-scan also in case of stop, abort and exception [#1538](https://github.com/sardana-org/sardana/pull/1538)
        - post-scan hooks are performed in case of an exception - it is good
        - at the moment they are not called in case of stop or abort since no macros can run after a `Ctrl + C`
        - possible solutions would be allow only the post-scan macro to run after the `Ctrl + C` or
        use a callable instead. The preferred solution is the first one, but it has to be evaluated
        - the second one is already used at DESY to overcome the problem
    - Cannot recreate measurement group with same name [#1528](https://github.com/sardana-org/sardana/issues/1528)
        - there was an old solution not compatible with Tango8
        - Zibi will find it and try to update it to work with new Tango and Sardana3
    - Add the possibility to perform a continuous scan with a single point [#1501](https://github.com/sardana-org/sardana/issues/1501)
        - not executing the last acquisition issue:
            - Pass nr_interv as negative number which would indicate skipping the last acquisition or break backwards compatibility and change `nr_interv` to `nr_points` directly
            - MAX IV and Alba prefer second option but some more research and cost evaluation is needed

7. Migration to gitlab.
    - Carlos volunteered to prepare a PR for CI migration
    - Everyone agreed on migration to Gitlab

8. Renaming of master branch to main. 
    - Everyone agreed on this
    - we will do it during the migration to gitlab

9. Sardana release Jan21
   - Zibi and Michal will be the release managers.
   - The [milestone](https://github.com/sardana-org/sardana/milestone/8) should be soon solved - Zibi will distribute PRs
   - Michal and Zibi will meet on Monday to coordinate the Release

   The manual tests will be done in:
   debian9, debian10, centos, windows, singularity (wrappling a docker image build on top of the conda base image)

10. AOB
    - No issues
    
Next meeting will be held on 29 April 2021 14:00 hosted by Zibi from ALBA
