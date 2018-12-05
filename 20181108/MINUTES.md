# Sardana Follow-up Meeting - 2018/11/08

To be held on 2018/11/08 at 14:00  
Similar to the previous one will be a bit unusual, since we will focus more on 
improving our work.

# Minutes
1. Quick overview of urgent issues
	* Current development problems
	    * SEP18
	        * Ready to try - any volunteers?
	        * Controller API decision is pending - feedback is more than 
	        welcome!
	    * Integration of 1D & 2D will continue in the following 
	    direction:
	      * Independent acquisition of experimental channels 
	      * SEP2
	    * Hooks logging in more general way PoC done by Zibi and will be 
	    proposed soon
	    * Extend spock syntax is almost ready to be integrated - we are 
	    trying to solve tests failing on travis.
	    * Checking the limits in a scan is almost ready. More general 
	    solution will be discussed in #974
	    * Logstash handler tests in progress - Grzegorz will try in a more 
	    relaxed VM environment.
	* New urgent issues (if any)
	    * MaxIV will work on post-mortem debugging: Sardana getting stuck - 
	      Antonio and Zibi will organize a dedicated meeting for trying the 
	      RConsolePort
	    * MaxIV has some feedback about the SEP16 (third party repos) the 
	    will comment it on SEP16.
	    * MaxIV: How to limit elements access to users 
	      * two Pools and two MS
	        * Solaris is happy with that
	        * MaxIV discovered problems - they will post details on #51 
	      * DESY uses seperate configuration files
	    * Solaris: Pool sometimes looses connection with MS (maybe due to VM
	     backups, snapshots)
	    * Alba: expconf reacting on events can have side effects - already 
	    reported to github - will be fixed for Jan19
	    * Desy: Ctrl+C forces to restart the MacroServer if any motor
	      get stack or return an exception from its StopMove - Teresa will try tro
	      reproduce it and report it on GitHub.	    
2. Brainstorming
	* Review of last brainstorming outputs:
	    * Follow-up meetings
	    * Video conference tool
	    * Issue prioritization
	    * Collaborative development
	* Brainstorming topics left from previous meeting
        * communication with users
          * How to use communication channels
            * github issues for reports from users to developers
            * mailing list for announcements from developers to users
          * The above should be documented in sardana docs; and in 
          CONTRIBUTING.md
          * We should start using issue templates (check in spyder project) 
          * Templates could contain space for: sardana version, dependencies
          versions (ZMQ, Tango, Taurus), OS, expected behavior, observed 
          behavior
          * We should then provide script for checking dependencies versions 
          (Taurus has something similar)
        * releases
            * current workflow is fine; 2 per year is fine;
            * MaxIV & Solaris upgrade +/- 1 per year;
            * Desy & Alba upgrade from develop on demand
            * Desy has some local changes (general conditions, general stop 
            functions; motor limits not using Tango attribute configuration;
             scan points readout problems)
            * MaxIV - uses stable version
            * Solaris - some patches are applied from PR
            * Alba - some beamlines use patches
            * release process will be done rotatively by each side
        * teams discussions
            * no need for them
        * milestones
            * we will continue using them for releases
            * 2 milestones should be created in advance
            * anyone is welcome to assign milestones and move priorities
        * newsletter
            * We agreed that it is a good idea to work on newsletter together
            * Newsletter should be created continuous as CHANGELOG as 
            unreleased and then, on the release, it should be frozen and 
            released.
            * Newsletter will be announced on the release email.
            * To be decided a format for it: could be markdown, sphinx and 
            part of the documentation.
            * It should be written in user friendly language and supported 
            by examples. But in general it should point to the documentation.
3. Brainstorming topics to be continued:
    * newsletter
    * git plugin for git-flow

