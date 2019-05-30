# expconf external changes pop-up

## What is expconf?

Experiment Configuration widget a.k.a. expconf is a complete interface
to define the experiment configuration. It consists of three main
groups of parameters organized in tabs:

* Measurement group
* Snapshot group
* Storage

More in the official [doc](https://sardana-controls.org/users/taurus/experimentconfiguration.html?highlight=expconf)

## Motivation
expconf is not automatically updating when configuration changes out of the widget. The element and the configuration of the experiment configuration can be modified from `spock`, macros, or external GUIs.  

Implemented by **rhomspuron** (Jul18) [#882](https://github.com/sardana-org/sardana/pull/882), [#1028](https://github.com/sardana-org/sardana/pull/1028), [#1094](https://github.com/sardana-org/sardana/pull/1094), and [#1099](https://github.com/sardana-org/sardana/pull/1099)


![expconf](https://user-images.githubusercontent.com/6735649/52115672-7de47580-260f-11e9-9a62-baab546e5dec.png)

## expconf demo

```
$> taurusgui macrogui
```

In spock, type:

```
Door> expconf
Door> senv ActiveMntGrp meas3

```

```python
import time
from sardana.macroserver.macro import *

@macro([["mntgrp", Type.MeasurementGroup, None, "A meas"]])
def changeMeas(self, mntgrp):
    bkp_active_mntgrp = None
    try:
        bkp_active_mntgrp = self.getEnv('ActiveMntGrp')
        mntgrp_name = mntgrp.name
        self.setEnv('ActiveMntGrp', mntgrp_name)
        # TODO
        time.sleep(1)
    finally:
        if bkp_active_mntgrp is not None:
            self.setEnv('ActiveMntGrp', bkp_active_mntgrp)
```

## Future works:

* ExpConf reports pop-ups after stopping the Pool [#958](https://github.com/sardana-org/sardana/issues/958)
* ExpConf reports unnecessary measurement groups changes popup [#1025](https://github.com/sardana-org/sardana/issues/1025)
* **Show "configration change on the server" pop-up only when expconf in edit mode [#1046](https://github.com/sardana-org/sardana/issues/1046)**
* Meas is not removed if applying local configuration from expconf [#1092](https://github.com/sardana-org/sardana/issues/1092)
* **Feature: propagate context (env. var.) e.g. `senv madscan.ActiveMntGrp mg_madscan` as an alternative to the above macro `changeMeas`.**
