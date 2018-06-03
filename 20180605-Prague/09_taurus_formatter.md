# Taurus Formatter

## How to modify the default formatter

### Using tauruscustomsettings file

Taurus widgets use a default formatter based on the attribute type,
but sometimes a custom formatter is needed.
IMPORTANT: setting this option in this file will affect ALL widgets
of ALL applications (which is probably **not** what you want, since it
may have unexpected effects in some applications).

e.g.:
```
DEFAULT_FORMATTER = '{0}'
# or
DEFAULT_FORMATTER = 'taurus.core.tango.util.formatter.tangoFormatter'
```

### Using the related `--default-formatter` parameter

This will modify the format of all (sub)widget present in the GUI

e.g.:
```
taurusform MODEL --default-formatter='{:2.3f}'
```

### Using the API for modifying this on a per-widget per-class basis at runtime

This can affect to all widget type (inherited from the modified class)
in a particular GUI or just an instance of the class.

```
from taurus.qt.qtgui.display import TaurusLabel
TaurusLabel.FORMAT = taurus.core.tango.util.formatter.tangoFormatter
TaurusLabel.FORMAT = '{:2.3f}'
# or
myLabel = TaurusLabel()
myLabel.setFormat('{}')
myLabel.setFormat(taurus.core.tango.util.formatter.tangoFormatter)
```

## Formatter examples

In taurus.qt.qtgui.base.taurusbase
```
defaultFormatDict = {float: "{:.{bc.modelObj.precision}f}",
                        Enum: "{0.name}",
                        Quantity: "{:~.{bc.modelObj.precision}f}"
                        }
```

In taurus.core.tango.util.formatter
```
def tangoFormatter(dtype=None, **kwargs):
    """
    The tango formatter callable. Returns a format string based on
    the `format` Tango Attribute configuration (Display.Format in Tango DB)

    :param dtype: (type) type of the value object
    :param kwargs: other keyword arguments (ignored)

    :return: the string formatting
    """
    if dtype is Quantity:
        fmt = "{:~{bc.modelObj.format_spec}}"
    else:
        fmt = "{:{bc.modelObj.format_spec}}"
    return fmt
```

Others
```
def myFormatter1(**kwargs):
    return "{bc.modelObj.name}"
```

```
def myFormatter2(**kwargs):
    return "{~:.2e}"
```

## Let's play


Taurus demo (tauruslabel):
```
taurusdemo
```

TaurusForm:
```
taurusform sys/tg_test/1/float_scalar sys/tg_test/1/double_scalar
```


Programmatically:

```
import sys
import taurus
from taurus.qt.qtgui.display import TaurusLabel
from taurus.qt.qtgui.application import TaurusApplication

# Modify the format for all of my TaurusLabel
TaurusLabel.FORMAT = taurus.core.tango.util.formatter.tangoFormatter

app = TaurusApplication(sys.argv)

w1 = TaurusLabel()
w1.setFixedWidth(200)
w2 = TaurusLabel()
w2.setFixedWidth(200)

w1.setModel('sys/tg_test/1/float_scalar')
# Modify the format of w1
w1.setFormat('{:2.3f}')
w2.setModel('sys/tg_test/1/float_scalar')
w1.show()
w2.show()
sys.exit(app.exec_())
```
