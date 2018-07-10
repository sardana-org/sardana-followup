# Sardana Documentation Style Guide

1. **Up to which level we will guarantee the documentation to be addressable?** 
   We guarantee up to three levels of the documentation chapters to be addressable.
   For example: Sardana Documentation (level 1) -> Developer's Guide (level 2) -> Writing macros (level 3)
2. **How to document Tango specific interfaces/implementation?**
   Sardana documentation should be as much as possible Control System (server layer) agnostic.
   In general, only the Tango API should contain Tango interfaces explanation.
3. **How to refer to Sardana and its elements**
   We use the following names TODO:
   * Sardana - Sardana project
   * Sardana server - Sardana server
   * Device Pool - Pool of devices
   * Pool server - Device Pool server process
   * MacroServer - Environment where macros are defined and Macro execution contexts resides 
   * MacroServer server - MacroServer server process
   * Macro - user procedure
   * Spock - Sardana CLI
