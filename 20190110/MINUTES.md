# Sardana Follow-up Meeting - 2019/01/10

Held on 2019/01/10 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Antonio Milán, SOLARIS - Grzegorz Kowalski

# Minutes
1. Urgent user problems/issues - Round table
    * DESY - no urgent issues
    * ALBA - similarly to MaxIV we have observed a missing event at one of 
    our beamline (CLAESS). In our case this was state event coming from the motor group. Suspicious - in case of MaxIV it was the measurement group's state. @rhomspuron will prepare a tiny client application which will subscribe to the event and log the arriving events to a file.
    * MaxIV - controller inheritance problem - investigation ongoing in [sardana-org/sardana#1005](https://github.com/sardana-org/sardana/issues/1005)
    * Solaris - observed issue in the documentation of [How to controllers](https://sardana-controls.org/devel/howto_controllers/howto_controller.html) - case sensitivity of the axis, ctrl, axis extra and ctrl extra parameters. Issue to be created in the backlog.

3. Overview of current developments
	* Check motor limits before starting scan 
	    * @daneos will investigate the tests and for the moment we do not rollback to the PyTango solution.
	* SEP18
	    * SEP was integrated. Few issues were found and fixed already.
	* Independent acquisition of experimental channels - [sardana-org/sardana#185](https://github.com/sardana-org/sardana/issues/185)
	    * Implementation almost done
	    * Default timer could be tested on the dummy ctrl
	* SEP2
	    * Implementation in progress
	    * Value references transfer is already implemented
	    * H5 recorder will be limited to handle one reference per record (acquisition frame) using Virtual Data Sets.
	* Add support to Qt5 - [sardana-org/sardana#1006](https://github.com/sardana-org/sardana/issues/1006)
	    * Work in progress by @mrosanes and @teresanunez, @daneos may also join.
4. Comments about Sardana presentation in the "Automation in Beamline 
   Control and Data Acquisition Workshop" (to be held in Berlin - January 2019)
   * the talk contents was reviewed - it will be quite difficult to include all the contents
4. Review [Jan19 milestones](https://github.com/sardana-org/sardana/milestone/5)
    * milestone scope was reduced
6. Coordinate Jan19 release
    * [How to release](https://github.com/sardana-org/sardana/blob/develop/doc/how_to_release.md) was reviewed
8. Brainstorming - moved to the next meeting
	* Review of:
	    * Issue prioritization
	* Brainstorming topics left from previous meeting:
	    * newsletter
            * git plugin for git-flow
