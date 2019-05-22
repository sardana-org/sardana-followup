# Taurus Best practices

The following is a set of recipes of current (for Taurus v4.5)
"best practices".

It is part of the document prepared for an internal training at ALBA
in 2019-04-03: https://github.com/taurus-org/taurus/wiki/Best-Practices-for-Taurus-4

-----
## Scheme-agnosticism (avoid tango-centric code)

Keep in mind: *Taurus is not just Tango*:

- `taurus.core` is completely scheme-agnostic.

- `taurus.qtgui` can be used without Tango, and the main widgets (`TaurusForm`, `TaurusPlot`, `TaurusLabel`,...) are scheme agnostic, but some widgets or some features may still be available only for Tango.

### Reasons not to write tango-centric code

Even if you are writing a widget/application that will just interact with a Tango system, you should try hard to write scheme-agnostic code *because*:
- You may want to eventually use an [eval attribute](http://taurus-scada.org/devel/api/taurus/core/evaluation.html#module-taurus.core.evaluation) to do tests or to make dynamic operations on tango attributes
- You may want to retrieve values from [tango-archiving](https://github.com/taurus-org/tangoarchiving-scheme)
- You may want to compare against a value [from a hdf5 dataset](https://github.com/taurus-org/h5file-scheme)


### Some common wrong assumptions about model names

1. *an attribute name contains the device name*
    - FALSE: e.g., in eval, the device name is likely to be implicit, and in EPICS, there may even not be a unique attr->device association
2. *if not explicit, the scheme name is ``"tango"``*
    - FALSE: it is controlled in `tauruscustomsettings.DEFAULT_SCHEME` (which defaults to ``"tango"``)
3. *the separator between a scheme name and the rest is `://`*
    - FALSE: the separator is *the first occurrence of `:`*. The  `//` is actually part of the *authority* name (e.g. `tango:a/b/c`, not `tango://a/b/c`)
4. *the name of an attribute (or device, or...) does not contain `?`*
    - FALSE: some schemes may use queries for their models (e.g. [taurus_tangoarchiving](https://github.com/taurus-org/tangoarchiving-scheme)'s attribute name`tgarch:a/b/c/d?db=tdb?t0=-5d`)
5. *The fragment is part of an attribute name*
    - FALSE: strictly speaking, the fragment (whatever comes after an unescaped `#` in an URI)
     [is **not** part of the URI itself](https://tools.ietf.org/html/rfc3986):
     in `tango:a/b/c/d#wvalue`, the attribute name is just `tango:a/b/c/d`,
     and `#wvalue` is a "hint" that may (or not) be honored by the client side.
     For example, **the taurus core does not store the fragment** (it just keeps model singletons),
     but the widgets do store (and may act on) the fragment name.
6. *Model names are case-insensitive*
    - FALSE: It depends on the scheme (e.g., eval or epics are case-sensitive). It can be checked with `taurus.Factory(scheme).caseSensitive`

### Agnostic helpers

`taurus.core` provides an API to help you writing scheme-agnostic code:

- `taurus.Authority()`
- `taurus.Device()`
- `taurus.Attribute()`
- `taurus.Object()`
- `taurus.Factory()`
- `taurus.Manager()`
- `taurus.isValidName()`
- `taurus.getValidTypesForName()`
- `taurus.getSchemeFromName()`
- `taurus.getValidatorFromName()`

Learn this API by reading the docs on [Model Access](http://taurus-scada.org/devel/core_tutorial.html#model-access)


### Name validators

Taurus4 introduced model name validators:
- They are provided by each scheme for each element type (e.g. `TangoAttributeNameValidator`, `EvaluationDeviceNameValidator`, ...)
- They can be obtained from the scheme Factory (e.g. `Factory('eval').getAttributeNameValidator`)
- They provide:
    -  `.isValid(name)` to **validate** model names
    - `.getUriGroups(name)` to **parse** the URI and retrieve parts of it
    -  `.getNames(name)` to **compute the full, normal and simple names** from a given name.

Some examples:

- Validate an Evaluation attribute:

    ```python
    v = taurus.Factory('eval').getAttributeNameValidator()
    v.isValid('eval:rand(5)')  # --> True
    ```


- Obtain the authority associated to a tango attribute name (without creating the atribute):

    ```python
    v = taurus.Factory('tango').getAttributeNameValidator()
    name = 'tango://tghost:10000/a/b/c/d'
    urigroups = v.getUriGroups(name)  # if name is not a valid tango attr, we get None
    print(urigroups) # -->
    # {'__STRICT__': True,
    #  '_devalias': None,
    #  '_devslashname': 'a/b/c',
    #  '_shortattrname': 'd',
    #  'attrname': '/a/b/c/d',
    #  'authority': '//tghost.mydomain.org:10000',
    #  'cfgkey': None,
    #  'devname': 'a/b/c',
    #  'fragment': None,
    #  'host': 'tghost.mydomain.org',
    #  'path': '/a/b/c/d',
    #  'port': '10000',
    #  'query': None,
    #  'scheme': 'tango'}
    auth = urigroups['authority'] # if authority is not explicit in `name`, we get None
    ```

- Get the full name of a device (without creating it)
    ```python
    scheme = taurus.getSchemeFromName(name)
    v = taurus.Factory(scheme).getDeviceNameValidator()
    full_name, _, _ = v.getNames(name)

    # # and now, we can, e.g., find the authority from it
    # **even if it was not explicit in `name`**
    auth = v.getUriGroups(full_name)['authority']
    ```

### Some common BAD practices...
#### DON'T... count slashes

e.g., to find if a given model name corresponds to a device or an attribute, an old code could do:

```python
n_slashes = name.split('://')[-1].count('/')
if n_slashes == 0 or n_slashes == 2:  # 'alias' or 'a/b/c'
    model_type = 'device'
elif nslashes == 1 or n_slashes == 3: # 'alias/attr' or 'a/b/c/d'
    model_type = 'attribute'
```

... but that is tango-centric (e.g., it won't work with `eval:rand(5)`), so instead one could do:


```python:
try:
    taurus.Attribute(name)
    model_type = 'attribute'
except:
    taurus.Device(name)
    model_type = 'device'
```

... which is scheme-agnostic but has the problem that it attempts to create the model objects (expensive and may fail if they are not accessible)

Instead, one **should** do:

```python
from taurus.core import TaurusElementType
_t = taurus.getValidTypesForName(name)[0]
model_type = TaurusElementType[_t]
```


**TIP:**  Note that the `isValidName` helper may also be useful to determine if something is an attribute (or a device or an authority)

```python
from taurus.core import TaurusElementType as ET
from taurus.core.taurushelper import isValidName

isValidName('tango:foo')  # --> True
isValidName('tango:a/b/c', [ET.Attribute])  # --> False
isValidName('tango:a/b/c', [ET.Attribute, ET.Device])  # --> True
```

#### DON'T...** parse model names assuming tango rules

For example, if you are dealing with Tango attributes, instead of:

```python
dev_name = attr_name.rsplit('/', 1)[0]
```

Instead, do:
```python
v = taurus.Factory('tango').getAttributeNameValidator()
urigroups = v.getUriGroups(attr_name)
dev_name = urigroups["devname"]  # in tango, attr_name contains the dev name
```

#### DON'T compare names using lowercase or non-full names

The following code to compare if two names correspond to the same attribute assumes case-insensitivity and may also fail if the names are not both full names:

```python
if (name1.lower() == name2.lower()):
    (...)
```

So, instead you can do:
```python
def get_full_name(name):
    scheme = taurus.getSchemeFromName(name)
    v = taurus.Factory(scheme).getAttributeNameValidator()
    return v.getNames(name)[0]

if get_full_name(name1) == get_full_name(name2):
    (...)
```

... or, if you do not mind creating the model objects, you can make use of the fact that models are singletons:

```python
attr1 = taurus.Atribute(name1)
attr2 = taurus.Atribute(name2)
if attr1 is attr2:  # attrs are singletons!
    (...)
```

#### DON'T... use normal_name or simple_name as keys

A model has 3 names... but only the full name is unambiguous:
 - full. (e.g.`tango://host.domain:1234/a/b/c/d`) **This is the only that is guaranteed to be unambiguous**.
 - normal (e.g. `a/b/c/d`, or `//host:1234/a/b/c/d` if host is not your default Tango DB). This is the full name minus the optional parts if they coincide with the current system's default values. It is only unambiguous as long as it is used in the same system and its configuration is not changed.
 - simple (e.g. `d`). This is just something that can be useful in many situations as a short descriptor of the attribute.

**Therefore** if you want to store a dictionary where the keys are model names, it is highly likely that you should use **full** names as the keys.

#### DON'T... use normal_name as a way of removing the scheme or the authority parts of a name

Consider the following snippet:

```python
for name in ('tango://controls01:10000/sys/tg_test/1',
             'tango://controls02:10000/sys/tg_test/1'):
    print(taurus.Device(name).getNormalName())
```

Its output may be surprising:
```console
sys/tg_test/1
//controls02.cells.es:10000/sys/tg_test/1
```

... until you realize that:

```console
$> echo $TANGO_HOST
controls01:10000
```


## Working with units (the pint module)

See [the working with quantities section of the Taurus 3.x to 4.x migration guide](http://taurus-scada.org/devel/taurus3to4.html#working-with-quantities)

Taurus4 specifies that all numerical values (read values, write values) and associated properties (limits, warning levels, etc.) are [pint](https://pint.readthedocs.io) `Quantity` objects (instead of just `int` or `float`).

Taurus provides support via [`taurus.core.units`](http://taurus-scada.org/devel/api/taurus/core/units.html)

### Things to keep in mind about Quantities

- they have `.magnitude` and `.units`
- they are associated to a pint `UnitRegistry`. Taurus' unit registry and its associated Quantity factory can be imported with:
  ```python
  from taurus.core.units import UR, Q_  # Q_ is an alias for Quantity
  ```
- they can be created by using the `Quantity` factory (e.g. `Q_("3 mV")`) or by multiplying a number with a unit from the registry (e.g. `5 * UR.meters`)
- they can be converted to compatible units: `Q_("3 inches").to("mm")`
- they can be used directly without need of conversion: `Q_("1 nm") + Q_("4 angstroms")`
- unitless quantities are dimensionally-compatible with python scalars: `Q_(3) + 2`

### Quantities and Tango

- In Tango, the units are just free-content strings in the attribute configuration. They apply to both the read and write values, as well as the limits.
- In `taurus.core.tango` when reading a numerical attribute, the unit string is parsed and it is used to construct the quantities the rvalue, wvalue and the limits of the given attribute.
- If the unit is not recognized by pint, a warning is issued and the attribute is considered unitless.
- when writing to the attribute, the argument of `.write()` can be
    - a quantity: which will be transparently converted to the units in the Tango DB
    - a python scalar which assumed to already match the units of the attribute (just as in taurus3)



### DON'T... operate with magnitudes (use Quantities)

For example, the following taurus 3 code (in which we assume that `ampli` is in meters)...

```python
v = taurus.Attribute('sys/tg_test/1/ampli').read()
foo = 5 + v.value  # here "5" is implicitly assumed to mean "5 meters"
```

... would raise the following warning in taurus 4:

```
DeprecationWarning: _get_value is deprecated since 4.0. Use .rvalue instead
```

A quick but **not recommended** refactoring to avoid the deprecation warning could be:

```python
v = taurus.Attribute('sys/tg_test/1/ampli').read()
foo = 5 + v.rvalue.magnitude
```

That is exactly what the automated backwards compatibility layer already does for you. However, the recommended refactoring should use Quantities rather than magnitudes, e.g:

```python
from taurus.core.units import UR  # import the taurus unit registry
v = taurus.Attribute('sys/tg_test/1/ampli').read()
foo = 5 * UR.meters + v.rvalue  # use explicit units
```


## Taurus State vs Tango State

In taurus3 the device states were those of [`PyTango.DevState`](https://pytango.readthedocs.io/en/latest/client_api/other.html#tango.DevState), and were accessed with `device.getState()`.

In Taurus 4, a scheme-agnostic set of states (`Ready`, `NotReady` and `Undefined`) was introduced with [`TaurusDevState`](http://taurus-scada.org/devel/api/taurus/core/_TaurusDevState.html), and it is accessed via the `TaurusDevice.state` property.

**TIP:** you can still access the Tango State of a *Tango*Device  by reading the value of its state tango attribute: `TangoDevice.stateObj.read().rvalue`

**TIP:** some widgets (leds, labels, ...) that previously displayed Tango States were made scheme-agnostic and now use `TaurusDevState`... with the consequence that they offer less fine-grained info. If the richer set of Tango states are required (and the price of tango-centrism is assumed), **one can always use a Tango specialization** of those widgets.

### Adapting state-related APIs from taurus3 to taurus4

From the [API changes table](http://taurus-scada.org/devel/taurus3to4.html#api-changes):


| taurus 3 | taurus 4 |
| -------- | -------- |
| `TangoDevice.getState`|`TangoDevice.stateObj.read().rvalue` *tango* or `TaurusDevice.state` *agnostic*    |
| `TangoDevice.getStateObj` | `TangoDevice.stateObj`  *tango* or `.factory.getAttribute(state_full_name)` *agnostic*             |
| `TangoDevice.getSWState`   | `TangoDevice.state`       |
| `TangoDevice.getValueObj`  | `TangoDevice.state` *agnostic or* `stateObj.read` *tango*         |
| `TangoDevice.getDisplayValue` | `TangoDevice.state().name` |
| `TangoDevice.getHWObj`  | `TangoDevice.getDeviceProxy` |
| `TangoDevice.isValidDev`  |`(TangoDevice.getDeviceProxy() is not None)`|
| `TangoDevice.getDescription`   | `TangoDevice.description` |

### Mapping between Tango and Taurus DevStates
- ON, OFF, CLOSE, OPEN, INSERT, EXTRACT, MOVING, STANDBY, RUNNING, INIT ->**Taurus Ready**
- FAULT, DISABLE, INIT -> **Taurus NotReady**
- UNKNOWN -> **Taurus Undefined**

For the color mappings, see http://taurus-scada.org/users/ui/ui_colors.html


## Model fragments

From [RFC3986](https://tools.ietf.org/html/rfc3986#page-24):
>A fragment identifier component is indicated by the presence of a number sign ("#") character and terminated by the end of the URI.

and:

>Fragment identifiers have a special role in information retrieval systems as the primary form of client-side indirect referencing (...) **to specifically identify aspects of an existing resource** that are only indirectly provided by the resource owner (...) the fragment identifier **is not used in the scheme-specific processing of a URI**; instead, the fragment (...) **is dereferenced solely by the user agent**, regardless of the URI scheme.

... which for taurus model URIs is translated as (from TEP14):

- The model object is fully referenced by the model URI **without the fragment name**. i.e., the scheme Factory will ignore the fragment component of the URI when providing the model object.
- The fragment may **optionally** be used by the client (e.g. a widget) to identify "aspects" of the model (e.g. members of the model object, or slices of values,...)
- The model objects provide the [`getFragmentObj()`](http://taurus-scada.org/devel/api/taurus/core/_TaurusModel.html#taurus.core.TaurusModel.getFragmentObj) method to dereference a fragment name. In its current implementation, the fragment is computed from a the model itself by *evaluating* the expression "<model>.<fragmentName>"

See a [more detailed explanation from TEP14](https://github.com/taurus-org/taurus/blob/develop/doc/source/tep/TEP14.md#interpretation-of-fragments-in-model-names)

And also see the [support for slices added by TEP15](http://www.taurus-scada.org/tep?TEP15.md)

### examples of fragments usage

#### Some widgets use the fragments... but not all do:

The following code ...
```python
# suppose that the rvalue of tango:a/b/c/d  is ["a","b","c","d","e","f"]
name = 'tango:a/b/c/d#rvalue[:4:2]'
label = TaurusLabel()  # <- uses fragments
table = TaurusValuesTable()  # <- ignores fragments
label.setModel(name)
table.setModel(name)
```

would result in the label showing `['a','c']` and the table showing something like:


|   |
| - |
| a |
| b |
| c |
| d |
| e |
| f |

## Improved eval scheme

The eval scheme has progressed a lot since taurus 3.

- The syntax has changed: e.g., `evaluation://x+y?x=1;y=2` should be written in the current syntax as `eval:x=1;y=2;x+y` (the old syntax is supported by the backwards compatibility layer, but it is deprecated, less robust and much more limited than the new one)
- arbitrary nesting of attr references is now allowed.
- Usage of arbitrary members of objects in the evaluation expresion is now allowed
- arbitrary import of modules is allowed
- writable evaluation attributes are supported

See details and examples for all this in the [docs of the eval scheme](http://taurus-scada.org/devel/api/taurus/core/evaluation.html)


### examples of use cases

See [this tutorial](https://github.com/sardana-org/sardana-followup/blob/master/20180605-Prague/07-Taurus_Eval_Scheme/07-Taurus_Eval_Scheme.md)

#### To process an existing attribute

Add an offset to the tango `a/b/c/d` attribute:
`eval:{tango:a/b/c/d}+Q("10mm")`

Cast a boolean attr to an int to plot it in a trend:
`eval:int({sys/tg_test/1/boolean_scalar})`

#### To make a quick GUI wrapping some existing module:
A poor-man's clock:
```console
taurusform 'eval:@datetime.*/datetime.now().isoformat()'
```

## Formatter API

The formatter API was introduced to provide the developer and the user control over how a value is displayed by a given widget or set of widgets

A typical use case for this is to alter the number of decimal digits shown for a float, or to use exponential notation.

The user/developer can change the "formatter" used by a widget instance, by all instances of a class or even by all Taurus widgets in the current system.

The "formatter" is used by the [`.displayValue()`](http://taurus-scada.org/devel/api/taurus/qt/qtgui/base/_TaurusBaseComponent.html#taurus.qt.qtgui.base.TaurusBaseComponent.displayValue) method of `TaurusBaseComponent` for transforming the value into a string representation.

The "formatter" can be a [python format string](https://docs.python.org/2/library/string.html) or a callable that returns a python format string (for details, see )

### using Formatters

See some usage examples in [this tutorial](https://github.com/sardana-org/sardana-followup/blob/master/20180605-Prague/09_taurus_formatter.md)

### existing formatters

taurus currently provides the following ready-made formatters:

- [`defaultFormatter`](http://taurus-scada.org/devel/api/taurus/qt/qtgui/base.html#taurus.qt.qtgui.base.defaultFormatter):  a generic formatter (it supports all types of values). For numerical values, it uses the `.precision` of the model object to decide the number of decimal places to be used.
- [`tangoFormatter`](https://taurus-scada.org/devel/api/taurus/core/tango/util.html#taurus.core.tango.util.tangoFormatter). A specialiced formatter that uses the Tango "format" configuration (`Display.Format` configuration from the Tango DB). It can only be used with tango attributes. Useful to emulate the behaviour of some widgets in taurus3

### Changing the formatter:
You can change the formatter in the following ways (listed from less to more intrusive):

1. (GUI) set a custom formatter in TaurusForm (globally or per attribute) via a context menu option. TaurusForms will store this preference in their configs.
2. (GUI/PROG) use the [`TaurusBaseWidget.onSetFormatter()`](http://taurus-scada.org/devel/api/taurus/qt/qtgui/base/_TaurusBaseWidget.html#taurus.qt.qtgui.base.TaurusBaseWidget.onSetFormatter) slot to set a custom formatter on other widgets
3. (PROG) change the [`defaultFormatDict`](http://taurus-scada.org/devel/api/taurus/qt/qtgui/base/_TaurusBaseComponent.html#taurus.qt.qtgui.base.TaurusBaseComponent.defaultFormatDict) of a widget or class that uses the `defaultFormatter`
4. (PROG) set a custom formatter on any taurus widget (using `TaurusBaseComponent.setFormat`)
5. (PROG) set a custom formatter on any taurus class (by overwriting `.FORMAT`)
6. (CLI) set the defaultFormatter via a TaurusApplication command line argument (`--default-formatter`)
7. (CONF) set the defaultFormatter via tauruscustomsettings.DEFAULT_FORMATTER


#### DON'T... change the default formatter
Note that options 6 and 7 above deal with the **default** formatter and therefore **will affect all widgets** (except those that explicitly changed it). Therefore they should be used with great care and only with very generic formatters.

In other words: **Do not use options 6 or 7 unless you REALLY know what you are doing**. Option 4 should also be used with care if applied to a base class (since all child classes will be affected)
