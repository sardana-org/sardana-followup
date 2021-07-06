---
title: Sardana Bug Squashing Party (SBSP) 2021
tags: Talk
description: View the slide with "Slide Mode".
---

# Sardana Bug Squashing Party (SBSP) 2021

<!-- Put the link to this slide here so people can follow -->
slide: https://hackmd.io/@reszelaz/BJ-Kstg6d

---

## Objectives

- Meet again or get to know new faces, unfortunatelly still virtually :(
- Share knowledge by participating in pair-programming sessions, peer reviews, etc. 
- Improve the Sardana project
- Reduce very long backlog of issues: ~350

---

## [Agenda](https://github.com/sardana-org/sardana-followup/blob/master/20210707-SBSP/AGENDA.md#agenda)

---

## [Presentation of participants](https://docs.google.com/document/d/1RidcYHxnDy5xiuEl8dGcvoxELusieRf64YsFF5l2jSU/edit)

---

## SBSP 2021 pre-work

- [User's questionnaire](https://hackmd.io/@reszelaz/Bk53UScj_) - 40 answers
- Classification of issues using labels e.g. storage, scan, motion, daq, etc.
- Estimation of issues: size (S, M, L, XL) and impact (low, medium, high)
- Pre-selection of issues:
    - size:S & impact:high
    - size:S & impact:medium
    - good first issue

---

## SBSP 2021 organization

----

### [Zoom meeting](https://rediris.zoom.us/j/84897642777?pwd=NVl0ZHZhcmlrKy9QSjE2QUxiSDlNZz09)

- Meeting ID: 848 9764 2777 & Passcode: 098611
- Breakout rooms (for pair-programming & coffee-breaks)
- You all are co-host (in order to have a pre-view of breakout rooms)
- Chat for: asking for review, calling for help, etc.

----

### [GitHub project](https://github.com/orgs/sardana-org/projects/2)

- Already used during the [Sardana Documentation Camps](https://github.com/sardana-org/sardana/projects/1)
- You were all invited (but Nils and Yimeng - missing GitHub accounts) to:
    - become Sardana Organization (sardana-org) members
    - have Triage access permission to the sardana repository

----

### [GitHub project](https://github.com/orgs/sardana-org/projects/2)

- Kanban board with the following phases:
    - *In design* -> *In design review* -> *In dev* -> *In review*
- ... and the following buffer columns
    - *To do*, *Ready for design review*, *Ready for dev* and *Ready for review*
- Let's use pull model:
    - take the first free card starting from the right-most column

----

### Development environment

1. [Use conda environment](https://sardana-controls.org/users/getting_started/installing.html#working-from-git-source-directly-in-develop-mode) and Tando DB run on your host 
2. Use Sardana clone from within the [Visual Studio Code](https://code.visualstudio.com/) IDE
3. Use [sardana-test](https://hub.docker.com/r/reszelaz/sardana-test/) *all-in-one* Docker container (still based on Debian Stretch)

----

### Pair programming

[Some options](https://github.com/sardana-org/sardana-followup/issues/26), e.g:
1. PyCharm's Code With Me extension
2. VSC LiveShare extension
3. [tmate](https://) - instant terminal sharing

---

## Summary

- Real objective: learn from each other & have fun!
- Let's feel in this Zoom Meeting like we were in a room with multiple tables and we work together
- Let's keep the project board updated to facilitate collaboration
- It would we nice if after this event you could feel confident and familiar with Sardana to report issues or even provide PR:)

---

## Thanks!
