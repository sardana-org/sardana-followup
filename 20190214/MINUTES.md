# Minutes

Minutes from the meeting held on 2019/02/14.

Participants:

- ALBA: Zbigniew Reszela
- DESY: Teresa Núñez
- MAXIV: Antonio Milán
- SOLARIS: Grzegorz Kowalski

## Actions

- [ ] MAX IV to share their developments/prototype with Jupyter Notebooks and Sardana.
- [ ] To evaluate the possibility of having a Sardana event inside the next Tango Meeting at DESY (3, 4, 5 of June)
- [ ] To evaluate the possibility of using Beacon as a configuration tool or a combination of the actual configuration tools.
- [ ] MAX IV to make a presentation of the actual state of DSConfig

## 1. Feedback from the Sardana presentation in the "Automation in Beamline Control and Data Acquisition Workshop" (January 2019)
   * See [slides](https://github.com/sardana-org/sardana-followup/blob/master/20190214/AlbaPresentation.pdf)

## 2. Presentations:
   
   * Beacon Server (Bliss project)
     * See [slides](https://github.com/sardana-org/sardana-followup/blob/master/20190214/AlbaPresentation.pdf)
     * Zibi able to run a Sardana instance configured with Beacon, thanks to Matias!
     * Different solutions available coming from  Alba (outdated), Desy (specific), MaxIV (DS Config)
   
   * Independent/direct acquisition of timerable channels
     * Timerables: countertimers 1D and 2D ready
     * Timer and the counters in the same controller
     * Asign a timer to the same channel
     * Pool timerable class implemented
     * Special values for the timer available.
     * Timer is a memorized attribure. If it's not set, the value is Default.
     * Controller can announce that for him the default timer is a channel.
     * For acquisitions without measurement groups!!!

## 3. Urgent user problems/issues - Round table

 * DESY: no issues
 * MAXIV: working on issues #1005, and missing events issue #1023
   * ALBA feedback on missing events issues: sometimes the physical motor is going back to Moving and causing the problem.
   * Workaround: needs to be solved in the controller because sardana is not protected to this.
     Use a flag in the controller for fixing this.
 * SOLARIS: no issues 
 * ALBA:
     * Continuous Scan issue: be able to correct or disable the correction of the overshoot after a scan.
     * Users would like to see the acquired data against the calculated position.
     * Bug in a BL with Tango8 in MotorGroups. The value written is different from the value recieved (basically 0).
     * Memory leak in spock that requires further investigation.
     * Features proposed:
       * Expconf behaviour with warning pop-ups (remote expconf changes) could be improved e.g. warnings only when the widget is in edition mode
     * Decouple the online scan plot from the expconf
        
## 4. Overview of current developments

   * Jan19 Release:
       * Board created for planning the release. It could start on Monday.
   * Update on SEP2
       * See [slides]((https://github.com/sardana-org/sardana-followup/blob/master/20190214/AlbaPresentation.pdf))
       * One frame per one value reference, is it enough?
       * TODO:
           * Python3 value references as strings or bytes?
           * VDS in H5
           * Configuration

## 5. Sardana Newsletter (for users) 
    
 * Make a new section in the sphinx documentation. What's new?
 * Add it to the next release (Jun19)

## 6. Any other business? (AOB)
   * Sardana compatible with Python 3 
     * Finish SEP2 and start a new SEP for this.
   * Sardana Documentation Camp 2019?
     * ~3 days is a minimum time (based on the experience from the last camp)
     * We could stay after Tango Meeting at DESY.

## 7. Next meeting on March 21th 14:00. Organized by Grzegorz.

