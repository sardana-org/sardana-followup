# Sardana follow-up meetings

The objectives of the Sardana follow-up meetings are to:
* share knowledge and experience
* promote collaborative development
* review user's feedback
* classify and prioritize issues and pull requests

Sardana Community organizes the follow-up meetings in the form of video conferences on demand. If there is no big demand we will try to meet at least once per month. The agenda of each meeting will be discussed beforehand and minutes will be provided afterwards. 

# Meeting workflow

1. Meetings are proposed by submitting [pull requests](https://help.github.com/articles/about-pull-requests/) to the master branch of this repository. The pull request description should contain the date and the hour of the meeting. This pull request should add one directory to this repository named YYYYMMDD that represents the date of the meeting e.g. 20171102. Inside of this directory should be at least one file named AGENDA.md that contains the meeting agenda.
2. The meeting agenda is discussed and modified between the interested parties by commenting on the AGENDA.md file or committing directly to it until a consensus is reached.
3. Extra materials used during the meeting e.g. slides, code snippets could be added to this directory as well.
When the agenda is considered ready, the meeting is announced to the rest of the community via the devel mailing list: sardana-devel@lists.sourceforge.net and the pull request gets merged into the master branch.
4. After the meeting, another pull request is opened to the master branch of this repository with the minutes of this meeting. This pull requests should contain one file named MINUTES.md that will go into the directory of the meeting. Meeting participants could comment on it. Finally this pull request gets merged and the meeting is considered as closed.

# Ideas for the meeting agenda:

If there was no explicit reason for the meeting its agenda could comprise the following  points:
* Present one feature of Sardana and share the experience about it e.g. diffractometers control, continuous scans, repeat macro parameters, etc.
* Report user’s experience since the last meeting
* Classify and prioritize issues
* Propose new development, enhancement or bug fix, for collaborative development
* Any other topic...
