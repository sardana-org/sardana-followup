# Sardana follow-up meeting
Held on 19.06.2018 at 14:00

Participants: SOLARIS - Grzegorz Kowalski, MAXIV - Antonio Milán,
              DESY - Teresa Núñez and ALBA - Zbigniew Reszela

# Minutes

1. Urgent issues/problems

* MAXIV
  * Vicente is at MaxIV debugging problems and working on logging.
  Logging improvements could be driven as a new SEP.
  * Logging improvements were done by Vincent and Antoine and a PR will be
  proposed soon.
  * MaxIV is using supervisor for starting Tango Device Servers.

* Solaris
  * Started using Elastic with Sardana
  * Upgrade Sardana at one of the beamlines to version 2.4 is in progress.
  * Tested bash session transcript (`script` command) as an alternative to
  "Macro Logging". It works well with spock. Colors are also saved - this may
  be problematic to certain editors.
  * Py2exe is not maintained since 2014, so it's probably not an option.

* DESY
  * No issues/problems

* ALBA
  * Problems with the standard errors log files written by Tango:
    all Tango Server write log files with the standard errors (one file
    and three backups are kept in a default directory), due to some controllers
    a lot of logs were written and the log files reached more than 1GB. There
    were a lot of deprecation messages and the logger was not able to write
    the file, showing the error IOError (Errno 27) "File too large".
    Neither Tango nor Sardana have made changes affecting the logging,
    the observerd problem depends on settings of the system/partition mounting,
    like limit of the files size, etc.
    MAXIV could have observed the same effect.
  
2. Preparation of the Sardana Documentation Camp (Alba-July18)

    * Present current sardana documentation (Zibi) -  see slides
    * Present structure of the Sardana-DESY documentation (Teresa).
      The documentation is for users and developers.
      It is too specific for DESY.
    * Best practices when writing documentation (Antonio) - see slides
    * Present a documentation strucuture of some other well documented
      projects (Grzegorz).
      * Tango: the structure is similar to the current Sardana documentation.
        What is nice is the docu for tools and extensions:
	Taurus guis und sardana widgets could also be documented like this.
  	They also have the docu repeated in several places. There are places
	with code and not explanations, this should be avoided.
        A good thing is to put the 'intended audience'. Another good thing
	could be to put links to point for ex. to the developers documentation.
        Good is also a description for starting the system from scratch and
	how to configure it, in Sardana is missed how to setup controllers
	or devices is missed (there is only the sar_demo).
      * Stripe: the documentation is good, divided into sections, each with
        a quick start, a little bit of code, and the API calls.
	Really nice: there is not 'next step' but list of topics that could
	be the next steps for what we have just read.
  	It has really nice look at feeling, good example. All the things
	are really well documented with explanations, screenshots and API
	outputs. Each section has a real granularity, nicely divided into
	pieces. The API references are really good: explanation in one side
	and examples with code in the other side of the screen.

3. Sardana Documentation Camp organization issues:

    * How to work: there is the meeting room for training with computers,
      Alba could create accounts for the participants and we could work there.
      We could start creating issues and managing them, the small issues could
      be taken by small groups (one or two people). We could distribut the
      tasks in pairs. Each pair could make PRs that will be reviewed by another
      group. We could still have a brainstorming meeting before the
      documentation camp.

    * Ideas about the agenda:  start with the users feedback section
      (users: Sebastian, Daniel, ...), followed by some basic guidelines,
      a presentation of a new design and integrate it with the user feedback,
      apply the feedback on top of what is proposed and agree in something.
      These first points should be ready in the first midday.
      After this we keep the issues in pairs and make PR to accept them.

4. Comments from users about the documentation:

    * setup for controllers and things like that should be added.
    * more advanced things are not documented at all, ex. sardana customs
      settings, device properties.
    * internal structure is not well documented (Grzegorz has some photos
      with structure done during a Sardana Workshop given in Solaris by Alba).
    * no documentation for many continuous scans topics, ex. how
      to write the controllers.
    * no documentation about how a controller plugin become a tango device,
      it is not clear how they relate together, and how the sardana elements
      are seen from a macro ... what can do the motor object in a macro?,
      it is not the motor tango device, and they don't know how to use it.
