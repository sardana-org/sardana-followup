# Sardana Documentation Camp Ideas

In this document we put the ideas for the Sardana Documentation Camp. Later 
on we will discuss them on the follow-up meeting in order to prepare the format 
and agenda of the camp.

* We could invide (e.g. video call) some users so they comment on how they see
the current documentation.

* Video demos
    * If there is some time during the camp we could record some videos 
    (screen capture) with the demos.
    * We have already some videos, maybe we could create a YouTube 
    channel and upload them there.
    
* Merge DESY documentation in the official one
    * We could extract the generic information from this docs and move them 
    to the official docs.

* Many features will require documenting Taurus cause Sardana heavily 
depends on Taurus.

* Move from ReadTheDocs to GitHub Pages
    * This would allow us to get rid of the mocks.
    * Taurus is already in GithHub Pages, we could reuse its configuration.

* Spock macro's help e.g. `ascan?` show the path to the file where the magic
command is defined e.g. `~/workspace/sardana/src/sardana/spock/spockms.py`.
Maybe we could show the path to the macro module.
    
* Features missing in the Sardana documentation
    * MacroServer environment variables (only scan related variables are 
    documented)
    * _Spock syntax_ and _Advanced Spock Syntax_ (could be inspired on
    [sardana-org/sardana#781](https://github.com/sardana-org/sardana/pull/781) and
    [sardana-org/sardana#405](https://github.com/sardana-org/sardana/pull/405))
    * Spock magic commands
    * Continuous Scans
    * Macro Logging
    * General Hooks
    * Configuration Tools
    * Diffractometer

* Documentation that requires updates/modifications:
    * [Spock](http://www.sardana-controls.org/en/latest/users/spock.html) user
    documentation contains too much information e.g. "Moving motors", "Counting"
    This could be moved to a dedicated chapter e.g. "Sardana demo" or
    "Sardana in 5 min" comprising execution of `sar_demo` and usage of dummy elements.
    * [Scan Hooks documentation](http://www.sardana-controls.org/en/latest/devel/howto_macros/scan_framework.html#hooks-support-in-scans) is not clear. Especially the difference between the Hooks API
    and the hooks being attached in the GSF generators.

* Documentation of the macros in the macro catalogue is duplicated. We need 
to find a way on how to reuse the macro classes/functions docstrings. 
