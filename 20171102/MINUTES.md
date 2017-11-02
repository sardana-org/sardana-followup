# Sardana follow-up meeting
Held on 02.11.2017 at 14:00

Participants: SOLARIS - Grzegorz Kowalski, MAXIV - Antonio Milan,
              DESY - Teresa Nunez and ALBA - Zbigniew Reszela

# Minutes

1. Introduce "General Hooks" and share experience about it.

* General Hooks were presented - see slides in GeneralHooks.pdf
* MAXIV experience about hooks
  * General Hooks are currently being tested using the DESY implementation at
    the NanoMax beamline
* SOLARIS experience about hooks
  * No use of hooks up to now
  * Users could be eventually interested in using General Hooks for pausing and
    resuming macro execution when there is no beam at the beamline
* DESY experience about hooks
  * Hooks are being used in a programatic way
  * General Hooks are also widely used:
    * Configuring detecors saving parameters
    * Inserting and extracting attenuators
    * General Conditions for repeating a scan point
    * Pausing and resuming acquisition if there is no beam
    * Opening and closing shutter
* ALBA experience about hooks
  * Hooks are mostly used in a programatic way (sporadically used with sequencer)
  * Hooks are mostly used in continuous scans for adding special configuration
    of the hardware e.g. special PID parameters of the motors.
2. Report user's experience - round table.

* MAXIV
  * There are still at early stage so not too much feedback so far
  * The Sardana and Taurus upgrade is in progress
  * On the table are Genaral Hooks (nanoMax) & Continuous Scans (Balder)
    non-equidistan scan points

* Desy
  * Satisfied with the flexibility of the system
  * No special interest in generic continuous scans cause they already have
    working solutions with ad-hoc macros
  * Using of General Hooks and Spock Logging that are not yet integrated in the
    official Sardana makes upgrades painful due to merge conflicts
  * PiLC TriggerGate controller is ready for tests at other institutes

* Solaris
  * Big problems delays and crashing of Sardana 
  * Time of acquisitions and time of motions is much lower than the total
    time between scan points
  * Polling on motors makes wrong positions in scans? - #559 (polling is used 
    for archiving with HDB++)


3. Propose new development, enhancement or bug fix, for collaborative
   development

* ALBA prposal: Provide reliable position column in continuous scans
 ([#608](https://github.com/sardana-org/sardana/issues/608)) - will be worked by
  ALBA and MAXIV
* DESY proposal: General Hooks - will be worked by ALBA and DESY
* MAXIV: General solution for Taurus4 and Sardana incompatibilities (Sardana
  elements' full names - URIs, FQDN,
  [#609](https://github.com/sardana-org/sardana/issues/609) will be workded
  by MAXIV + SOLARIS
* SOLARIS: Software limits with motor groups and pseudo motors
  [#560](https://github.com/sardana-org/sardana/issues/560)
  and [#36](https://github.com/sardana-org/sardana/issues/36) - will be worked
  by SOLARIS and DESY

4. Try to share the pending PR between the integrators

* There was no time to address this point of the agenda
* We agreed that Z.Reszela will select PR that are relativelly easy to
  integrate and others will choose from these as a starting point:
  * Reimplement macrobutton handleEvent -
    [#559](https://github.com/sardana-org/sardana/issues/559)
  * Fix Door method read_ElementList -
    [#557](https://github.com/sardana-org/sardana/issues/557)
  * Change text of macro button to indicate abort action (Issue322) -
    [#554](https://github.com/sardana-org/sardana/issues/554)
  * Report error number when loading sequence from txt -
    [#552](https://github.com/sardana-org/sardana/issues/552)
  * Report error if macro parameter definition is wrong -
    [#577](https://github.com/sardana-org/sardana/issues/577)

