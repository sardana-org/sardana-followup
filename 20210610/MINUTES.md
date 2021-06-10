# Minutes from the Sardana Follow-up Meeting - 2021/06/10

Held on 2021/06/10 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Abdullah Amjad, Benjamin Bertran, SOLARIS - Michal Piekarski

## Minutes

1. Discussion about the release process (including Zibi presentation)

   It was explained the need of more releases at ALBA and proposed two different
   ways to do them. The manual tests would be suppressed and some tools would
   be used to accelerate the process. It was questioned the need of the biannual
   releases like they are done now.

   MaIV is building frequently from develop. See as positive to have pip or conda
   packages. Also the tagging of the repository every time they make a new installation
   (using the tag as a kind of version number).
   Solaris follows the official releases (twice per year)
   DESY merges with own repository and uses tags there.

   It was concluded that the biannual releases will continue to be done.
   If we decide to make more frequent releases it should not interfere with the biannual ones.
   Alba is interested and will do more releases becuase the version number will be more clear
   and the process will be easier.
   MaXIV could be also interested and are also interested in tagging the code
   they take. Zibi will check the possibility of tags.
   
   Zibi will create an issue in Sardana for discussing about the proposals and adding the link to the
   slides presented today.
   
2. Discussion about _Bug squashing party_ - Virtual meeting based on the questionnaire's results

   Still not results about the questionnary.
   Three July weeks will be proposed as dates for the _Bug squashing party_
   A mail will be send to announce it and ask about the more suited date.
   
3. Urgent user problems/issues - Round table

   - MaXIV:
        - They found that in sardana version 3.1.4 ctrl-C doesn’t work if a pre-scan hook is defined (issue #1603).
          It is not checked with other hooks. They do not have this version in production, so for the moment
          is not urgent. Zibi will look at that.
          DESY will check if it happens in the version they have installed because they had some issues with ctrl-C
          that were not clarified.
   
    - Alba:
        - Migrating plugins to python3.
	- One beamline already migrated to python3  has some random hangs in some of the macros
          executing commands on tango device servers and subscribing/unsubscribing events.
	  It could be related to PyTango issues that are actually solved.

     - Solaris:
        - No urgent issues

     - DESY:
        - No urgent issues

   
4. Review pending points from the previous meeting
     - From previous meetings:
        - [ ] MacroServer startup hook (that would be called automatically after starting the server - an opposite to the atexit)
              - Zibi wanted to create a PR
	      No update
        - [x] Alba EM plugin
	      MaxIV can not work in continuous scans with the last version from Alba.
	      They are now updating the firmware and they will develop a new controller for working
	      using the fast buffer mode (for using it with continuous scans). They will be done with
	      the development soon and they will present it.
        - [x] Wrong time estimation in continuous scans reported by beamline scientists - calculation methods need to be reviewed (as we show it to the users
        it needs to be accurate) 
              - Not high priority for ALBA anymore to review these calculations.
	      No updates. An issue will be created by Zibi and once it is done the point can be removed
	      from the list.
        - [x] Zibi will update on "Cannot recreate measurement group with same name" [#1528](https://github.com/sardana-org/sardana/issues/1528)
	      Zibi took a branch from 2014 and it was working. The problem was with tango8 but since
	      tango8 is not supported any more the solution works. Zibi created a PR that should be
	      reviewed. To be removed from the list.
        - [x] Before starting the scan, Sardana should verify the states of measurement channels.
	      Done. To be removed from the list.
        - [ ] MaxIV beats configuration status:
            - there are some unsolved issues with distinguishing timestamps (on the level of milisecs) in Sardana logs by Elastic - more investigation is needed
	      No update. Feedback should be sent to Alejandro, who worked on that.
        - [ ] Users can break Sardana by messing with configuration in Tango DB:
	    - status of the diagnostics script
	      No update. There is an script from Henry telling which controller or element
	      is in FAULT but not more. It scans all the sardana elements and read its state.
	      The original motivation was the configuration of the attribute properties related
	      to events. A minimal configuration should be there.
        - [x] Hang scan due to the counter/timer controller timeout in StateOne() - How to deal with exceptions in the controllers: Review the docs?
              MaxIV reported that bringing an element to FAULT state will, as it should, stopp the scan.
	      Before they were using the State UNKNOWN, this is why the scan was hanging.
	      This should be added to the recomendations. In ALARM the
	      scan will continue but without data for that channel.
	      For MaxIV UNKNOWN and FAULT will indicate that the element is not useful, in
	      ALARM the connection to the hardware is there but there is some problem.
	      A table about the states will be created to be discussed in github.
    
5. Overview of current developments / PR distribution
    - Macro plots appear twice in QtSpock [#1570](https://github.com/sardana-org/sardana/issues/1570)
      - Bug or feature?
      It will be discussed in the issue. Point to be removed.
    - Create controller from a Macroserver with two pools [#589](https://github.com/sardana-org/sardana/issues/589)
      - Design proposed. Any volunteers to work on that?
      Point to be removed. Somebody should look at what is proposed.
    - Consider removing dtype from the measurement group configuration [#1561](https://github.com/sardana-org/sardana/issues/1561)
      - Anyone knows on recorders using this information?
      No update. To be removed and discussed in the issue.
    - Refactor hooks for move macros [#1544](https://github.com/sardana-org/sardana/pull/1544)
      Still to be reviewed. To be removed.
    - Last scan macro data http://github.com/sardana-org/sardana/issues/290#issuecomment-819440784
      To be removed.
    - sardana CLI [#286](https://github.com/sardana-org/sardana/issues/286)
      - Johan wanted to work on that
      No update.
    - Not possible to call mAPI methods (macro API) after stopping/aborting a macro (SF#9) [#10](https://github.com/sardana-org/sardana/issues/10)
      To be removed.
    - Execute post-scan also in case of stop, abort and exception [#1538](https://github.com/sardana-org/sardana/pull/1538)
      To be removed.
    - General Conditions [#1481](https://github.com/sardana-org/sardana/pull/1481)
      To be removed.
    - Add devcontainer for VS Code - Remote Containers [#1598](https://github.com/sardana-org/sardana/pull/1598).
      Abdulah has something similar. He will review it.
    - Error overloading macros if the number of arguments is changed [#1597](https://github.com/sardana-org/sardana/issues/1597).
      Teresa will add some information there.
    - Error handling for missing libs [#1588](https://github.com/sardana-org/sardana/pull/1588).
      Zibi and Abduhla will work on that.
    - udef checks dependencies [#1586](https://github.com/sardana-org/sardana/issues/1586).
      Alberto is working on that and will propose a PR soon.
    - Stop motion only once in scans [#1579](https://github.com/sardana-org/sardana/pull/1579).
      It should be reviewed. 

6. Migration to gitlab and rename master branch to main/stable.
    It should be done soon. Benjamin from MaXIV will help (following
    the way Taurus did it).
   
7. AOB
   An extra meeting will be held before the _Bug squashing party_ for discussing the results of the
   questionnary and discussing priorities. It will be held on the 21st of Juni at 14:00.
   
   Next Follow-up Meeting will be held on the 8th of July at 14:00, organized by MaXIV.
