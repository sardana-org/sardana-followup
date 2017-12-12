# Sardana follow-up meeting
Held on 11.12.2017 at 14:00

Participants: SOLARIS - Grzegorz Kowalski, MAXIV - Antonio Milan,
              DESY - Teresa Nunez and ALBA - Zbigniew Reszela

# Minutes

1. Presentation of Sardana feature: Spock Logging

* Spock Logging were presented - see slides in SpockLogging.pdf
* MAXIV
  * Does not use anything 
* SOLARIS
  * Uses own implementation based on three macros: one starts capture of
    the spock input and output, one stop the capture and one print it
  * The implementation subscribes to the Door output for getting the output,
    and checks the spock debug for getting the input (name of the running
    macros). It also subscribes to the door status
* DESY
  * Uses own implementation (described in the slices)
* ALBA
  * Does not use anything
  * Presented an alternative to the Spock Logging: MacroServer Report,
    user oriented log files written by own user macros - see slides
    'MacroServer report feature' in AlbaPresentations.pdf

  DESY Spock Logging implementation has the advantage, respect to the
  Solaris one, that is not tango related.
  DESY Spock Logging and MacroServer Report are two different features,
  but one can try to unify the configuration and user interfaces.
  
2. Requirements and needs for 2D and Lima integration in Sardana

* Presention done by Alba -  see slides 'Lima SEP2 requirements/ideas'
  in AlbaPresentations.pdf
* MAXIV
  * Uses macros to configure Lima for saving images
  * Not requirements up to now
* DESY
  * Handles configuration for image saving in general hook pre-scan macro
  * Not requirements
* Solaris
  * Up to now uses Lima only for diagnostics, not inside Sardana

  Alba will take care of the further implementation, a new dedicated SEP will
  be created to collect requirements and define the critical points before
  continuing with the implementation.

3. Report user's experience - round table.

* DESY
  * Nothing to report
* MAXIV
  * Issue about NFS described in
  [#651](https://github.com/sardana-org/sardana/pull/651) is seen mostly
  every day, under investigation
* SOLARIS
  * Sardana crashes and timing problems still not understood, under
  investigation
* Alba
  * PR [#651](https://github.com/sardana-org/sardana/pull/651) ready to be
   integrated, before checks about possible blocking during scans will be done.
  * Presentation, see slides 'User experience - open questions' in
    AlbaPresentations.pdf

4. Review status of collaborative developments identified in previous meeting.
* Provide reliable position column in continuous scans
  ([#608](https://github.com/sardana-org/sardana/issues/608)) (Alba and MaxIV)
  * Nothing done
  * Alba created related issue #643
  * Alba reverted PR #590
* General Hooks ([#646](https://github.com/sardana-org/sardana/pull/646)
  (Alba and DESY)
  * Ready to be integrated after review by Lund und MaxIV
* General solution for Taurus4 and Sardana incompatibilities
  ([#609](https://github.com/sardana-org/sardana/issues/609) (Solaris and MaXIV)
  * Alba worked on that, it will be put in github
* Software limits with motor groups and pseudo motors
  [#560](https://github.com/sardana-org/sardana/issues/560)
  and [#36](https://github.com/sardana-org/sardana/issues/36) (Solaris and DESY)
  * Solution proposed for pseudo motors tested and used for motor groups
  * Alba will review the last comments about the implementation

5. Propose new development, enhancement or bug fix, for collaborative development
* Try to finish the issues in previous point

