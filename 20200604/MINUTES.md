# Minutes from the Sardana Follow-up Meeting - 2020/06/04

Held on 2020/06/04 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Aureo Freitas

1. Demo:
   * New MeasuremengGroup configuration API and expconf macros
   * Improved PCTV widget and Taurus entry point for TauruForm items factories
       * MaxIV integrates detectors as counter/timer controllers. The detecotrs
         just save data in the data center and these are not seen by the control
         system. SEP2 and Referable controllers could be used here to get the URI
         to the data to the Sardana file e.g. hdf5 with VDS to the detector's data.
2. Urgent user problems/issues - Round table
    - DESY
        - test Sardana Py3 with dummies and real hardware - OK for the moment
            - to be on the safe side better use Tango 9.3.4rc5
        - user's complain about dead time in scans
    - MaxIV
        - Continuous Scans integration with Eiger done - now writing unit tests
            - [ ] Aureo will register the controllers in the sardana-plugin catalogue
        - Continuous Scans integration for a BL at the end of the linac (*a kind of FEL*)
            - machine timing system injection (2Hz - 10Hz) signals together with delay generaor are used to synchronize the detectors.
            - there are 15 detectors in the measurement group
            - a timestamp mismatch was observed in step scans
            - in continuous scan they plan to use a counting card (NI6602) to count
              the triggers and inhibit the delay generator after a given number of events
        - Continuous Scans with ID - under discussion, for sure will use IcePAP
    - ALBA:
        - discussing if using Conda for Sardana in production
            - At MaxIV conda is used in the cluster to data analysis, all the control system is deployed with RPM.
            - DESY do not use Conda in production.
        - MotorGroups containing offline motors raise exceptions - this seems to get worse with time
        - Maybe we will need to work in a direction of step scan optimization - start moving on readout.
    - Community and other
        - Energy motor question from Daniel (MBI)
        - Use asyncio for controllers from Stanislaw (Solaris)
            - We don't have real experience with asyncio
            - It seems that threads would be very difficult to eliminate
              from Sardana without a big redesign
            - Mixing both threads and asyncio may be also hard to maintain
            - We don't see it as a high priority for the moment
        - Notify from controller to the core from Daniel (MBI)
            - instead of using action_loop to poll controller it could be
              the controller which notifies
            - this could be complementary to the polling loop - there will be
              always cases where we don't have the notification
              e.g. no underneeth Tango DS, no SDK callbacks, etc.
            - We don't see it as a high priority for the moment
3. Review pending points from the previous meeting
    - [ ] Add migration guide for Sardana 2 -> Sardana 3 to
          the [docs](https://sardana-controls.org/devel/guide_migration.html)
          No update.
    - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods.
          MAX IV and DESY need to test and review the new implementation.
          No update
    - From previous meetings:
        - no update on any of the points
        - [ ] What about SOLARIS involvement in the Sardana project? 
        - [ ] Shutter integration in continuos scans: status update
        - [ ] Pseudomotors not reaching positions: need status update from Solaris control group.
        - [ ] MaxIV beats configuration status: update from  Alejandro's work.
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
        - [ ] Few words on Python3 in Newsletter: status update
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update
4. Overview of current developments / PR distribution   
    * How Tango issues affects Sardana?
        * https://github.com/tango-controls/pytango/issues/307 and https://github.com/sardana-org/sardana/pull/1298
    * Latelly merged
        * Dump info on measurement group failure in ct and scans
        * PMTV
            * don't rely on the encoder attribute
            * limits are no more buttons but labels with icon
            * reset pending operation on changing from absolute to relative
    * Acquisition performance base-line https://github.com/sardana-org/sardana/issues/161
        * We hit a bug in repetitive count (Pool side) executions
        * For the moment focused on count (Pool side)
        * test could comprise the following cases:
            * 1 ctrl - 20 ch
            * 2 ctrl - 10 ch each
            * 4 ctrl - 5 ch each
            * 10 ctrl - 2 ch each
        * DESY had done a similar benchmark already but involving the whole scan - http://hasyweb.desy.de/services/computing/Spock/node79.html
        * MotorGroups refactoring (https://github.com/sardana-org/sardana/issues/740)
        * Idea from Tiago on how to get rid of MotorGroups as Tango devices
            - Command to ask for a grouped motion, which return id to the client
            - Attribute with events {id: state}
    * Jan20 release:
        - skip Jan20 milestone and move issues to Jul20 milestone - bulk move
        - review milestone
            - from big things: remove deprecated warnings and integrate QtSpock
        - plan release
            - Teresa will substitute Zibi if he is still on leave when Taurus will
              get released.
5. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
    - Any feedback from your colleagues? - No feedback yet.
    - [ ] Remove outdated questions e.g. MeasurementGroup API, expconf macros, etc.
    - Recreate the questionnaire before sending it.
6. SEP19 ([#1328](https://github.com/sardana-org/sardana/pull/1328))
    - MaxIV in favor of using entry points
    - Look if possible to keep having the Path properties cause DESY prefer them instead of entry points.
8. AOB
    - Next meeting after Taurus release
