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
      * How to integrate your hardware with countinuous scans
      * How to develop your own continuous scans
    * Macro Logging
    * General Hooks
    * Configuration
      * PoolPath, MacroPath and PythonPath and other properties
      * sardanacustomsettings module
    * Configuration Tools
      * Guide on how to configure new controllers/elements/measurement groups etc.
    * Diffractometer
    * Sardana-Taurus Widgets
      * MacroButton
      * Showscan
    * Taurus extensions e.g. Motor interface, MeasurementGroup interface, etc.
    * How to import spock syntax files in sequencer.
    * Add more details to report feature, how configure it, where is it writen?
    * Sardana internals for core developers are not documented:
      * photos with UML diagrams
      * no documentation about how a controller plugin become a tango device
      * Present the sequence of API calls to controllers during macros (mv, ct, step scan, continuous scan...)
    * What can be done and what not in with the measurement group?
    * A more clear description of a trigger/gate controller
    * Clarify the measurement simultaneous usage.
    * Review Controller overview chapter page (for instance, Trigger/gate controller is missing).
    * Decide what belongs to public API and autogenerate docs for all these classes
    * Always have simple (minimal) and advanced examples and clearly separate them
    

* Documentation that requires updates/modifications:
    * [Spock](http://www.sardana-controls.org/en/latest/users/spock.html) user
    documentation contains too much information e.g. "Moving motors", "Counting"
    This could be moved to a dedicated chapter e.g. "Sardana demo" or
    "Sardana in 5 min" comprising execution of `sar_demo` and usage of dummy elements.
    * [Scan Hooks documentation](http://www.sardana-controls.org/en/latest/devel/howto_macros/scan_framework.html#hooks-support-in-scans) is not clear. Especially the difference between the Hooks API
    and the hooks being attached in the GSF generators.
    * [Writing Controllers](http://www.sardana-controls.org/en/latest/devel/howto_controllers/index.html)  is not complete. Not clearly listed the minimum methods that have to be definded in a controller in order to be working in Sardana. Not described the differences in performance between controller types, for example between Counter/Timer and OD controllers.
    * Writing CT controller: `StartAll` seems to be necessary to be implemented and it is not documented.

* Technical question:
   * Documentation of the macros in the macro catalogue is duplicated. We need 
to find a way on how to reuse the macro classes/functions docstrings. 
   * How to show multiple next steps at the end of the chapter
   * Is it possible to add tags/labels in the distributed chapters so it would be easy to autogenerate a table of contents of them
