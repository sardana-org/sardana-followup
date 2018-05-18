# Sardana Follow-up Meeting - 2018/05/17

Held on 2018/05/17 at 14:00

Participants: Zbigniew Reszela (ALBA), Teresa Nunez (DESY),
              Antonio Milan (MAX IV), Grzegorz Kowalski (SOLARIS)


# Minutes
1. Presentation
	* Solaris macros - things that users ask for, but are missing from 
	Sardana - see attached slides
	
	Some technical discussions:
	* plotselect macro is used to configure ActiveDetector environment 
	variable which later on is used by the online plotting widget developed 
	by Solaris.
	* Sequence files is shared between the client and the server via NFS 
	mounted directory. The file is then opened by the macro and parsed.
	
	Conclusions:
	* The solutions presented by Grzegorz's perfectly match with the user 
	requirements that we all have received in our institutes.
	* This makes us think that Sardana is missing features.
	* The recent questions/discussions in the mailing list and GitHub issues 
	just confirm that.
	* In our opinion it does not have sense that every new user develops its
	own solutions. We should try to find a common and generic enough 
	solution that will fit all our needs and integrate it in Sardana or keep
	it in the third-party repository but denominate it as the standard.
	* We will start with the already known requirements: CLI plot 
	configuration and online plot tool, sequences from spock, go-to-peak, etc.
	This will be discussed as GitHub issues.
2. User Experience Report - Round Table
    * Solaris
        * Upgrade of the machine control system (control room) - not affecting 
        Sardana.
        * Beamlines with Sardana 2.3.2 maybe at some point will move to 2.4.0.
        * After solving MeasurementGroup's bug with the events 
        MacroServers are not dying.
        * Sometimes MacroServer looses connections with the Pool - to be 
        investigated.
    * MaxIV
        * Works on the Merlin detector
        * Would like to store motor's positions in HDB++.
            * This requires Tango archive events.
            * Polling is not an option (would be slow in case of many motors -
            no optimization from multi axes queries to the controller) 
            * We could push it from code, but when? In motion action? This 
            would push only if the motor is moved from Sardana.
            * How big is the overhead if we do it always? Calculating 
            Tango event check criteria had some overheads in case of change 
            events. What if there are no listeners subscribed to the events?            
        * Problems with PoolMotorTV when (Taurus polling vs. Tango events) -
         should be fixed in the latest Taurus.
    * DESY
        * Issues from the last meeting are still blocked but are a custom 
        solution was applied to the users.
        * No new issues.
    * ALBA
        * Issue with continuous scans: velocity set-point vs. readout
        * MeasurementGroup start timeout in case many channels are involved 
        (>40)
        * execMacro does not work with repeat parameters
    * New users are interested in Sardana. They have raised many questions 
    and pointed issues. Some of these are:
        1. Several bugs were discovered on Windows. 
        2. New EPICS generic controllers in 3rd party repo
        3. Scan data analysis and actions based on the results e.g. find and
        go to peak
        4. Sequences
            * How to load directly from the spock
            * More complex, with a DSL
        5. Acceleration vs. AccelerationTime
        6. How to set motor limits from the AddDevice level
        7. Documentation needs improvements
    * Our conclusions to some of the points    
        1. Not discussed.
        2. Not discussed.
        3. Use general hooks for that and access data with macro 
        data 
        property.
        We need to gather all available solution and develop one standard.
        To be continued on the GitHub issue.
        4. We need to gather all available solution and develop one standard.
        Sequencer could be reused in order to avoid duplication of code.
        We don't want to develop a new DSL.
        5. DESY had already changed their controllers to return acceleration
        time instead of the acceleration.
        We need to study the consequences of any renaming e.g. memorized
        attribute values, eventual archiving configured.
        6. This will be rather difficult. For the moment just use the proxy 
        to the device. This however may not be created yet - AddDevice is 
        called in the initialization phase..
        7. Documentation needs improvements and reorganization. We could 
        organize a documentation camp as Tango did. For 
        example 3 days of work only on the documentation. All of us are interested 
        in such an event and should be available in July.
        
3. Collaborative Developments - Review
	* Jan18 review - problems:
	    * PreScan Snapshot of sardana elements is not stored (most probably
	    related to FQDN) - IN PROGRESS (Antonio)
	    * sardanaeditor issues:
	        * When choosing the module in which to create the macro, I only get 
	        .pyc files offered.
	        * Error when creating a new macro using the Macro Class template
	        * The created macros do not appear (probably related to the .pyc 
	        problem from the previous point.)
	* Jan18 review - TODOs:
	    * spock genutils and the pre-scan-snapshot part of the experiment
	    description were not reviewed
	    * Sardana model names in taurusgui XML configuration were not reviewed.
	    * Limit deprecation warnings to one message per measurement group
	    	   
4. New Developments, Enhancements or Bug Fixes
	* third-party repositories
	    * The catalogue seems the best option but there are potential problems.
	     If we redistribute the repositories maintenance the repos could have 
	     different structures, installation ways. What if we write well 
	     the guidelines? Maybe let's use the "cookie cutter" tool for 
	     generating the project templates.  
	    * What about hosting some controllers in the sardana organization 
	    (an idea of Roberto) - TODO reply to this discussion.
	* on_stop function and the general repeat point condition - still blocked
	* Acceleration vs AccelerationTime attributes - discussed in the 
	previous point
	
5. Pending PR distribution - skipped.

6. Any Other Business
	* Sardana Workshop 2018 (Prague) - update about the workshop preparations.
	* VideoConference tool - appear.in pro account - skipped.