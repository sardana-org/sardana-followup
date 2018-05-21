# Motion

* Even if the user asked for the scan of the pseudo motor the scan is
  executed on the physical motors always - all of them move on the linear
  trajectory.
* For each physical motor there are 4 positions in the scan: pre-start,
  start, post-end and end.
* Position software limits are verified before the scan against the pre-start
  and post-end positions.
* Motors attributes (acceleration, deceleration and velocity) are backup
  before any modification.
* All motors goes to the pre-start position with the maximum velocity (if
  defined).
* All motors are started at the same time.
* All motors have the same acceleration and deceleration time during the
  scan - the one of the slowest accelerating/decelerating motor.
* Acceleration attribute is expecting to return acceleration time in seconds.
* Scan velocity is calculated for each of the motors taking into account the
  integration and latency times and the motor's displacement
* Motion controller may not be able to move at this velocity and can silently
  adjust its value to the closest possible velocity (stepper motors have
  discrete motor resolution and discrete frequency) causing desynchronization
  of the scan.
* Motor position updates are used as the base for the software
  synchronization (see `MotionLoop_StatesPerPosition` and
  `MotionLoop_SleepTime`) - big amount of motor groups and pseudo motors may
  affect the position updates freqeuncy as well.
* Motor which does not reach the final position will cause the software
  synchronizer wait infinitelly - watchdog mechanism (15 seconds timeout)
  prevents that.
* All motors goes corrects the overshoot (go to the end position) with
  the maximum velocity (if defined)
* Backup motor attributes are restarted after the scan.

TODOs:
* Motion calculations done on the pool side, or maybe directly coordinated
  motion of pseudo motors/motor groups?

Slides:
1. Motor theoretical trajectory.

Example:
* mot01 maximum velocity limit set to 100 (jive)
* taurustrend mot01/position
* asacanct mot01 0 10 10 0.1
* asacanct mot01 0 10 10 1


# Acquisition

* Acquisition is managed by the measurement group and acquisition actions
  (threads).
* Measurement group contains configuration attribute - list of
  channels/controllers and their synchronization configuration:
    * synchronizer - either a TriggerGate element or software synchronizer
    * synchronization - Trigger/Gate
* No distinction is made for different trigger types: pre-trigger,
  mid-trigger and post-trigger
* Synchronizer and synchronization are loaded on the controller level and
  not on the channel level.
* Based on the configuration channels are assigned to particular acquisition
  actions: software, hardware, 0D.
* Configuration is loaded to the controllers:
    * synchronization type: SoftwareTrigger, HardwareTrigger, SoftwareGate,
      HardwareGate
    * Hardware synchronized channels are loaded only once with the number of
      acquisitions
    * Software synchronized channels are loaded multiple times for single
      acquisition
* Hardware synchronized controller must return proper latency time -
  otherwise the hardware may not have enough time to re-arm for the next
  acquisition.
* Software synchronized acquisitions may be skipped when:
    * previous acquisition is still in progress
    * the position/time has passed
* Latency time may be forced by the user in order to avoid lossing software
  synchronized acquisitions.
* The maximum latency time (between all the controllers and the one
  specified by the user) will be used during the scan.
* Hardware synchronized channels may return multiple values.
* Software synchronized channels returns only one value.
* Indexes are assigned to the returned values so they can be merged into
  records.
* Pseudo counters calculations are based on indexes as well - all values are
  necessary to perform calculations.

TODOs:
* Optimize software acquisition - not necessary to load on every point.
* Exceptions during the acqusition are just reported with the measurement
  group's fault state - lack of feedback what actually went wrong.
* Timestamp is missing in the data.
* Extra attributes (Tango attributes) are not directly supported yet - one
  needs to create a controller instance to point to them.
* Software gate is not yet implemented.

Slides:
1. Latency time selection

Example:
* defmeas cs-test ct01 ct02
* taurustrend -r 100 mot01/position "eval:bool({ct01/state})" "eval:bool({ct02/state})"
* ascanct mot01 0 10 10 1  # skipped acquisitions
* ascanct mot01 0 10 10 1 0.1 # all acquisitions
* expconf - change synchronizer to dummy trigger/gate (hardware)
* ascanct mot01 0 10 10 1 0.1  # all acquisitions


# Synchronization

* Hardware synchronization is done by an external device, could be a motor 
  controller or a timing card e.g. IcePAP, PiLC, Zebra, etc. integrated via 
  TriggerGate controllers and usually requires hardware cabling between this 
  device and the experimental channel controller.
* Software synchronization is done by an internal software synchronizer 
  object (thread) - one per measurement group.
  * Emits Active and Passive events. On this events acquisition callbacks
    are executed.
  * Callback execution time considered when generating events in order to 
    avoid drift.
  * Events may be skipped if the position/time has already passed and the 
    next one is more up-to-date.
  * Select the initial configuration in the position domain and active
    configuration in the time domain. The initial configuration can be forced
    to use time domain using the measurement group's
    `SoftwareSynchronizerInitialDomain` attribute.
  * Measurement group's `Moveable` attribute is used to set the master motor
    which position will be used as the synchronization base.
* A unique synchronization description, prepared by the scan framework is 
  loaded to both the hardware synchronizers and the software synchronizer.
* This description contains information in both position domain and time 
  domain (timescan contains only time domain). Slide 1.
* TriggerGate controller should select the initial configuration in the 
  position domain and active configuration in the time domain - acquisitions 
  should happen at given position and last a given time period. Slide 1.
* Synchronizers are always configured to generate Gate, even if the channels
  are configured to receive Trigger.
* Synchronizers' states are monitored during the measurement group's
  acquisition and they participate in the overall state calculation.
  
TODOs:
* Moveable reference should be passed to the TriggerGate controller - 
  necessary to implement trigger multiplexing in IcePAP. 


Slides:
1. Synchronization description.
   

# Data
* Are passed via `Data` (to be renamed to `ValueBuffer`) attribute Tango 
  events - JSON serialized pairs of values and indexes.
* Event callbacks are executed by a single worker thread in the MacroServer 
  to avoid blocking the Tango event consumer thread.
* Data from different experimental channels may arrive in an arbitrary order
  but from the same experimental channel always come ordered (but may not 
  be consecutive - missed acquisitions).
* Missing data may be extrapolated and interpolated (zero-order 
  interpolation) - `ApplyExtrapolation` and `ApplyInterpolation` environment
  variables.

TODOs:
* Pass timestamps with the data.

Example:
* ascanct mot01 0 10 10 1  #  skipped acquisitions
* senv ApplyInterpolation True
* ascanct mot01 0 10 10 1  #  interpolated values


# Framework

* `ascanc` macros provides desynchronized, in the sense of number of 
acquisition, scans.
* `aNscanct`, `dNscanct`, `meshct` and `timescan` use the synchronized
approach.
* Several hook places are available for custom custom configuration:
  * `pre-scan`
  * `pre-configuration`
  * `post-configuration`
  * `pre-start`
  * `pre-cleaunp`
  * `post-cleanup`
  * `post-scan`

TODOs:
* Provide an easy way of developing custom scans - waypoint generator with 
a custom synchronization description.
* Merge both `-c` and `-ct` like scans in one
