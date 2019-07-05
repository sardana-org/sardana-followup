# Sardana Follow-up Meeting - 2019/07/04

Held on 2019/07/04 at 14:00  

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Antonio Milán, SOLARIS - Grzegorz Kowalski

# Minutes

1. Urgent user problems/issues - Round table
   * MAXIV:
     - they have just upgraded software and network and are mainly busy on
     that.
     
   * SOLARIS:
     - problem using the TangoAttrMotorController class: if they have in
     Sardana a motor instantiating this class (not even being used) Sardana
     hangs during scans. Restarting the MS solves the problem. It happens
     randomly, sometimes very often. They will check it in two weeks,
     during a shutdown. The problem could be caused by the devices they
     connect to in the controller of the TangoAttrMotorController class.
     The problem was not observed in other institutes, but this controller
     class is not intensively use.
     - they get some nodata during scanning, the reason is unknown, it will be
     investigated.
     
   * ALBA:
     - not new issues, but the one related to the "general condition"
     implementation (discussed below).
     - they are starting the python3 migration. A script is being prepared
     for helping in the migration of the plugins, the script will check the
     libraries that are used and if they are in python3, imports, dependencies,
     number of lines of codes. It produce some numbers that will help in
     the migration. They will share it once that it is ready. They are
     also preparing a code for checking the controllers without the pool, it
     is very simple, but enough for instantiating controllers and perform
     actions like moving or counting. For migrating the macros the strategy
     it to wait until the MS is migrated to python3 because
     it is difficult to check macros without MS.
     They would put in wiki the experience gain on this.

   * DESY:
     - nothing to report
     
2. Overview of current developments / PR distribution
   * SEP16 ([#726](https://github.com/sardana-org/sardana/pull/726))
     - Discussion coockiecutter template
     The outcome of this discussion will be summerized in SEP16.
     A discussion about cookiecutter will be continued in a dedicated
     meeting.

   * Migration to python3 
     A discussion about Sardana project migration was started in issue #1089.
     It was decided that the compatibility with python2 will not be maintained,
     Sardana will move to python3. A branch for supporting python2,
     support-2.x, will be created.
     The migration will be done compatible with python3.5 (version in
     DESY and Alba, Solaris and MaxIV will start using a higher version).
     The migration will start after integrating the last relevant PRs.
     The first step it to run the 2to3 script, after that the testsuite will
     be run, and once testsuite returns no errors, the manual tests will
     start. It is known that some changes will have to be done manually.
     Tests in Windows will be done if there is time, it is suggested that
     the institutes interested on it perform the tests.
     The python3 code will be integrated in the sardana develop branch
     as soon as possible.      
     Plugins migration was discussed in point 1 (ALBA).
     Each institute will take care of migrating its own macros and controllers.
     In DESY, MaxIV and Solaris there is not date for changing to python3.
     Alba plan to change soon.

   * General Condition feature.
     A discussion about this feature and the current implementations (in
     Alba and DESY) can be read in issue #1159.
     The solution of Alba implements a new points generator but it does
     not avoid that the motors are tried to be moved to the repeated positions.
     The solution of DESY does not have this problem, none positions are
     sent to the motors in the repetions of the points. Zibi suggest to fill
     the motor position to None in the generator and so the Alba solution
     will not try to move. From the implemtation point of view, the Alba
     solution requires programming a generator, what can not be done by
     the users. The DESY requires the implementation of a macro returning the
     result of the evaluated condition (0 or 1), this can be done for the
     users and easily changed.
     Zibi asked if it would be possible to modify the DESY implementation, so
     that the macro with the condition is called as a general hook, in a
     new defined hook place.
     Solaris is interested in this feature for pausing macros, but for that
     the wanted a post-acq hook can be already used.
     DESY will post the code with its current implementation in the issue
     #1159, Alba will reviewed and check if it is possible to integrate it
     using the general hook mechanism. For that, the general hook implementation
     will be extended, so that they will return a result and the action
     to take afterwards will depend on this result.

3. Jul19 release summary
   The Release is finished.
   There are some issues related pypi and the github deployment, for that
   reason the 'How to release' will be reviewed and updated from the
   experience acquired during this release.

4. ICALEPCS2019 Sardana workshop
   Zibi and Gregorz will for sure be present.

5. Discussion about Questionnaire (#24)
   Gregorz will start creating a questionnaire and then we will check it.
   

Next meeting will be held on August the 8th, 2019

