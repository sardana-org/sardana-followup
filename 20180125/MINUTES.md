# Sardana Follow-up Meeting - 2018/01/25

Held on 2018/01/25 at 14:00

## Agenda

1. Presentation
  1.  Sardana objects references and the compatibility with Taurus4 (#668 - kick off)
  2.  Centralized logging for Sardana with Elastic
2. User Experience Report - Round Table
3. Collaborative Developments - Review
4. New Developments, Enhancements or Bug Fixes
5. Pending PR distribution and Jan17 release
6. Any Other Business

## Minutes

### 1. Presentation
#### 1.1  Sardana objects references and the compatibility with Taurus4

- PR: [#668](https://github.com/sardana-org/sardana/pull/668)
- Because of the cache mechanism if you change the alias, you must make an init in the pool.
- Keep reference able to distinguish devices and not relying on the tango (FQDN).
- What if the tango host changes? Problem with memorized attributes. PR: [#667](https://github.com/sardana-org/sardana/issues/667)
- Keep ID's and references internally
- It would be good to keep the names unified.
- Convert the names from short names to full names? ... This could be provided by Taurus.
- In a measurement group? Elements should be named by alias.
- In the MacroServer, the container should use the full name internally.
- MacroServer and Pool offering the alias for users always, if possible
- Append or prepend device names to aliases to elements with the same names?
- Pool_name.alias?

__Actions__

- [ ] With several Pools shared in a MacroServer, check if the actual behavior is good enough or if it needs to be improved.
- [ ] Start with the most simple case and evolve from there.


#### 1.2  Centralized logging for Sardana with Elastic

- ElastichSearch, LogStash and Kibanna used for this prototype.
- How to make it tango independent?
  - SardanaCustomSettings could be used but it's not so easy ...
- Initialization in the server
- At this moment, the solution is tango-dependent because it's using tango properties for keeping the configuration

__Actions__
- [ ] Zibi to make a PR and it will be evaluated


### 2. User Experience Report - Round Table

__MAXIV__
- Sardana updated in all the beamlines except one.
- Users complaining about deprecation warnings in spock.
  - SardanaCustomSettings will be used for avoiding the Deprecation warnings.

__SOLARIS__
- Massive upgrade for the control system
- MotorGroups
  - How to delete the MotorGroups? From Jive it may cause problems.
  Maybe some elements were removed at the same time? That could cause the errors.
  The reason for removing them was that maybe MotorGroups were causing troubles with overhead.
  It's a good idea to remove MotorGroups from time to time, they will be recreated if they are needed in future operations
- Events problems: Tango Events no received at all. Due to rebooting VMs. Event system stops working. Rebooting the VM again, fix it.
  Tango Forum: reported a list of possible problems related with Tango Events.

__DESY__
- In shutdown, so no feedback from users.
- Planning the update of Sardana.

__ALBA__
- Moving a pseudomotor hangs a macro or MacroServer (randomly). Seems like the State event is not generated. Pseudomotor based on two physical motor. It will be debugged next Monday.
  - Something similar saw at Solaris when the first movement of a pseudo was loosing the events (just after restart the pool). It will be reviewed by Gregorzs.
  - Position of physical motors is sometimes not updated and that causes the pseudo position not being well calculated.
- It would be useful to have a prepare-measurement (with number of repetitions) before the measurement, just once. (REPEATED from previous meeting)
- It would be useful to have a call to cleanup-measurement at the end of the measurement, not at each step in step scan, just once. (Repeated)
- Standard macros to manage the measurement groups
- New repeat parameters syntax in sequencer (from text file)
- New Macro API method that would be always called at the end of the macro execution, could be called "cleanup" or "restore"
  - Can it be solved with a general hook? generalOnStop hook?

__Actions__

- [ ] Share macros for managing the measurement groups and make a standard macros for this.


### 3. Collaborative Developments - Review

__ALBA__
- About positions on Continuous scans, it couldn't be started.

__MAXIV__
- We were more focused on updating Sardana and Taurus in the beamlines. Not much more done.

__DESY__
- PR created.

__SOLARIS__
- Working mostly on updates.

__Common__

- General Hooks pending from feedback from MAXIV and SOLARIS

- Motor limits issue.
  - Investigation done for accessing the limits of a motor.
  - Avoid the use of attribute proxy and use the configuration of the attribute?
- Taurus4 compatibility with names. SOLARIS interested in working in this issue, but they are very busy with the upgrades.

__Actions__
- [ ] General hooks to be merged in the next Sardana release as an experimental API, then during the next months it will be evaluated and if no issues appear, then it will be official in the following release.
- [ ] Integrate the actual solution for the Motor Limits Issue as an experimental solution and in the meantime try to find the best solution. Before the release.

### 4. New Developments, Enhancements or Bug Fixes

- Continue with the taurus4 and Sardana references, logging, motor positions in continuous scans ([#643](https://github.com/sardana-org/sardana/issues/643)), and integrate the limit protection.

### 5. Pending PR distribution and Jan18 release

- General hooks
- Pseudos limit protection
- Testing Jan18 release on:
  - CentOS 7 (Sardana and Taurus4): MAXIV
  - Suse and Windows: ALBA
  - Debian (and CentOS): SOLARIS

### 6. Any Other Business

- Nothing to be reported.
