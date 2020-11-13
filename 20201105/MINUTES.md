# Minutes from the Sardana Follow-up Meeting - 2020/11/05

Held on 2020/11/05 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Aureo Freitas, SOLARIS - Michal Piekarski 

## Minutes

1. Discussion about Questionnaire ([#24](https://github.com/sardana-org/sardana-followup/issues/24))
  - Feedback from the institutes
      - 21 questionnaires filled at the moment (ALBA, IPANEMA, SOLARIS, MBI)
      - From ALBA some are from beamlines some from labs using Sardana
      - Missing feedback from MAX IV and DESY - reminder emails to beamlines/labs will be sent
  - One should fill part of the questionnaire which is suitable to their case (i.e some subsystems only benefit from Sardana motion control)
  - CS assist in filling questionnaire is advised (as a part of training) but not necessary
  - Main goal is to get to know the needs of the beamlines and labs
  - Appropriate weights will be assigned to the issues from the institutes (in particular different weights for beamlines and labs)
  - We move deadline for collecting questionnaires until the next Followup meeting
  - Bug squashing party - Virtual meeting based on questionnaire's results
    - Postponed for now - first we need to have all answers
    - Before meeting, we need to evaluate all answers and create some kind of backlog to get to work right away during the meeting
    - Dropping support (or even removal) of features never fully implemented or buggy that no one is interested in e.g. sardanaeditor could eventually happen.
2. Urgent user problems/issues - Round table
  - General issues:
      - Sardana motors archiving at HDB++ ([#1429](https://github.com/sardana-org/sardana/issues/1429))
        - MAX IV pointed out that polling may affect scans (triggering `ReadOne()` method), they haven't chosen solution yet
        - In case of archiving only `Position` attribute we can use `ReadOne()` `ReadAll()` and query IcePAP - more tests have to be done
      - Controllers API ([#1430](https://github.com/sardana-org/sardana/issues/1430))
        - Not a good moment to change API. Solution: mark it as deprecated and update the docs
      - Problems with moving motors with Tango polling ([#1431](https://github.com/sardana-org/sardana/issues/1431))
        - We should post there our motor-polling-related issues 
        - More investigation is needed to determine what the limitations are
      - Acquisition in pre-acq hook fails due to MeasurementGroup not prepared after updating to Sardana 3.0.3 ([#1426](https://github.com/sardana-org/sardana/issues/1426))
      - Find a way of doing stuff with hardware on the beginning and end of the acquisition in 0D (i.e switch on/off hardware) ([#1322](https://github.com/sardana-org/sardana/issues/1322))
        - PR should be posted for the discussion
        - adding `Start` method is a reasonable option
  - MAX IV
    - Two beamlines are already migrated to Sardana3. Next one is work in progress - should be ready soon
    - Work on new recorders is in progress - beamline scientist request for new output data formats
    - Pausing with trigger gate controller for continuous scan issue ([#1423](https://github.com/sardana-org/sardana/issues/1423))
    - Trigger on alternate steps issue ([#1432](https://github.com/sardana-org/sardana/issues/1432))
        - Pair-programming session is planned to find out solution
  - DESY
    - Testing Sardana3 on development environment - not on production yet
    - Currently at the process of migrating controllers to Python3
        - maybe MAX IV has already migrated some of then - needs to be checked
  - SOLARIS
    - Testing Sardana3 on development environment - not on production yet
    - Issues with MacroServer hangs 
        - MacroServer starts the acquisition, on the Pool side acquisition loop ends but no event is received on the MacroServer side
        and scan is hanged
        - Is may be caused by deadlock. Fix in Sardana3: ([PR#1348](https://github.com/sardana-org/sardana/pull/1348))
        - Migrating to Sardana3 may solve most of the stability issues
  - ALBA
    - hangs in running two macros on two different doors at the same time (issue posted in Pytango/Tango - waiting for the answer)
    - posting couple of PRs to fix issues (listed in Point 4)
3. Review pending points from the previous meeting
    - From the last meeting:
        - [ ] MAX IV: Timestamp issue ([#1371](https://github.com/sardana-org/sardana/issues/1371))
            - Solution has been found - 2D ExpChan controller "TimestampCollector". It collects timestamps to the file.
        - [ ] SOLARIS: Cannot stop multiple motors movement in backlash direction [#1421]
            - No update
        - [ ] MBI: - Issue with API event timeout ([#1417](https://github.com/sardana-org/sardana/issues/1417))
            - solved
        - [ ] IPANEMA: - Migration to sardana 3 issue ([#1410](https://github.com/sardana-org/sardana/issues/1410))
            - solved, investigation pointed to the next issue ([#1425](https://github.com/sardana-org/sardana/issues/1425))
    - From previous meetings:
        - [ ] Alba propose examples on how to program without `on_stop()` and `on_abort()` Macro methods. No status update!
        - [ ] MAX IV will provide a docker image to add to CI. No status update!
        - [ ] Shutter integration in continuos scans: status update. No status update!
        - [ ] MaxIV beats configuration status: update from  Alejandro's work. No status update!
        - [ ] Add information on how to access debug information of libtango9-dbgsym (seems like some information is not accessible). No status update!
        - [ ] Users can break Sardana by messing with configuration in Tango DB, diagnostic script should be created to check that. No status update!
        - [ ] Configure CI on buster (problems with test suite on Python 3.6): status update. No status update!
4. Overview of current developments / PR distribution
    - Fix delay description in position domain ([#1428](https://github.com/sardana-org/sardana/pull/1428))
    - Fix double unit shown in motor widget ([#1424](https://github.com/sardana-org/sardana/pull/1424))
    - Fix macro function default settings ([#1422](https://github.com/sardana-org/sardana/pull/1422))
    - Add scan widgets ([#1386](https://github.com/sardana-org/sardana/pull/1386))
5. AOB
    - Your experience with Sardana channel on Slack so far? 
        - Everyone found their own way of receiving notifications :)
        - Next tool to monitor, has some nice features over GitHub, but not a must-have
        - Do we need it? Decision postponed to the next meeting.

* Next follow-up meeting will be organized by Zibi and will be at December 10th.
