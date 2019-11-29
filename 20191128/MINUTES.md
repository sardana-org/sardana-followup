# Minutes from the Sardana Follow-up Meeting - 2019/11/28

Held on 2019/11/28 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Juliano Murari, SOLARIS - Grzegorz Kowalski

1. Urgent user problems/issues - Round Table
   * SOLARIS
       *  They have problems with the pseudo motors of the monochromator, because they
          do not always reach the desired position during the scans.
	  The problem could be caused by the hardware (IcePAP). Zibi suggest that it
	  could be related to the emergency break in sardana: if one motor in the motor
	  group goes to ALARM all the motors in the group will be stopped. In IcePAP
	  there is also a hardware protection behaving like this. They will check if
	  this could be the reason (either in Sardana or in the icePAP itself).
	  They had some similar problem some years ago but with all the motors,
          now is only with PseudoMotors, but for sardana and icePAP is very
          similar moving a motor or a pseudo motor, so it could be the same problem.
   * ALBA
       *  They continue working on the migration to python3, they were
          stuck in one beamline, the reason was an issue in pytango or tango
	  (PyTango issue #315 https://github.com/tango-controls/pytango/issues/315).
	  The problem is produced if attribute or device proxies are created or
	  destroyed in several devices in parallel, this increases the number of
	  threads in the Server and hangs for ever. They changed the controller
	  affected by this issue and finalize the migration of this beamline
	  to python3 (the second one in Alba).
	  This issue was arising in sardana due to the way in which the limit
	  protection is implemented. An attribute proxy is created and
	  not used any more, and the ctrl was creating a taurus attribute at any call,
	  and this was creating the dead lock.
          It is not safe to use the limit protection until this is solved, otherwise
          it can cause hangs. For them was hanging by scanning a pseudomotor.

       * Problem storing hdf5 files in the storage system monted with nfs4.
         It was confirmed that the version of hdf5 in scratch debian9 is not compatible
         with nfs4. They changed to nfs3 but this is not ideal, they think to
         use a new version of the hdf5 library. He contacted Jan Kotanski (DESY)
	 to see what it is done in DESY. DESY creates the own packages for the hdf5
	 libraries, do not use the version in the debian repositiory.
	 
       * They still suffer from the problem with complex macro parameters in guis (there
         is a PR from Tiago, but still not updates).

    * MAXIV:
       * They are not still in the latest version of sardana. But they plan to change to it.

       * In relative moves the software limits were not checked properly, the hardware limits
         or the software limits in absolute moves are checked properly and the motors are stopped.
	 The problem arised with physical motors and it was reproducible.
         Juliano will check, if this issue is solved.

       * They have tested the trigger column in expconf for configuring the MG, like
         this they can keep the same MG and the different groups only need
	 to change the synchronization in the trigger column (they are working
	 with movements done in the pmac and using the panda box). They can
	 work like this, but Zibi suggested to use hardware synchronization if
	 possible, so they don't have to change the synchronization in the MG.
	 Hardware synchronitazion can be used not only for continuous scans but
	 also for step ones (in Alba they synchronize step scans with the icePAP,
	 the panda box can probably also do it).

       * Migration to python3 has not started.

       * They are migrating to Centos7.7

     * DESY:
       * The problem with scans involving the Lambda detector is solved. It was
         caused by an exception thrown by the Lambda tango device if the acquisition
	 was stopped with the device in ON state.

       * Start preparing the migration to python3.
       
2. Review pending points from the previous meeting
     - [x] Antonio will share MaxIV beats configuration -> the information was sent to Zibi
     - [ ] Zibi will try the MaxIV beats configuration and put it in the wiki afterwards -> new point
     - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible)
     - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that
     - [ ] Problem with CT acquisition, the values are shifted, problem solved by checking the state in ReadOne. Problem reproducible only on one beamline, but the issue should be created anyway  -> no updates
        - For the moment was considered as high priority only for ALBA.
     - [ ] Newsletter: Add few words on Python3 -> nothing done
     - [ ] Questionnaire -> partially reviewed, a dedicated meeting will be held on Thursday, the 12th December.
     - [ ] Reproduce problems with Sardana Workshop on buster -> it could be related to the problem with the limits
           described above. The problem arised in slit scans, where attribute proxies were created and not used
	   any more. The scans were hanging. It has to be further investigated.
     - [ ] Configure CI on buster -> no updates
	   
     
3. Overview of current developments / PR distribution
    * SEP16 ([#726](https://github.com/sardana-org/sardana/pull/726))
      Update from DESY: DESY plugins are now there.
      Alba will make soon a PR to the plugins git repository, since they migrate to python3 they are organizing
      better the plugins.
      Solaris is working in updating the structure of the plugins, they are thinking about how to make it in the
      best way. They also have licence problems, not clear if the university is the owner of the code or they
      can share it. They have some controllers in the same repository and others independently. The important thing
      is to have them listed, even if point to files (like in the case of DESY). Their current repositories
      are not public. So they will try to make them public and suitable for the catalog.
      Antonio has started to put some of the MaXIV plugins in the catalog but now this is stopped.
      They also had some conflict about what to put in the catalog, each beamline makes
      the things a bit different. They will try to get a common way, also Alba is deciding how to standarized this.
      We agree in accepting SEP16, Zibi will send some e-mail about this.

    * MultiDeviceTestContext ([tango-controls/pytango#314](https://github.com/tango-controls/pytango/pull/314))
      The whole functionality is in the PR for PyTango. Only tests are missing, once the PR is accepted it
      could be used.

    * Pending PR (QtSpock, MacroID, Redis, etc...)
      * MacroID: Grzegorz did not have time to work on that. The PR will be changed to WIP.
      * Add missing default attribute values on Pool start (#1236). This PR is from Henrik (MaXIV).
        The problem arises when diploying sardana with json to tango, writing directly to the DB
	and just restarting sardana. He launches a thread and uses the Attribute Proxies.
        Zibi will propose to fill the DB with the property __value of the attributes in the init_device
	method of the tango classes and it will be written to hardware. It would
   	be like a memorized attribute written to tango. The problem could be if he has in mind attributes
	that are not memorized. Juliano thinks that this is not the case,  that he was only thinking in
	creating new elements in the Pool. Zibi will talk to Henrik to clarify the use cases
        that he has in mind.

4. Discussion about Questionnaire (#24)
     A lot of work was done on that. The questions are mainly focused to the users.
     The scan part is missed.
     Gregorz will modify the current version of the questionnaire according to what
     was discussed today.
     The questionarie will be done in programmatic way, Zibi will take care of that.
     A dedicated meeting will be held on Thursday, the 12th December.
     
5. AOB
   - No discussed about date for next meeting
