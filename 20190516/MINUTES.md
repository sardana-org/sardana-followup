# Minutes

Minutes from the meeting held on 2019/05/16.

Participants:

- ALBA: Zbigniew Reszela
- DESY: Teresa Núñez
- MAXIV: Antonio Milán
- SOLARIS: Grzegorz Kowalski

## Actions

* [ ] Call for dedicated teleconf meeting of SEP16 
* [ ] Grzegorz will report the issue with long mesh.
* [ ] Report TaurusDevState object is not callable when extracting the element 
      details when the macro fails.
* [ ] Create discussion for STANDBY state for experimental channel waiting
      for trigger
* [ ] Survey our institutes if we use ValueBuffer of 0D, if not, send email
      asking for this to sardana-users

1. Presentation - Sardana Controllers as Python Packages (see attached pdf)
    * Compatible with GitLab and any Git repository!
    * Very aligned with [SEP16](https://github.com/sardana-org/sardana/pull/726)
2. Urgent user problems/issues - Round table
    MaxIV:
      * After upgrade Tango to 9.3.3 version it was easier to hang 
      MacroServer with #1023.
      * When testing #1023 no memory increase was observed as reported by 
      others.
      * Bug seems to be fixed. We will close the GH issue.
    Solaris:
      * Update Sardana to 2.7. Hit #1023 but after applying patch it works ok.
      * Very long (800k points) mesh scan to test stability of Sardana failed
        once due to an attempt to move one of the motors before the previous 
        movement finished.
      * IDEA: STANDBY state for experimental channel waiting for trigger
    DESY:
      * No complains recently
      * Macro full description in lsdef PR was created. 
    ALBA:
      * 2 beamlines already affected by #1090
      * how to associate scan acquisition results to the middle of the 
        integration interval? See macro example example on how to add custom
        data to the scan entry: #1105.
      * non-linear translation between pseudo and physical motors is not solved
        in continuous scans - more details soon in a dedicated issue on GH. 
3. Overview of current developments / PR distribution
    * SEP2 ([#775](https://github.com/sardana-org/sardana/pull/775))
      * bump major version due to change of meaning of ValueBuffer of 0D - 
      see "Actions" section.
      * DESY already started testing SEP2.
      * Solaris (they do not use LIMA) and MaxIV will most probably test the 
      SEP2.       
      * Two old Lima controllers (Alba + DESY) were developed, we could try to
        reuse as much as possible. MaxIV is using the one from DESY.
    * CI for Windows ([#1078](https://github.com/sardana-org/sardana/pull/1078))
      * Thanks to the help from Tiago we have already the Python Tango DB 
        server running on AppVeyor
      * TODO:
        * create and start demo1 Pool and MS
        * run sar_demo
        * run testsuite  
    * Hotfix for Measurement Group configuration ([#1090](https://github.com/sardana-org/sardana/pull/1090))
      * PR is ready for tests
    * Solaris and MaxIV are willing to help in migration to Python3.
4. Sardana Workshop on Tango Meeting
    * Who will come: Carlos F.?, Teresa (maybe some scientists?), Zibi, 4 
    from MaxIV, someone from Solaris?
    * Time: 8:30 - 12:30
    * Coffee break 10:00 - 10:30?
    * Where: Room 109, building 25 B; Remember: two entrances to the DESY site.
    * Announcement via email: sardana-users, sardana-devel, tango-info - Teresa.
    Agenda:
        * SEP2
            * value reference reporting
            * value reference configuration (pattern and enable)
            * VDS in HDF5
        * SEP18
            * measurement preparation
            * number of starts attribute of measurement group
            * software and hardware start synchronization type
        * Possibility to directly acquire an experimental channel
          (without the need to define a measurement group)
        * Macro optional parameters
        * Possibility to change data format (shape) of of pseudo counter values
        * Possibility to pass values of repeat parameters with just one member
          without the need to encapsulate them in square brackets (spock 
          syntax) or list (macro API)
        * expconf external changes pop-up
        * newfile macro
        * spock in Qt widget (outsourced from DESY scientist)
        * Taurus Best Practices:
          * How to choose the Qt binding (qt4, qt5, pyside)
          * Helpers and Validators?
          * ...?
5. Sardana Docs Camp on Tango Meeting
    * When Thursday 8:00 - 16:00 (whole day) - Friday (morning only) 8:00 - 12:00
    * Room: 204, building 49 A
    * Who will attend: Teresa, Grzegorz, Carlos F, Zibi, Guifre?
    * Invitation email - Teresa (both emails together)
    * TODO: camera, mic and speakers, web browser with Jitsi for live connection
    * decide priorities (first thing in the Thursday morning)
    * redistribute pre-work (investigate specific features that has to be
      evaluated) - everyone assign ~6 tasks to him/her
6. Any other business?
    * Sardana Workshop @ ICALEPCS 2019
        * Grzegorz, Zibi will organize the workshop
7. Next meeting on July 4th 14:00. Organized by Teresa.
