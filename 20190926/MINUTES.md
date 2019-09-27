# Minutes from the Sardana Follow-up Meeting - 2019/09/26

Held on 2019/09/26 at 14:00

Participants: ALBA - Zbigniew Reszela and Marc Rosanes, DESY - Teresa Núñez, MAXIV - Antonio Milán and Juliano Murari, SOLARIS - Grzegorz Kowalski

## 1. Urgent user problems/issues - Round table

### ALBA

- Migration of Sardana to Python3, deployed, tested, works fine, but the beamline doesn't use advanced features
- Part of bigger migration to Debian 9, Tango 9 and Taurus 4
- [Scripts on wiki](https://github.com/sardana-org/sardana/wiki/Recipes) gathering information on 3rd party elements, useful for reproducing bugs and update TANGO_HOST
- Hanging scans solved by 2.8.3 patch
- Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that

### DESY

- Problem with CT acquisition, the values are shifted, problem solved by checking the state in ReadOne
- Problem reproducible only on one beamline, but the issue should be created anyway

### SOLARIS

- Updated to 2.8.3 which solved the hanging scans issue
- Adding new controllers, TangoAttrMotor and manipulator control
- Configuration based on dsconfig files, with manually assigned IDs

### MAX IV

- Migrated all beamlines to 2.8.1, didn't test the hanging scans
- In the process of migating controllers to separate projects

## 2. Overview of current developments / PR distribution

### SEP16 ([#726](https://github.com/sardana-org/sardana/pull/726))

- Divide the catalog by institute
- First PR to the catalog by MAX IV!
- MAX IV started migrating controllers
- Tango module for Ansible used to configure plugin paths
- Experiments with using entrypoints to load plugins by Antonio, currently fails on Sardana metadata, should be proposed as new SEP
- First, list of all features of current plugin system should be created, then the proposal for the new one

### New widget for experimental channels ([#1203](https://github.com/sardana-org/sardana/pull/1203))

### Snapshot configuration macros ([#1199](https://github.com/sardana-org/sardana/pull/1199))

- Names should be changed to follow other macros scheme

### Extension API and macros for configuring MeasurementGroups - proposal

- With this done, all functions of expconf will be also available via macros

## 3. Sardana Workshop @ ICALEPCS2019

- VM problem fixed by disabling screen lock
- Sardana does not support automatic unit conversion with pint
- Agenda discussion
	* The workshop might be too intensive for people not familiar with Sardana
	* There may be too much in the programming part
- TODO
	* Deprecation warnings, can be hard to fix them all now, modifying `tauruscustomsettings` helps
	* Exception in `relctrlcls` is the most urgent issue

## 4. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))? (Carried over from previous meeting)

- List of features, good/bad/missing
- Part for users, beamline scientists, controls contact
- Use Sardana documentation as base for feature list
- Users select features they use, and the detailed questions shown to them are related only to these features
- Questionnaire for beamline users as second iteration
- Review existing feature requests and include them in the questionnaire
- Distribute parts of Sardana to prepare questions about:
	* **Spock** - Grzegorz
	* **Taurus widgets** - Grzegorz
	* **Acquisition** - Zibi
	* **Motion** - Zibi
	* **Macros** - Teresa
	* **Data handling** - Teresa

## 5. Discussion about Newsletter ([#32](https://github.com/sardana-org/sardana-followup/issues/32))

- Newsletter should be written for scientists, using a language meaningful to them
- With new features, put a short description in wiki, until the newsletter format is decided
- For 3.0 release, few words on Python3
- Also prepare descriptions for new widget for channels and snapshot macros

## 6. AOB

- Debugging hangs with gdb: attach to the Python process and look for hung threads
- Antonio takes parental leave in ~2 months, Juliano takes his place and needs permissions to repos, etc.
- Next Sardana Follow-up meeting on 24.10.2019 at 14:00.
