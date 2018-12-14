# Sardana Follow-up Meeting - 2018/12/13

Held on 2018/12/13 at 14:00  

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Antonio Milán, SOLARIS - Grzegorz Kowalski

# Minutes

1. Urgent user problems/issues - Round table
   * SOLARIS:
     - feature requests: dump/load whole configuration of Sardana elements,
     ex. for going to another DB, and scripts for populating Sardana with
     elements.
     In MAXIV they have a configuration tool, sardana DSconfig, one can
     make dumps and differences betwenn different configurations.
     Another meeting will be scheduled for explaning it. It is
     based on the Tango DSConfig, but it was modified for handling problems
     with sardana.
     - documentation feedback: not much documentation on recorders, ex. nothing
     said about recorders to be used with different macros as scans.
     Zibi thinks that there is no problem, but they expect an environmemt
     created by the scan frame, so some information can be missed.
     - feature request: formatting scan output, ex. for the timestamp.
     - question: could an experimental channel be used simultaneouly by two
     doors?. Zibi answers that it should not work, if it works is a bug.
     It would need to change a lot of things for making this working.
     For the tango zerod should not be problem, tango would serialize it
     and read a tango attribute. But for others than zerod it will depend.
     In general each element in Sardana should be only used at once.   
     Gregorz wanted to read a Tango Attribute with the epoch time from
     different Doors. Zibi suggests to create the epoch time from the
     dt of the scan. The important thing is to save it in the file,
     and dt and a start time as saved (but dt is not relative to the start
     time), Zibi suggests to make it coherent and use then these
     information and not add any extra ones.
     - MacroServer requires qt bindings due to parsers in spock.
     This issue is already solved with the change in spock syntax.
     - Time between scan points is larger than the expected
     one, Gregorz thinks that is related to the MG synchronitation.
     There are some issues related to this, ex. by DESY. SEP18 could avoid
     some delays because some preparation goes to the beginning of the scan.
     It will be investigated with tools for time profiling and see if
     there is some room for improvement.

   * ALBA:
     - nothing to report

   * MAXIV:
     - when running long scans the macroserver hangs, they are trying
     to investigate it. It is not clear if it is a sardana issue, it could
     be the write of files. They can not reproduce it and it happens in
     one of the beamlines once or twice per week. It could be a network
     problem. In the logs one can see that the acquisiton starts but no
     events are sent any more. There was a PR that solved the problem of
     attributes not sending events, but it should be included in the current
     release (PR738).
     - some issues with the Pool, but they will be further investigated before
     reported them.
     -  In one of the beamlines some user overwrite standard macros and
     they endup with a MS without standard macros. The macros overwriting
     the standard ones were created in a different module, in that case the
     rest of the standard macros should not be affected. For avoinding that
     this happens again they modified spock, so that it sends a message if
     the standard macros are not overloaded.
     
   * DESY:
     - in one beamline the measurement group stays for ever in MOVING at
     some point of the scan. One has to stop the measurement group, calling
     its Stop command from some other client, and the scan continues without
     problems. A script was done for detecting this and solving it stoping
     the measurement group. It happens several times per day. It will be
     investigated in detail next week.
     - big delays at the beginning of the scans if all the motor positions were
     written to the fio files. The macro wa is improved for avoiding this, it
     could be applied to this case.
     - problems with expconf due to different versions, they are solved.
     - hkl macros are not right for some DESY specific diffractometer types,
     a new version will be tested in January and a PR will be made.
     - problems with appendHook, the documentation has to be updated
     (issue #962)
     
2. Overview of current developments
	* Check motor limits before starting scan; it is probably finished,
	last requested changes are done. There are some problems with travis,
	some scans give timeouts, they have to be solved. But it can be
	probably integrated after solving this and checking the last changes.
	* Asynchronous Logstash Communication - PR#895. The last modifications
	were done, a last test would be done and then it would be ready
	for being integrated.
        At MAXIV the log files are written  using filebeat from logstash, the
	configuration is easy and does not need modifications in Sardana.
	Antonio offers this as another alternative.
        The documentation will be put in the wiki because it is not a
	Sardana feature.
	* SEP18, the development is done. The PR is fast reviewed,
	there are still some decisions to take. About the controller API,
	if there is no comments the option 1 will be used. The rest of the
	things are implemented. Stop channels configured with hardware
	trigger will go to another scope, for not stopping the development of
	SEP2. It has to be documented for the user point of view but this will
	not be done until SEP2 is finished. The SEP18 is documented by itself
	for the developers. A comment in the user documentation will be done
	for the moment.
	* Independent acquisition of experimental channels - issue#185. This
	feature does sep2 development more developers friendly, since SEP2
	speaks about reporting references to the data and configuring the
	saving and this is more convinient to be done at the experimental
	channel level. The feature request is old and comes from desy.
	It is useful because allows acquisitions independently, even if
	it blocks the MG. For the SEP2 only the timerables experimental
	channels are needed, the others will be implemented after those.
	Request for developers.
	* SEP2. Nobody disagree on what is proposed. The names are accepted.
        The overwrite policy will be removed from the standard interface.
	A general description will be added. Request for developers.
	* Urgent PRs:
	   * Hotfix 2.5.1. It was applied at DESY and MaXV for making the
	   1D controllers  working. It would be pushed to develop without
	   making a PR or hotfix (it saves work).
	  
3. Comments about Sardana presentation in the "Automation in Beamline 
   Control and Data Acquisition Workshop" (to be held in Berlin - January 2019).
   Ideas in  https://hackmd.io/s/BkjXSekxE#.


The rest of the points in the Agenda will be shifted to the next Folloup
Meeting.

Additional comments:

* Beamline in MAXIV using sep6 for continuous scans, it works fine.
*  Conda environment for Sardana done by Antonio. It needs to install Taurus
and Sardana but one can not have qwt or pymca. Apart from that it works.

jitsi was used for this meeting, it seems to be stable. It will be tested on
the 14th with more users.
Next meeting will be held on January the 10th, 2019

