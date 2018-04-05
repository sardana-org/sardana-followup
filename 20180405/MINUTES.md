# Sardana Follow-up Meeting - 2018/04/05

Held on 2018/04/05 at 14:00

Participants: Zbigniew Reszela (ALBA), Teresa Nunez (DESY), Antonio Milan (MAX IV), Grzegorz Kowalski (SOLARIS)

# Minutes
1. Presentation
	* ~~Solaris macros - things that users ask for, but are missing from Sardana~~ (will be presented at next meeting)
2. User Experience Report - Round Table
	* SOLARIS
		* MacroServers are dying during scans, stop logging
			* try to disable logging to file
			* can be related to logging deadlock in Door attributes
	* ALBA -> slides
		* Sardana on Windows
			* using conda, no PyQt package, manual linking is a possible but it's an ugly solution, Antonio will try this
			* entire Tango/PyTango ecosystem could be built for conda
			* using py2exe, it could not work for project as big as Sardana, SOLARIS will check this
	* MAX IV
		* Measurement groups with faulty controllers are disappearing
		* testing new releases of Sardana and Taurus - no complaints so far
	* DESY
		* Motor limit checking won't allow movement to the limit
			* Moved checks to pre-scan hook, so users can enable and disable it
		* RunningMacros Door attribute
			* possible enhancement, already used at DESY
			* shows entire stack of currently running macros
			* at SOLARIS we parse the Debug attribute for that
3. Collaborative Developments - Review
	* Jan18 review - TODOs left, bugs found
		* -> slides
		* Taurus 3 status
			* DESY - soon on Debian 9 and Taurus 4
			* MAX IV - deprecated
			* SOLARIS - mostly deprecated, used exclusively for some legacy GUIs
			* ALBA - still in use
			* Conclusion: Taurus 3 won't get the FQDN update
		* Bug distribution
			* ALBA - Suse 11 testsuite problems
			* SOLARIS - MacroEditor issues (if only MacroEditor will run)
			* MAX IV - PreScanSnapshot issue
			* DESY - problems related to Debian 9
	* Spock logging - users feedback
		* Users don't like the new solution
		* Ideally, both old and new solution should be available, users could choose
		* Exactly what appears on the screen should be logged (without "running macro", parentheses, etc.)
		* There's a bug somewhere in the current implementation
		* There's a Linux tool to create terminal session log, maybe it could work also for Spock
4. New Developments, Enhancements or Bug Fixes
	* Predefined values for string macro arguments
		* tab autocompletion for strings in spock
		* currently implemented in genutils, using MS environment variables "<macro name>+predefined"
		* could be implemented using Sardana types
		* PR pending
	* dmesh and mesh macros
		* external motors are moved for each point
		* this can cause motor timeout
		* users should be able to deactivate this
		* complicated because of Motion objects
		* send None as no movement (?)
		* issue pending
	* third-party repositories
		* SEP 16 (https://github.com/sardana-org/sardana/pull/726)
		* plugins more like Python packages -> would require massive changes to the plugin system
		* Sardana organization would host only the 3rd party plugin register
		* Everyone could use repositories layout of their choice
		* Possible approach: single controller repos
			* Pros:
				* easier documentation
				* allows better code structure
				* fits better for CI
			* Cons:
				* you need to install multiple repos/packages instead of just one
			* See https://github.com/amilan/lib-maxiv-sardana_albaem
		* Automate register entries (?)
5. Pending PR distribution
6. Any Other Business
	* Satellite meetings/workshops in 2018
		* Tango meeting - there is a free time slot on Tuesday morning, workshop for developers
		* NOBUGS - we could do the newcomers workshop, but not everybody is coming
	* Sardana project wiki pages
		* materials from conferences/workshops
		* how to use Sardana videos
		* Zibi will prepare a template
	* VideoConference tool - try Jitsi: https://meet.jit.si/sardana-followup
		* It's a little unreliable, but we should repeat the test with better Internet connection at Solaris :)
		* appear.in pro allows up to 12 people, how many will actually be interested?
		* More people = longer meeting, we should allocate a time frame for each point
	* Next meeting
		* 03 or 17.05.2018
		* open for the community
