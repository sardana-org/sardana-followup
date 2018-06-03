# Hands-on tutorial on the taurus_pyqtgraph plugin

## The pyqtgraph module

Pyqtgraph is a pure-python generic 2D and 3D plotting module.
See the [official pyqtgraph docs](http://pyqtgraph.org/)

For a nice overview of its capabilities, run:

```
python -m pyqtgraph.examples
```

## The taurus_pyqtgraph plugin

taurus_pyqtgraph is a plugin for taurus that provides classes that extend
pyqtgraph to provide features needed in taurus plotting widgets.

The [TEP17](https://github.com/taurus-org/taurus/pull/452) defines the first
milestone for its implementation and some design decisions

The idea is that each taurus_pyqtgraph class can be used as much as possible
with pure pyqtgraph classes (i.e., making the taurus_pyqtgraph classes as
autonomous as possible).

The plugin is implemented in [its own repo](https://github.com/taurus-org/taurus_pyqtgraph).

When installed, it uses setuptools entry-points to transparently insert istself
as `taurus.qt.qtgui.tpg`

It is still work-in-progress (see the checklist in the [README](https://github.com/taurus-org/taurus_pyqtgraph/blob/master/README.md)).


### To install:

First make sure that you have taurus >=4.3.1 and all the taurus-qt dependencies.
(e.g. you may use the [taurus-test docker](https://github.com/cpascual/taurus-test/))

```
docker run -d --name=taurus-stretch -h taurus-test cpascual/taurus-test:debian-stretch
xhost +local:
docker run -d --name=taurus-stretch -h taurus-test -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix cpascual/taurus-test:debian-stretch
docker exec -it taurus-stretch bash
# ...
git clone https://github.com/taurus-org/taurus.git
pip install ./taurus
```

Then just install the taurus_pyqtgraph plugin

```
git clone https://github.com/taurus-org/taurus_pyqtgraph.git
pip install ./taurus_pyqtgraph
```

## Examples

Display a taurus 1D attribute on an otherwise pure pyqtgraph plot ([code here](https://github.com/taurus-org/taurus_pyqtgraph/blob/master/taurus_pyqtgraph/examples/taurusplotdataitem.py)):

```
python -m taurus.qt.qtgui.tpg.examples.taurusplotdataitem
```

... And see the standard pyqtgraph features:

- zoom & pan
- Plot options
- Export
- ...

Use the tpg.TaurusPlot high-level widget...

```
python -m taurus.qt.qtgui.tpg.plot --demo
```

... and play with the taurus-added features:
- XY Model chooser (TaurusXYModelChooserTool)
- plot configuration (CurvesPropertiesTool)
- Secondary Y axis (Y2ViewBox)
- show legend (PlotLegendTool)
- Save/Retrieve configuration (tpg.TaurusPlot)

### TrendSet item

Example on using a tpg.TaurusTrendSet and some related tools
on a pure pyqtgraph plot ([code here](https://github.com/taurus-org/taurus_pyqtgraph/blob/master/taurus_pyqtgraph/examples/taurustrendset.py)):

```
python -m taurus.qt.qtgui.tpg.examples.taurustrendset
```
... and play with the taurus-added tools:

- Date-time axis support (DateAxisItem)
- X-Axis -> Fixed Range Scale , a.k.a. "oscilloscope mode" (XAutoPanTool)
- Forced Read (ForcedReadTool)
