# Clean_log SUSHI labrotation
A cleaner version of the [labrotation log](https://github.com/flo-v/SUSHI_labrotation#sushi_labrotation), that reduces redundancies.  
This document is hopefully of use for the next person building a sushi app.  
(Written by Florian Vetsch 2022)

Table of Contents
=================

* [Setup and test running apps](#setup-and-test-running-apps)
* [Creating new apps](#creating-new-apps)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go)  
  
Cheat Sheet
* https://docs.google.com/document/d/1wTNdJgTzK7J54p90yH-djF5L_4VUwl64JknVmSCNxCE  

General info on how sushi works by Florian
* https://github.com/flo-v/SUSHI_labrotation/blob/main/README.md#18-may-2022-general-way-sushi-app-works-flo

## Setup and test running apps

### Setting up basics

1. Get windows subsystem (or any other way to use bash commands on local machine)
2. Create personal Github account (if not already existing)
3. Making a git repository, for the lab rotation (to keep the working log updated)
4. Fork SUSHI repository
5. Fork ezRun repository
6. Connect Git Repos via ssh with local machine (https://www.linuxfordevices.com/tutorials/linux/connect-to-github-with-ssh)

@ Masa what did you have to do permission wise to let me use the servers? on the first meeting and then with the second in person meeting
@ Masa what permission did you have to give me for the functional genomics server?

### Instaling ezRun on functional genomics server
```
ssh fvetsc@fgcz-genomics.uzh.ch
$ vim ~/.Rprofile
.libPaths("/srv/GT/analysis/florian/R_LIBS") # this is the path for installing future R libraries, here I have writing permission
$ cd /srv/GT/analysis/florian/
# clone ezRun fork into directory, for this we need to generate a ssh key again
$ ls -al ~/.ssh # check if key is existing, creating a new one anyway
$ ssh-keygen -t ed25519 -C "flo-v@Github"
# press enter to save at default location
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
$ cat ~/.ssh/id_ed25519.pub # copy the key from output
# one has to add key on Github.com
$ cd /srv/GT/analysis/florian/
$ git clone git@github.com:flo-v/ezRun.git # creates git repo

$ R CMD INSTALL /srv/GT/analysis/florian/ezRun # needs to link to git repo so new ezRun updates are always installed
$ ls /srv/GT/analysis/florian/R_LIBS/ # check if ezRun is listed under libraries
$ exit
```

### Changes in test_sushi
Masa modified test sushi in the following ways to solve permission problems:
* I modified the ezRun installed path as follows
```
22-05-05 13:53 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220505/master
$ grep 'flo' lib/global_variables.rb
    command<<  "library(ezRun, lib.loc='/srv/GT/analysis/florian/R_LIBS/')\n"
```
* I changed some configuration to avoid the permission error
* Now the result file will be copied to */srv/GT/analysis/sushi_course/public/gstore/projects/p1535/*
    * Previously, it was */srv/gstore/projects/p1535* (this was allowed only for Employees)

* changed the settings to get proper html outputs
* changed the place where raw data files are stored (different from gstore that production sushi uses)


### Running sushi on kenlab server
```
ssh fvetsc@fgcz-c-047.uzh.ch # from local command line
fvetsc@fgcz-c-047: 
$ mkdir /srv/kenlab/flo
$ /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ cd /srv/kenlab/flo
# clone sushi fork into directory, for this we need to generate a ssh key again
# in my case Masa provided flo_sushi_20220511.tgz already 
# which is a clone of my sushi fork with added files for managing access permissions (files listed in .gitignore in order not to push them on the sushi fork)
# therefore I only copy the file to my directory
$ cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220511.tgz .
$ tar zxvf flo_sushi_20220511.tgz
```
#### Executing sushi steps
```
$ cd flo_sushi_20220511/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ umask 000 # to set the default directory permission to 777
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
To check the rails execution:
```
$ ps aux |grep rails
masaomi  16798 20.6  0.0 321176 125024 pts/58  Sl+  14:49   0:04 /misc/ngseq10/packages/Dev/Ruby/3.0.3/bin/ruby script/rails s -e production -b fgcz-c-047.uzh.ch -p 5000
$ kill -9 16798 # to stop process
```

Then do: 

#### FGCZ website steps
Start VPN (if not in UZH network) and accessed http://fgcz-c-047.uzh.ch:5000: (5000 or whatever number defined in rails execution)   
Logging in with username  
Run analysis on data:
1. Select project 1535 ((if data-to-be-analysed is already loaded in sushi skip directly to step 4)
2. gStore-ventricles_100k-test_masa_dataset.tsv (or other data; download, if not already done)
3. Import-Browse-test_masa_dataset.tsv-DataSet (or use other data), define Name:xxxx-load dataset
4. Confirm by clicking DataSet in menu
5. Click test_dataset with given name xxxx (Applications - refresh if you cannot see the application buttons)
6. Select whatever application you want (here FastQCApp), and submit
7. Wait for some minutes, and check the result (by clicking on DataSets once again)  
  
Remember to terminate the task if app is not needed anymore by pressing control+c or killing the process as described above.    
Sometimes the local command line can be irresponsive after connecting to the VPN. In this case just disconnect from the VPN and it should work again.  

### Creating aliases
This way one doesn't always have to type all the commands  
```
$ fvetsc@fgcz-c-047:/home/fvetsc # is my home directory
# use: echo "text to add" >> .bash_aliases   and  cat .bash_aliases to copy and paste content from the file, if it doensn't work directly from txt editor
$ vim .bash_aliases
alias supa="cd /srv/kenlab/flo/flo_sushi_20220511/master/"
alias strt="cd /srv/kenlab/flo/flo_sushi_20220511/master/ && source /usr/local/ngseq/etc/lmod_profile && module load Dev/Ruby/3.0.3 && umask 000 && bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000"
alias che="ps aux |grep rails"
alias ezpa="cd /srv/GT/analysis/florian/ezRun"
alias ezins="R CMD INSTALL /srv/GT/analysis/florian/ezRun"
  
$ vim .vimrc
colo industry # setting default colourscheme
```

## Creating new apps
There are three main components of getting code to run in the sushi framework:
There is a ruby script managing input parameters and copying files to the right places etc. This script calls on a R app that does most of the computation eg. pca calculations) and finally markdown templates that display the results eg. as plots.

To start and get a feeling on how the apps work one can copy an existing app an rename it. (One can of course also start by building one's own app from scratch)  
Eg. by creating an identical FastqcApp.rb under new name (FastqcApp_1.rb):
```
fvetsc@fgcz-c-047:/srv/kenlab/flo/flo_sushi_20220510/master/lib
$ cp FastqcApp.rb Fastqc_1App.rb
$ vim Fastqc_1App.rb
# setting colorscheme to more readable for me by typing <Esc> and <:colorscheme industry>
# changing: class name to "Fastqc_1App", @name to "Fastqc_1", usecase = Fastqc_1App.new
# to close and save type <Esc> and <:x>
$ git add Fastqc_1App.rb
$ git commit -m "new app Fastqc_1App.rb" 
$ git push
```
Test if app works by running [sushi](#executing-sushi-steps) (or by using alias "strt" on kenlab server). Then perform [fgcz](#fgcz-website-steps) steps.

The next step is to alter the call to the R app in the ruby script in the function ```commands``` with the call ```run_RApp("EzAppFastQC_1")```.  
Then create the R app with said name:  
```
fvetsc@fgcz-h-176:~/ezRun/R$
cp app-fastQC.R ./app-fastQC_1.R
```
Replace the names with the new given names in the R app and then: 
Create the markdown templates that are associated with it.  
```
fvetsc@fgcz-h-176:/srv/GT/analysis/florian/ezRun/inst/templates$
cp FastQC.Rmd FastQC_1.Rmd
cp FastQC_overview.Rmd FastQC_1_overview.Rmd
```
Then reinstall ezRun, test if app works by running [sushi](#executing-sushi-steps) (or by using alias "strt" on kenlab server).   
Then perform [fgcz](#fgcz-website-steps) steps.  
Remember to push changes onto the online git repo if things work.

Then one can start to change the contents of the R app and markdown templates however one needs to.  
If extra R libraries are needed one can installed them in a directory where one has writing permissions. 
eg:
```
fvetsc@fgcz-h-176:/srv/GT/analysis/florian$
$R
BiocManager::install("fastreeR", lib="/misc/GT/analysis/florian/R_LIBS")
```
To load the libraries in the R app it may be necessary to also specify this path:  
```
library("fastreeR", lib.loc = "/misc/GT/analysis/florian/R_LIBS")
```
Then reinstall ezRun, run sushi and check if app with new templates works and push to github.  

