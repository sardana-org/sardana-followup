# sardana-test vagrant configuration
cd ../
It is based on a [Debian](http://www.debian.org) stable and it provides the following infrastructure for installing and testing Sardana:

* sardana dependencies and recommended packages (PyTango & itango, taurus, ipython, ...)
* a Tango DB configured and running
* sardana demo environment: Pool and MacroServer populated with the sar_demo macro and some basic MacroServer environment variables

But you may also run it on your own machine to simply try sardana or even use it as an execution environment if you plan to develop sardana project.
Before continuing, answer yourself which would be your use case, cause the way you create the container differs and there is no way to change between them other than recreating the container from scratch.

## How to try sardana using this configuration


To run the VM on your host simply execute (from this project directory):

~~~~
vagrant up
~~~~

Then in the console start the server:
~~~~
Sardana demo1
~~~~

And in another one the spock client:
~~~~
spock
~~~~

then execute the `sar_demo` macro, and play with it...
