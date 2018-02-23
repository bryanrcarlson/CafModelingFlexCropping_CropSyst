## pre 02/05/2018
This folder contains template files for various (sub)projects.  The folder structure is relative to the root project structure (../).  When running on a new environment, the template folder with related project files should be copied to the root.  The "setup.sh" or "setup.bat" file should be copied to the relative path (outside of the template directory, but mirroring the template dir structure).  The project should be built fresh from the "startup.sh" or "startup.bat" files.

For example, to set up the main DSS run, copy "template" and all files and folders that are not sub-projects.  Then copy "template/setup.sh" to same dir level as "template" dir.  Run "setup.h" - this will copy Database, etc outside of template.

## 02/05/2018
Moving to only needing to copy "setup.sh" (or "setup.bat", but these have not been updated).  Files to be copied will be downloaded from git using SVN or copied remotely using other means.  This should also make mirroring paths between actual project runs and template runs no longer neccessary (02/23/2018 brc - this isn't really true, subproject will need to mirror template paths).

See template/setup.sh for first example and template/DecisionSupport/setup.sh. (to run a subproject, DecisionSupport, both the root setup.sh file and the subproject setup.sh file need to be run)