# Sardana Workshop @ Tango Meeting 2019 Hamburg

## Session 1 - Data acquisition

* Possibility to directly acquire an experimental channel
  (without the need to define a measurement group) (Teresa) (~10 min)

* SEP18 (Zibi) (~20 min)
    * measurement group preparation
    * number of starts attribute of measurement group
    * new API of experimental channel controllers (Prepare and Load)
    * software and hardware start synchronization type

* `expconf` external changes pop-up (Carlos F.) (~15 min)

* SEP2 (Zibi) (~30 min)
    * value reference reporting
    * value reference configuration (pattern and enable/disable)
    * VDS in HDF5

## Coffee Break (~30 min)

## Session 2 - Miscellaneous topics

* Possibility to change data format (shape) of pseudo counter values (Teresa)
  (~15 min)

* Macro optional parameters (Carlos F.) (~10 min)

* Spock syntax and macro API for executing macros (Teresa) (~15 min) 
    * Review the complete spock syntax and macro API
    * Recently added possibility to pass values of repeat parameters with just
      one member without the need to encapsulate them in square brackets
      (spock syntax) or list (macro API)

* `newfile` macro (Teresa) (~10 min)

* Spock in Qt widget (Tim Schoof) (~10 min)

* Taurus Best Practices (Carlos F.) (~15 min)
  * How to choose the Qt binding (qt4, qt5, pyside)
  * Helpers and Validators?

* Brainstorming about the project roadmap (~1 h)
  * Python 3
  * SEP16 (Plugin Register)
  * SEP17 (Ongoing acquisition formalization and implementation)
  * ...
