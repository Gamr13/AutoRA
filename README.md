# AutoRA
Automatically download RetroArch, Windows cores, Additional DLLs for cores to work and places all files correctly for an x64 build in MSVC 2019. 

# INSTRUCTIONS
PRE-REQUISITES!!!
- Install git and 7-Zip
These are required for the script to run.

1) Download the RAScript.bat
2) Run RAScript.bat

# What does it do?
1) git clones RetroArch master branch and gets older versions of cores for added compatibility
2) Downloads fresh ANGLE Cores (for Xbox users) and regular cores
3) Extracts both ANGLE cores and regular cores
4) Moves the files to the correct directories and deletes the non-ANGLE cores
5) Copies the ANGLE cores
6) Deletes any of the left-over files
7) Deletes any broken cores / bloat cores / game engines (as tested on Xbox)
