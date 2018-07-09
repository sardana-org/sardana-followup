# Some usefull information

## Working with your personal environment

* See wifi network and password on the whiteboard.

## Working with the local environment (Thin Client)

1. Log in with one of the users training01, training02, ..., training05 (see password on the whiteboard)
2. Launch the Desktop Training Application.
3. Launch MobaXterm application.
4. ssh to the development host (see hostname on the whiteboard)
5. Source `~/workspace/devenv` script
6. Run your Pool and MacroServer (your username is the instance name).
7. Execute spock (your username is the profile name)
8. Enter into `~/workspace/sardana` and build the Sardana documentation using `python setup.py build_sphinx`

## Work organization

1. We use a Kanban [project board](https://github.com/sardana-org/sardana/projects/1).
   Limit WIP and favor reviwing PR over writing new docs.
2. The project board contains issues and cards.
3. Issues are organized according to priorities for each of the column.
4. Some issues are big enough to be splitted into smaller issues or cards - feel free to do that.
5. Allways assign yourself to issues when you start working on them. (for cards add a tag e.g. \[reszelaz\])
6. If something is not clear e.g. where or how to document it don't hesitate to ask.
7. Create PR only if it is necessary, for example, don't bother peer reviewers with typos.
   Push simple changes directly to the upstream.
8. In *Ready for dev* column contains a separator. Below the separator are easy issues for quick developments.


## Usefull links:

* Sphinx [cheetsheat](https://matplotlib.org/sampledoc/cheatsheet.html)
* Sphinx [documentation](http://www.sphinx-doc.org/en/master/index.html)

## Lunch

* At the canteen say that you are on the Sardana Documentation Camp (only the 4 invited persons).
