# Sardana follow-up meeting
Held on 04.10.2018 at 14:00

Participants: ALBA - Zbigniew Reszela, DESY - Teresa Núñez, MAXIV - Antonio Milán, SOLARIS - Grzegorz Kowalski

# Minutes

1. Quick overview of urgent issues
    - Current development problems
        - #816 discussion - the tests were done on the beamline with real devices (Adlink cards) on **Python 2.6**
        - Extended Spock syntax
            - create unit tests based on example macros
            - unit tests for string with quote characters
            - new parser could be used in sequencer
        - Logstash handler
            - test with in-memory cache
            - ask about SQLite problems on `python-logstash-async` project
            - save DB on disk only in case of failure
        - SEP18
            - two step loading for controllers
            - could be beneficial for AlbaEM and FMB Electrometers
            - PrepareOne + LoadOne or only one loading method?
            - we should check what our hardware expects from control software
    - Urgent issues
        - Bug in Tango 9.2.5 - lost events after some time
            - [TangoTickets/#22](https://github.com/tango-controls/TangoTickets/issues/22)
            - related to ZeroMQ version, present in 4.1.4
        - Scans slow down if there are faulty channels
            - cannot reproduce in the lab, no access to beamline for now
        - If there's an error during acquisition, scan stops
            - the behaviour changed, previously it would continue and print `<nodata>`
            - we should go back to previous behaviour or make it configurable by global or per-channel environment variable
2. Brainstorming
    - Follow-up meetings
        - good idea, format is also good
        - inviting others: generally good idea, but probably will require more time
        - in such case, we should start from user feedback session
    - Video conference tool
        - Jitsi (https://meet.jit.si/)
        - OpenMeetings (https://openmeetings.apache.org/index.html)
        - Google Hangouts (https://hangouts.google.com/)
        - we should shedule the test calls and evaluate the tools (#25)
    - Issue prioritization
        - **We need feedback from users!**
            - questionnaires (#24)
            - questionnaires should be granular enough to find out which features are most critical
        - Who and when decides on the priority?
            - we should decide basing on the questionnaires
            - we should prioritize existing issues once, and then for the new issues only
            - priorities can change over time
        - Prioritization tool
            - labels - probably the best solution (#28)
            - order of issues in a milestone
            - project boards
            - reactions - how about no? :)
    - Collaborative development
        - depends on the issue
        - remote pair programming (#26)
        - use videoconferences as much as possible
        - Slack? (#27)
        - use the project boards for big developments such as SEPs
    - Brainstorming topics left for the next meeting
        - communication with users
        - releases
        - teams discussions
        - milestones
        - newsletter
        - git plugin for git-flow

3. Final remarks
    - during this meeting we created a few issues, whoever has some time can work on them
    - we should also finish the work on the documentation and announce it to users
    - next meeting sheduled on 08.11.2018 14:00
