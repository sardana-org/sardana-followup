# Minutes from the Sardana Follow-up Meeting - 2020/05/07

Held on 2020/05/07 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Aureo Freitas

1. Urgent user problems/issues - Round table
* Alba:
  * sardana migration on python 3, problems was fixed but still have some more issue on pytango #315
  * 3 beamlines was migrated and they are migrating the n4
  * one more issue was discovery: strange results in scans comparing the data prescan snap shot. They are not maching.. There is the possibility that the missup the snapshot (sardana issue #1321) maybe many attr in  the snapshot
  * Thiago propose to eliminate the hooks on abort from macro API (sardana issue #1325). Need to keep on_abort and on_stop on macro. Alba propose that they will provide examples with the new way to program it. MAX IV and DESY need to test and review the new implementation.
  * Sardana 2.8.5 released. Add compatibility with Taurus 3
  * Proposal from Thiago using pandas for scan data. #1095
  * From new contributed run macros in paralel. Solution was 2 doors #1323 
  * Document RecordData attribute #1329

* DESY:
  * Startup process. No issues expecificlly with sardana. Start to change everything to python 3.


* MAX IV:
  * Continuous scan for one beamline
  * SEP 6 Trigger Gate ctrl for Delay generator
  * meshscan c

2. Review pending points from the previous meeting
    - [ ] What about SOLARIS involvement in the Sardana project? 
      Zbi sent an email to Grz to ask about the situation about the sardana contact. He is waiting for reply.
    - From previous meeting:
        - [ ] Alba beamlines migration to python 3: status update
        Done with the beamline 3 and it is going to beamline 4
        - [ ] Increase of memory consumption in Pool and Macroserver: status update
        Moving to pandas for Macroserver. For Pool was pytango and it is solved in latest version.
        - [ ] Shutter integration in continuos scans: status update
            No update
        - [ ] Pseudomotors not reaching positions: need status update from Solaris control group.
            No update
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
            No update
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
            No update
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
            No update
        - [ ] Few words on Python3 in Newsletter: status update
            Zbi found a place that we can comment it https://sardana-controls.org/devel/guide_migration.html
            Migration guid -> add all the informations there and the newsletter link the documentation. Previous migration already there for 0 to 1 but not from 1 to 2. make it officially in the docs
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
            MAX IV will provide a docker image to add to buster ci.


3. Overview of current developments / PR distribution
        - [ ] 2nd Ctrl+C abort the macro: status update
            Already integrated
    * How Tango issues affects Sardana?
        * https://github.com/tango-controls/pytango/issues/292 and https://github.com/tango-controls/cppTango/issues/686
        * https://github.com/tango-controls/pytango/issues/307 and https://github.com/sardana-org/sardana/pull/1298

    	    solved on cpp tango 9.3.4rc5 and need pytango release 9.3.2
    * Several PMTV and macroexecutor/sequencer improvement PRs
        No update but no critical to realease put the prio and another
    * showscan online improvements
        No update not critical to realease put the prio and another
    * Jan20 release:
        * sardana-org/sardana#1315
    * ...

4. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    * When is the moment to be distributed ? Zbi will need to recreate the format. The latest one is not probably the Jan20 mainstrom realease will be the Jul20 release.

5. Introduction of SEP19 ([#1328](https://github.com/sardana-org/sardana/pull/1328))
    * Introduction by ALBA
    * entry_points for sardana plugins but it is not so dynamic for plugin

6. AOB
    * Virtual Tango Meeting
    * Next meeting is planned for 04.06.2020 at 14:00, organized by ALBA
