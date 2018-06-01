# Recent bug fixes in Taurus that may affect existing codes: 

 - [#511](https://github.com/taurus-org/taurus/issues/511), [#512](https://github.com/taurus-org/taurus/issues/512)
 - [#678](https://github.com/taurus-org/taurus/issues/678) 
 - [#738](https://github.com/taurus-org/taurus/issues/738)

## Issues #511, #512
Taurus uses a Factory (singleton class) for each scheme to prevent create
multiple instances of the same attribute.
Due to these bugs the reference attribute keeps alive till the application dies.

Consequences:
- Factory keeps referenced attributes and devices (memory increase) 
- Unexpected events (CHANGE + CONFIGURATION)


After fixing #511 (TangoFactory not clearing unreferenced attributes) and #512
(TangoAttribute not removing its listeners), the attributes that
are not longer referenced disappear from the factory and the listeners are no
longer notified. 

This is the *expected* behaviour, but it can break code that relied on the buggy 
behaviour, as in the following example:

```
# Add internal reference to keep subscribed attrs alive
# From Sardana 778a7d0a3c1a
# sardana.taurus.core.tango.sardana

class MeasurementGroup(PoolElement):

    def __init__(self, name, **kw):
        (...)
        input_attr = self.getAttribute("Input")
        input_attr.addListener(self.inputReceived)
        (...)

```


## Serialization mode (#678)

A typo in TaurusModel's code makes TaurusDevices always being
initialized with serialization mode 'Serial', ignoring the mode set
in the Manager (by default, 'Concurrent').

When fixing the typo, we decided to avoid breaking existing code, so we changed
the *default* serialization mode for the Tango scheme to *serial*.

Note that one can always set the serialization mode for individual models.

## (WIP) Use a pool of threads to handle event callbacks (#738)

### Idea

Use the TaurusManager PoolThread to manage the fireEvents
respecting the "serialization mode" of the scheme.

The idea is to delegate the control of the event queue to Taurus instead of 
keeping it in the Tango thread. Also,  implement different modes for handling 
the events (Sync vs Async and Serial (Tango or Taurus) vs Concurrent (Taurus))

### Consequences

- Taurus can be in charge of managing the event queue (releasing the PyTango
serialization)
- Create more powerful event filters in Taurus
- Problems if your code mix both event queue (you could have not serialization)

