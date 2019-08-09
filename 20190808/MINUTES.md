# Minutes from the Sardana Follow-up Meeting - 2019/08/08

Held on 2019/08/08 at 14:00

## Actions

- [ ] MAX IV to add the EM# (a.k.a. albaem2) sardana controller and macros repository to the catalog.
- [ ] Antonio to add to the Sardana Wiki the recipe to move the old controllers to the catalog, keeping the history.
- [ ] Zibi to move SEP16 to CANDIDATE.
- [ ] Zibi to send an email to the assistants to the ICALEPCS workshop to ask about the convenience of using virtual machines for that training.
- [x] Antonio to merge the python 3 PR.

## 1. Urgent user problems/issues - Round table

### ALBA

- Problem in a beamline using 2 pools, ID and BL, doing scans with pseudomotors, sometimes the move of the pseudo of the ID doesn't finish.
  EventsRecorder reveals some strange things with wrong event values.
  Pool on ID with Polling enabled. Github issue: #1181

- One beamline updated with the Python 3 version.

### DESY

- No news as they were in shutdown.

### SOLARIS

- Cleaning Sardana configuration solved some of the problems at Solaris.
- Working on DSConfig files.

### MAX IV

- No new issues to report
- Only the tests and validation of the solution for the github issue #1171.

## 2. Overview of current developments / PR distribution

### SEP16 ([#726](https://github.com/sardana-org/sardana/pull/726))

New repository for [sardana-plugins](https://github.com/sardana-org/sardana-plugins)

- Table format or bullet points? Table format more intelligible.
  Table format usage is agreed.
  Short description goes into the table and long description into a README file in the equipment repository.
- SEP to be moved to CANDIDATE.
- What to do with the old repo, one entry in this catalog? or more?
  Add a links into the catalog, one for controllers that are not moved and another for the macros.
- How to make the transition to python3 for the controllers?
  Let the project owner or maintainer of each repository to decide the best way.
- Keep the history of the controller? Let the project owner or maintainer of each project/repository decide.

[How to organize your plugins](https://github.com/sardana-org/sardana/wiki/How-to-organize-your-plugin-project)

- Possibility to use consultancy budget from MAX IV to create a web interface for the catalog, similar to the Tango Catalog.

Right now we will continue with the catalog as it is planed, and we will evaluate in the future if there is room for improvements.

- Brainstorming of new features, investigations and a whish list of features can be added in a wiki page, adding also a description about the process to start a contribution, via sep or issue, and keep a point for this topic in the agenda of the follow-up meetings.

### Migration to python3

- More info [here](https://github.com/sardana-org/sardana/pull/1173).
- Which behavior should we use for the shelve of macroserver.
- Alba prefer `dumb` because it's available on Conda.
- Solaris prefer `gnu` because of the large Macroserver environments that they have.

The conclusion is to continue as it is now, being the default `gnu` and then `dumb`, allowing users to change it using the settings.

### Online Plotting Solution for Python 3

- Tiago already implemented a solution with PyQtGraph.
- More info [here](https://github.com/reszelaz/sardana/pull/25)
- Agree to merge the python 3 branch into development.
- Python 2 will be used for hot-fixes and back-porting new features, but the main development will be done in python 3.

## 3. ICALEPCS2019 Sardana workshop

- Demo on possible material to use done by Z. Reszela
- More discussions about the ICALEPCS preparations on the next follow-up meeting.

## 5. AOB

Next Sardana Follow-up meeting on 5th of September at 14:00.
