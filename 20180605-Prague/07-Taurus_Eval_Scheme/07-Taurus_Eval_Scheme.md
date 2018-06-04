# Hands-on tutorial on the evaluation scheme

## Introduction

The [evaluation scheme](http://taurus-scada.org/devel/api/taurus/core/evaluation.html)
 is a "swiss-army knife": versatile, handy,...

Useful for doing operations with the values read from other attributes and for
accessing data sources for which no specific scheme exists.

Essentially, the value of an eval attribute is the result of evaluating python
code given in the attribute URI.

The symbols accessible when evaluating the code depend on the associated
evaluation device. By default, a "DefaultEvaluator" device is used which
provides a large subset of numpy functions.
Alternatively, python modules and classes can be used as evaluation devices
(more on this later on).


## Basic usage: eval for doing operations with other attributes

Just using the default evaluator:

```
import taurus

a = taurus.Attribute('eval:Q(rand(),"V")')
print a.read().rvalue
```

and we see that since we omitted the evaluation device, the default evaluator
is used:

```
print a.getFullName()
```

The values of other attributes can be accessed by enclosing the model name in
`{}`:

```
taurusform "tango:sys/tg_test/1/short_scalar" "eval:{tango:sys/tg_test/1/short_scalar}*10"
```

Also, all existing taurus widgets should accept eval models (unless they are
specifically labelled as tango-centric):

```
taurustrend "tango:sys/tg_test/1/short_scalar" "eval:-{tango:sys/tg_test/1/short_scalar}"
```

Finally, note that the evaluations are units-aware:

```
taurusform "eval:({eval:Q('3N')}/{eval:Q('2kg')}).to_base_units()"
```

(the value displayed in the form is `1.5 m/s**2`)

### Tips on evaluation devices:

Evaluation devices inherit from `taurus.core.util.safeeval.SafeEvaluator` and
their API can be used can used to, e.g. add symbols programmatically:

```
import taurus
d = taurus.Device('eval:@mydev')
d.addSafe({'message':'hello world'})
a = taurus.Attribute('eval:@mydev/message.upper()')
print a.read().rvalue
```

... or check the available symbols::

```
    # ...
    print sorted(d.getSafe().keys())
```

## eval for accessing values from arbitrary modules

Since Taurus 4.1, we can use the `@foo.*` syntax to instantiate an evaluation
device with access to all the symbols available in the `foo` module.

So, for example, for accessing the `os.path.exists()` function we can do:

```
taurusform 'eval:@os.*/path.exists("/home")'
```

Note that the module name can contain dots, so the following is also valid:

```
taurusform 'eval:@os.path.*/exists("/home")'
```

Here are some more examples that demonstrate how to expose all kind of info
as taurus attributes:

```
taurusform  'eval:@datetime.*/date.today().isoformat()'  \
            'eval:@os.*/environ["USER"]'           \
            'eval:@os.path.*/getsize("/var/log/messages")<50'
```

## eval for accessing members of class instances

Since Taurus 4.1, we can also use the `@name=foo.Bar()` syntax to instantiate an
evaluation device with access to all the symbols available in an instance
called `name` of the `foo.Bar` class. And note that you can also pass arguments
to the class constructor!


For example, create a `/tmp/examples/` directory  and add it to the PYTHONPATH:

```
mkdir -p /tmp/examples
export PYTHONPATH=/tmp/examples;$PYHTONPATH
```

Now create `/tmp/examples/foo.py` in it with the following content:

```
class Bar(object):
    def __init__(self, v):
        self.even = bool(v % 2)
        self.odd = not self.even
```

Then we can do:

```
taurusform 'eval:@b=foo.Bar(3)/b.even' 'eval:@b=foo.Bar(3)/b.odd' 'eval:@c=foo.Bar(8)/c.even'
```

A more practical example using the cv2 (OpenCV) module:

```
taurusimage --taurus-polling-period=100 'eval:@c=cv2.VideoCapture(0)/c.read()[1][...,2]'
```


## Writable evaluation attributes

The class syntax just seen above allows us to define *writable* evaluation
attributes. Basically, any *writable* property of the class will be exposed as
a writable attribute:

For example, create `/tmp/examples/mymod.py` with the following content:

```
class MyClass(object):

    _foo = 0

    def get_foo(self):
        return self._foo

    def set_foo(self, value):
        self._foo = value

    foo = property(get_foo, set_foo)
```

Then (assuming /tmp/examples/ is still in the PYTHONPATH), we can do:

```
taurusform 'eval:@c=mymod.MyClass()/c.foo'
```

This allows to easily wrap python modules and make them accessible to taurus
for quick prototyping.

You can find more complex examples [here](https://github.com/taurus-org/taurus/blob/develop/taurus/lib/taurus/core/evaluation/test/res/)

