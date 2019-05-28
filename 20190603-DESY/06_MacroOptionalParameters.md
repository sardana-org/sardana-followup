
# Macro optional parameters

Sardana enhancement (Feb16) [#245](https://github.com/sardana-org/sardana/issues/285)
Note: I think that the implementation is #876 so it is one of the last milestones.

Goal:
Add some new features related to the macro parameters in order to get
more flexibility in providing the parameter values.

Requirements:

* define parameters as optional and give the possibility of taking any
 action in case they are not provided, for example, print any message
 defined by the user
* define parameters as optional and interactive, so that if they are
not provided they will be interactively asked.
* define parameters as optional and with a _default value_ that will be
variable (for example readout from some tango attribute).


Implemented by **rhomspuron** (Sep18)

## What is a Sardana Macro?

A macro in sardana describes a specific procedure that can be executed
at any time. Macros run inside the sardana sandbox. This simply
means that each time you run a macro, the system makes sure the
necessary environment for it to run safely is ready.

More in the official [doc](https://sardana-controls.org/devel/howto_macros/macros_general.html#what-is-a-macro)


## Macro parameters definition:

Depending if you write a macro as a function or a class it is defined
in a decorator or in a class attribute.

This is the structure:
 [< AttrName >, < AttrType >, < DefaultValue >, < Description >]

In the definition of a parameter you can set as default value:

### < DefaultValue >

For Sardana the value of the < DefaultValue > has different meanings:

* None
* A value
* [Optional](https://sardana-controls.org/devel/howto_macros/macros_general.html#optional-parameters)


```
from sardana.macroserver.macro import *

class macro1(Macro):
    param_def = [
    ['boolvalue', Type.Boolean, None, 'a bool value'],
    ['defaultboolvalue', Type.Boolean, True, 'a bool value (default)'],
    ['opboolvalue', Type.Boolean, Optional, 'an optional bool value'],
    ]

    def run(self, boolvalue, defaultboolvalue, opboolvalue):
        self.output('values: {}, {}, {}'.format(boolvalue,
                                                defaultboolvalue,
                                                opboolvalue))
```

Note: we could add examples of:
* print a custom message and abort
* interactive macro, ask for value
* get a value e.g. read some attribute
