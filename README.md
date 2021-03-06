# SUSHI_labrotation

Table of Contents
=================

* [26 Apr\. 2022, Kick\-off meeting, Florian \+ Masa](#26-apr-2022-kick-off-meeting-florian--masa)
* [27\-29 Apr\. 2022, get sushi test instance working for Flo](#27-29-apr-2022-get-sushi-test-instance-working-for-flo)
* [04 May 2022, ezRun explanation meeting, Florian \+ Masa](#04-may-2022-ezrun-explanation-meeting-florian--masa)
* [05 May 2022, ezRun install test, Masa](#05-may-2022-ezrun-install-test-masa)
* [06-08 May 2022, testing FastQC & Minimal app and ezrun install test Flo](#06-08-may-2022testing-fastqc--minimal-app-and-ezrun-install-test-flo)  
* [09 May, 2022, updated SUSHI configuration](#09-may-2022-updated-sushi-configuration-masa)
* [09-10 May, 2022, test updated SUSHI, flo](#09-10-may-2022-test-updated-sushi-flo)
* [11 May 2022, Updated flo\_sushi\_20220511 again, masa](#11-may-2022-updated-flo_sushi_20220511-again-masa)
* [11 May 2022, Updated flo\_sushi\_20220511 test, flo](#11-may-2022-updated-flo_sushi_20220511-test-flo)
* [12 May 2022, sample dataset, Masa](#12-may-2022-sample-dataset-masa)
* [12-17 May 2022, flo was sick](#12-17-may-2022-flo-was-sick)
* [16 May 2022, creating aliases & vim defaults, flo](#16-may-2022-creating-aliases--vim-defaults-flo)
* [18 May 2022, general way sushi app works, flo](#18-may-2022-general-way-sushi-app-works-flo)
* [18 May 2022, trying to import vcf files, flo](#18-may-2022-trying-to-import-vcf-files-flo)
* [19-21 May 2022, flo was sick again](#19-21-may-2022-flo-was-sick-again)
* [23 May 2022, Hint for import, Masa](#23-may-2022-hint-for-import-masa)
* [30 May 2022, testing own app, flo](#30-may-2022-testing-own-app-flo)
* [01 June 2022, Meeting solving problems, Masa \+ Flo](#01-june-2022-meeting-solving-problems-masa--flo)
* [02 June 2022, Start my own popgen app,flo](#02-june-2022-start-my-own-popgen-app-flo)
* [04-08 June 2022, Sick again, Flo](#04-08-june-2022-sick-again-flo)
* [09 June 2022, continue popgen app, Flo](#09-june-2022-continue-popgen-app-flo)  
* [13 June 2022, embeding pca & phylogenetic analysis in the app, Flo](#13-15-june-2022-embeding-pca--phylogenetic-analysis-in-the-app-flo) 
    
Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go)

## 26 Apr. 2022, Kick-off meeting, Florian + Masa

ToDo/Done
1. ~~Making a git repository~~
2. ~~Fork SUSHI repository~~
3. ~~Fork ezRun repository~~
4. ~~Demo local SUSHI instance on fgcz-c-047.uzh.ch~~
5. ~~Test local instance access, job submission~~

Log
```
22-04-26 14:26 masaomi@fgcz-c-047: mkdir /srv/kenlab/flo
22-04-26 14:29 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ cp masa_test_sushi_20220414.tgz ./flo_sushi_20220426.tgz
$ tar zxvf flo_sushi_20220426.tgz
$ cd flo_sushi_20220426/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
Note
* The SUSHI instance source code: /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426.tgz

To check the process
```
$ ps aux |grep rails
masaomi  16798 20.6  0.0 321176 125024 pts/58  Sl+  14:49   0:04 /misc/ngseq10/packages/Dev/Ruby/3.0.3/bin/ruby script/rails s -e production -b fgcz-c-047.uzh.ch -p 5000
$ kill -9 16798
```
Then
* start VPN
* access http://fgcz-c-047.uzh.ch:5000
 * Login by BFabric account/password

Setup test dataset in p1535
1. Select project 1535
2. gStore-ventricles_100k-test_masa_dataset.tsv (download)
3. Import-Browse-test_masa_dataset.tsv-DataSet Name:xxxx-load dataset
4. Confi
by clickin DataSet in menu
5. Click test_dataset (Applications - refresh if you cannot see the application buttons)
6. Select FastQCApp, and submit
7. Wait for a minute, and check the result
8. Test making a new SUSHI app

Then next
* Masa will give you how to make ezRun application with SUSHI


## 27-29 Apr. 2022, get sushi test instance working for Flo

ToDo/Done
1. ~~Get windows subsystem running for linux commands~~
2. ~~Get Github to work with access tokens~~

Log
```
fvetsc@fgcz-c-047:/srv/kenlab/flo
$ cp /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426.tgz .
$ rm /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426.tgz
$ tar zxvf flo_sushi_20220426.tgz
$ cd flo_sushi_20220426/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
### FGCZ website steps
Start VPN and accessed http://fgcz-c-047.uzh.ch:5000: (5000 or whatever number defined in rails execution)   
Logging in with username  
Run analysis on data:
1. Select project 1535
2. gStore-ventricles_100k-test_masa_dataset.tsv (or other data; download, if not already done)
3. Import-Browse-test_masa_dataset.tsv-DataSet (or use other data), define Name:xxxx-load dataset
4. Confirm by clickin DataSet in menu
5. Click test_dataset with given name xxxx (Applications - refresh if you cannot see the application buttons)
6. Select whatever application you want (here FastQCApp), and submit
7. Wait for some minutes, and check the result (by clicking on DataSets once again)


Make new sushi app
Log
```
$ ps aux |grep rails
$ fvetsc  16798 20.6  0.0 321176 125024 pts/58  Sl+  14:49   0:04 /misc/ngseq10/packages/Dev/Ruby/3.0.3/bin/ruby script/rails s -e production -b fgcz-c-047.uzh.ch -p 5000
$ kill -9 16798
$ exit
local: ssh fvetsc@fgcz-c-047.uzh.ch
$ vim /srv/kenlab/flo/flo_sushi_20220426/master/lib/MinimalApp.rb # created a minimal app
$ cd /srv/kenlab/flo/flo_sushi_20220426/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
error: uninitialized constant ApplicationController::MinimalApp_flo
MinimalApp_flo cannot be imported

### Questions/problems:
* ~~what is the adress for the ssh connection to the server again? maybe I got somthing wrong?~~

* ~~when starting the VPN access to http://fgcz-c-047.uzh.ch:5000 doesn't work~~
* ~~after having done everything in the log above and started VPN to access http://fgcz-c-047.uzh.ch:5000 : page loads but login to BFabric account doesn't work. Error message: "We're sorry, but something went wrong."~~
* Newly created sushi app is not listed under stats category when chosing apps for analysis on http://fgcz-c-047.uzh.ch:5000

## 04 May 2022, ezRun explanation meeting, Florian \+ Masa

Cheat Sheet
* https://docs.google.com/document/d/1wTNdJgTzK7J54p90yH-djF5L_4VUwl64JknVmSCNxCE

ToDo (by Florian)
```
22-05-04 10:10 masaomi@fgcz-c-047:/srv/kenlab/flo
$ cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504.tgz .
$ tar zxvf flo_sushi_20220504.tgz
```

Log
1. Start VPN
2. test run SUSHI

```
22-05-04 10:15 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 4001
```

Access
* http://fgcz-c-047.uzh.ch:4001/
* Job submission test

Note
* Florian could use port:5000

Next
* Minimal SUSHI App test

Log
```
22-05-04 10:32 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git add lib/MinimalApp.rb

22-05-04 10:33 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git commit -m "Added MinimalApp.rb"
[master 820e59d1] Added MinimalApp.rb
 1 file changed, 32 insertions(+)
 create mode 100644 master/lib/MinimalApp.rb

22-05-04 10:33 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 32 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 793 bytes | 793.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To github.com:flo-v/sushi.git
 ! [remote rejected]   master -> master (permission denied)
error: failed to push some refs to 'git@github.com:flo-v/sushi.git'
```

Note
* I do not know why this failed, but Florian should be able to do git push.
* I may not be a collaborator of sushi.git

You are right, it worked
```
22-05-04 10:36 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220504/master
$ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 32 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 793 bytes | 793.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To github.com:flo-v/sushi.git
   4450a47f..820e59d1  master -> master
```
* Done

Next
* ezRun installation and run test

Log
```
22-05-04 10:39 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ which R
/usr/local/ngseq/bin/R
22-05-04 10:40 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ R --version
R version 4.1.2 (2021-11-01) -- "Bird Hippie"

22-05-04 10:41 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ R

> .libPaths()
[1] "/home/masaomi/R/x86_64-pc-linux-gnu-library/4.1"
[2] "/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library"

22-05-04 10:42 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ vim ~/.Rprofile
.libPaths("/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/RLIBS")

22-05-04 10:38 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ git clone git@github.com:flo-v/ezRun.git

$ vim ~/.bashrc
alias ezins='R CMD INSTALL /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun/'
```

Error
```
22-05-04 10:48 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ R CMD INSTALL /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun/
* installing to library ???/export/kenlab/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/RLIBS???
* installing *source* package ???ezRun??? ...
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error : package or namespace load failed for ???celda??? in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library/magick/libs/magick.so':
  libMagick++-6.Q16.so.8: cannot open shared object file: No such file or directory
Error: unable to load R code in package ???ezRun???
Execution halted
ERROR: lazy loading failed for package ???ezRun???
* removing ???/export/kenlab/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/RLIBS/ezRun???

```
* fgcz-c-047 needs libMagic

Next
* test run VcfStatsApp
* ezRun R code structure

After you update ezRun code
```
22-05-04 11:26 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun
$ git add inst/templates/VcfStats.Rmd
22-05-04 11:26 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun
$ git commit -m "Test VcfStats.Rmd"
[master 99021ed2] Test VcfStats.Rmd
 1 file changed, 2 insertions(+)
22-05-04 11:27 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/ezRun
$ git push
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 32 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 463 bytes | 463.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To github.com:flo-v/ezRun.git
   7d9799aa..99021ed2  master -> master

22-05-04 11:28 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ ezins

22-05-04 11:29 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 4001

```
* Then, test job submission

Goal
* Various types of phylogenetic trees, clusterings using a vcf file
* SNPRelate SUSHI App by plotting phylogenetics tree

Masa, ToDo
1. Install some lack libraries for installing ezRun in fgcz-c-047

Florian, ToDo
1. SUSHI instance run test again with new files
2. test run MinimalApp
3. test run VcfStatsApp
4. test updating something in VcfStatsApp
5. test SNPRelate tutorial and make a PCA plot in RStudio
6. try SUSHI application for PCA plot as an example
7. and meeting again

Note
* Masa will be teaching on 18-20, Bio334, practical bioinformatics, R, Python coding

## 05 May 2022, ezRun install test, Masa

Log
```
# 22-05-05 13:27 masaomi@fgcz-h-176:/srv/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505
$ git clone git@github.com:flo-v/ezRun.git ezRun_flo
$ mkdir R_LIBS
$ vim ~/.Rprofile
# .libPaths("/srv/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS")

$ R -q -e ".libPaths()"
# > .libPaths()
# [1] "/misc/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS"
# [2] "/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library"

$ R CMD INSTALL /srv/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/ezRun_flo/
# * installing to library ???/misc/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS???
# * installing *source* package ???ezRun??? ...
# ** using staged installation
# ** R
# ** inst
# ** byte-compile and prepare package for lazy loading
# loading EZ_GLOBAL_VARIABLES  from: /misc/GT/analysis/masaomi/2022/FGCZ/test_install_ezrun_on_c47_20220505/R_LIBS/00LOCK-ezRun_flo/00new/ezRun/extdata/EZ_GLOBAL_VARIABLES.txt
# ** help
# *** installing help indices
# ** building package indices
# ** installing vignettes
# ** testing if installed package can be loaded from temporary location
# ** testing if installed package can be loaded from final location
# ** testing if installed package keeps a record of temporary installation path
# * DONE (ezRun)
```

To Florian
* Pleaase copy **@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220505.tgz** again to your working directory
* I modified the ezRun installed path as follows

```
22-05-05 13:53 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220505/master
$ grep 'flo' lib/global_variables.rb
    command<<  "library(ezRun, lib.loc='/srv/GT/analysis/florian/R_LIBS/')\n"
```

* Please use **/srv/GT/analysis/florian/R_LIBS/** for installing ezRun, which means you should write the following line in your ~/.Rprofile

~/.Rrofile
```
.libPaths("/srv/GT/analysis/florian/R_LIBS")
```

* Please use **fgcz-genomics.uzh.ch**, not *fgcz-c-047.uzh.ch*, when you install ezRun

Note
* */srv/kenlab* directory is mounted (accessible) only on *fgcz-c-047*, but */srv/GT/analysis/florian/R_LIBS/* is shared by all cluster nodes and a SUSHI job can access the installed ezRun library
* SUSHI instance should run on *fgcz-c-047*, but ezRun installation should be done on *fgcz-genomics.uzh.ch* because some libraries are missing on *fgcz-c-047* for the ezRun installation, in other words, the command, *R CMD INSTALL xxx*, should run on *fgcz-genomics.uzh.ch* (it is shown as **fgcz-h-176** in command prompt after you login fgcz-genomics.uzh.ch, see the command log above).
* You can do *git clone* and edit your ezRun code on either *fgcz-c-047.uzh.ch* or *fgcz-genomics.uzh.ch*.

Sorry for complication. If you have a quesiton, please feel free to ask me.


## 06-08 May 2022,testing FastQC & Minimal App and ezRun install test, Flo

Log
```
22-05-04 10:10 fvetsc@fgcz-c-047:/srv/kenlab/flo
$ rm -rf flo_sushi_20220*
$ cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220505.tgz .
$ tar zxvf flo_sushi_20220505.tgz
$ cd flo_sushi_20220505/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
Testing FastQCApp:
[FGCZ website steps](#fgcz-website-steps)

### Problem:
* After submitting the FastQC analysis the job doesn't finish (takes more than 1 hour)
* MinimalApp.rb is not listed under stats category when chosing apps for analysis on http://fgcz-c-047.uzh.ch:5000 (I clicked refresh as well), even though I can see the app in /srv/kenlab/flo/flo_sushi_20220505/master/lib (testdata used: ventricles_100k)

Making & testing MinimalApp:

### Comments by Masa

* Please install ezRun package first (to /srv/GT/analysis/florian/R_LIBS)
* In order to install ezRun package you need 1) to set R LIBS path to your .Rprofile, and 2) to do *git clone* your ezRun source somewhere

For example, login fgcz-genomics.uzh.ch
```
$ vim ~/.Rprofile
.libPaths("/srv/GT/analysis/florian/R_LIBS")
$ cd /srv/GT/analysis/florian/
$ git clone git@github.com:flo-v/ezRun.git
$ R CMD INSTALL /srv/GT/analysis/florian/ezRun
$ ls /srv/GT/analysis/florian/R_LIBS/
(please make sure if ezRun is installed in the directory, /srv/GT/analysis/florian/R_LIBS/)
```

* Then you can test SUSHI (Rails) instance and FastQC job submission


## 09 May, 2022, updated SUSHI configuration, Masa

Dear Florian, 
* please copy the following file again to your working directory, and test to run SUSHI again.
    * */srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220510.tgz*
* And please install ezRun manually to */srv/GT/analysis/florian/R_LIBS* by referring to my previous comments.
    * You need to install *ezRun* manually to test your new SUSHI app, anyway.

Note
* I changed some configuration to avoid the permission error
* Now the result file will be copied to */srv/GT/analysis/sushi_course/public/gstore/projects/p1535/*
    * Previously, it was */srv/gstore/projects/p1535* (this was allowed only for Employees)


## 09-10 May, 2022, test updated SUSHI, Flo

Log
```
ssh fvetsc@fgcz-c-047.uzh.ch # from local command prompt
fvetsc@fgcz-c-047: cd /srv/kenlab/flo
$ rm -rf flo_sushi_20220*
$ cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220510.tgz .
$ tar zxvf flo_sushi_20220510.tgz
$ cd flo_sushi_20220510/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
Testing FastQCApp:
[FGCZ website steps](#fgcz-website-steps)

Analysis is listed under Jobs on fgcz-website but fails (as it should) as ezRun isn't installed yet.  

Log
```
fvetsc@fgcz-c-047: ps aux |grep rails
$ kill -9 "number" # number that task is listed as
exit
ssh fvetsc@fgcz-genomics.uzh.ch
$ vim ~/.Rprofile
.libPaths("/srv/GT/analysis/florian/R_LIBS")
$ cd /srv/GT/analysis/florian/
$ git clone git@github.com:flo-v/ezRun.git
```
Error:
```
Cloning into 'ezRun'...
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```
ssh key needed (https://www.linuxfordevices.com/tutorials/linux/connect-to-github-with-ssh):
```
$ ls -al ~/.ssh # check if key is existing, creating a new one anyway
$ ssh-keygen -t ed25519 -C "flo-v@Github"
# enter to save at default location
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
$ cat ~/.ssh/id_ed25519.pub # copy the key from output
# adding key on Github.com
$ git clone git@github.com:flo-v/ezRun.git
$ R CMD INSTALL /srv/GT/analysis/florian/ezRun
$ ls /srv/GT/analysis/florian/R_LIBS/
# eyRun is listed under libraries
$ exit

ssh fvetsc@fgcz-c-047.uzh.ch
$ cd /srv/kenlab/flo/flo_sushi_20220510/master
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
job still fails: the log of the job on the sushi webpage states:

```
cp: das Verzeichnis '/srv/GT/analysis/course_sushi/public/gstore/projects/p1535/Fastqc_2022-05-10--11-45-45/FastQC_Result' kann nicht angelegt werden: Keine Berechtigung
```
Therefore I assume there is still a permission problem.

Solution:
```
ssh fvetsc@fgcz-c-047.uzh.ch
cd /srv/kenlab/flo/flo_sushi_20220510/master
source /usr/local/ngseq/etc/lmod_profile
module load Dev/Ruby/3.0.3
umask 000 # to set the default directory permission to 777
bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
It worked!   
Many warnings about the apps are printed however: (eg. warning: already initialized constant Version, warning: previous definition of Version was here)  
and the html files under Job-DataSet on sushi webpage get the error: The requested URL was not found on this server.


Creating identical FastqcApp under new name:
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
it worked! but same problems apply as above when original FastqcApp was run


### Questions:
* ~~Masa made changes to flo_sushi like changing paths etc to avoid permission problems. Is this done in the sushi instance I forked on Github?~~


## 11 May 2022, Updated flo_sushi_20220511 again, Masa

Dear Florian

Please copy the following file to your working directory and test it again
```
/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220511.tgz
```

I have updated some setting to make a link correctly in Florian SUSHI.

## 11 May 2022, Updated flo_sushi_20220511 test, flo
```
fvetsc@fgcz-c-047:/srv/kenlab/flo
rm -rf flo_sushi_20220*
cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220511.tgz .
tar zxvf flo_sushi_20220511.tgz
cd flo_sushi_20220511/master/
source /usr/local/ngseq/etc/lmod_profile
module load Dev/Ruby/3.0.3
umask 000 # to set the default directory permission to 777
bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
Finally all working!

## 12 May 2022, sample dataset, Masa

Comments
* You can use the following data as a sample dataset

```
/srv/gstore/projects/p1535/test_vcf_dataset/
dataset.tsv  ragi_highcov_sa0001_1k.vcf.gz
```

* and you can refere to *lib/VcfStatsApp.rb* as an example of SUSHI application to process the vcf file.

If you have any questions, please do not hesitate to ask me.



# 12-17 May 2022, flo was sick

# 16 May 2022, creating aliases & vim defaults, flo
```
$ fvetsc@fgcz-c-047:/home/fvetsc
# use: echo "text to add" >> .bash_aliases   and  cat .bash_aliases to copy and paste content from the file
$ vim .bash_aliases
alias supa="cd /srv/kenlab/flo/flo_sushi_20220511/master/"
alias strt="cd /srv/kenlab/flo/flo_sushi_20220511/master/ && source /usr/local/ngseq/etc/lmod_profile && module load Dev/Ruby/3.0.3 && umask 000 && bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000"
alias che="ps aux |grep rails"
alias ezpa="cd /srv/GT/analysis/florian/ezRun"
alias ezins="R CMD INSTALL /srv/GT/analysis/florian/ezRun"
  
$ vim .vimrc
colo industry # setting default colourscheme
```

# 18 May 2022, general way sushi app works, flo
When a tsv file is imported from the local machine to sushi, this file contains only the column name information and the path to the raw data in the gstore.
The raw data must always be at the right point in the gstore otherwise the import from local will fail.  
In my case files weren't located at normal gstore of production sushi bc of permission problems (needs to be kept in mind).   
  
Apps in master/lib are written in Ruby and contain function "commands" in which run_RApp("name_of_App") is called (calls R App corresponding to this ruby app).   
Function "run_RApp" is defined in master/lib/golbal_variables.rb. run_RApp loads the ezRun package.

In ezRun all the Apps written in R are in directory R
The ezRunApps contain two important definitions:

* ezMethod<application_name> eg. ezMethodVcfStats: 
Here is where the dataanalysis in R is coded

* ezApp<application_name> eg.ezAppVcfStats:  
This is were the R class is created (inherits from ezApp superclass). In the class ezMethod<application_name> is called

ezRun/inst/templates contains the markdown documents associated with the specific R apps, the analysis done in the App that is in directory "R".  
The markdown templates and the R app share the same namespace (variables created in the app are accessible in the markdwon). The plotting is done in the markdown template.
Tabs on sushi webpage html output corresond to sections under title in the template

ezRun must be installed again, every time that changes in Apps (R) or templates (R Markdown) are made

In some cases the analysis is not really done by the R app, but the R app calls an external software that does it. Eg. in ```app-VcfStats.R``` a command is specified which is passed to the function ```ezSystem``` (is in ```system.R```) which calls on ```ezWrite``` (is in ```io.R```) which executes the command line tool vcf-stats.

In sushi webpage: Index shows path to file on gstore of functional genomics center (there I only have read permissions) therefore copying of files necessarry for editing   
To be able to use VcfStatsApp we need to add column namede "Dummy" as column Name requirements of app must be fulfilled by dataset (check column requirements in Help--SushiApp List



# 18 May 2022, Trying to import vcf files, flo
tried to import ragi_highcov_sa0001_1k.vcf.gz or ragi_highcov_sa0001_1k.vcf to sushi   

from local command line:
```
scp fvetsc@fgcz-c-047.uzh.ch:/srv/gstore/projects/p1535/test_vcf_dataset/ragi_highcov_sa0001_1k.vcf.gz .
gzip -dk ragi_highcov_sa0001_1k.vcf.gz
```
load the dataset to sushi by using [FGCZ website steps](#fgcz-website-steps)
### Problem:
* ragi_highcov_sa0001_1k.vcf.gz cannot be imported (Sushi webpage message: We're sorry, but something went wrong.)
This problem also appeared when I tried to import other vcf files

# 19-21 May 2022, flo was sick again


# 23 May 2022, Hint for import, Masa

Hint
* The importable file to SUSHI is only *.tsv file (which becomes a DataSet).
* Please download the following file and import it in SUSHI, https://fgcz-sushi.uzh.ch/projects/p1535/test_vcf_dataset/dataset.tsv

Note
* Please look at the file, dataset.tsv (Tab-Separated-Value, text file). It contains the file path to the actual vcf file.

# 30 May 2022, Testing own app, Flo

## creating new ezRun R app
```
fvetsc@fgcz-c-047:/srv/kenlab/flo/flo_sushi_20220511/master/lib$
$ vim Fastqc_1App.rb
# change in def commands so a different EzApp is called: run_RApp("EzAppFastqc_1")

fvetsc@fgcz-h-176:~/ezRun/R$
cp app-fastQC.R ./app-fastQC_1.R
vim app-fastQC_1.R
```

### places where EzRun app name is important
in the following the markdown template names haven't been altered yet    
#### change all "FastQC" to "FastQC_1" 
chnaged at the following places: 
* when defining the ezMethod  (1 change)
 ```ezMethodFastQC  <- function(```
* name of the style files that should be copied (here 2 changes)
```
  ## Copy the style files and templates
  styleFiles <- file.path(
    system.file("templates", package = "ezRun"),
    c(
      "fgcz.css", "FastQC.Rmd", "FastQC_overview.Rmd",
      "fgcz_header.html", "banner.png"
    )
  )
  file.copy(from = styleFiles, to = ".", overwrite = TRUE)
```
* when calling the style files (1)
```
  ## make for each plot type an html report with all samples
  plotPages <- sub(".png", ".html", plots)
  for (i in 1:length(plots)) {
    plotPage <- plotPages[i]
    pngs <- file.path(reportDirs, "Images", plots[i])
    rmarkdown::render(
      input = "FastQC_overview.Rmd", envir = new.env(),
      output_dir = ".", output_file = plotPage, quiet = TRUE
    )
  }
```
* when calling the style files (1)
```
  ## generate the main reports
  rmarkdown::render(
    input = "FastQC.Rmd", envir = new.env(),
    output_dir = ".", output_file = htmlFile, quiet = TRUE
  )
```
* don't really know what this is for (1)
```
##' @template app-template
##' @templateVar method ezMethodFastQC(input=NA, output=NA, param=NA, htmlFile="00index.html")
```
* when creating the app class (2: method call and description)
```
EzAppFastqc <-
  setRefClass("EzAppFastqc",
    contains = "EzApp",
    methods = list(
      initialize = function() {
        "Initializes the application using its specific defaults."
        runMethod <<- ezMethodFastQC
        name <<- "EzAppFastqc"
        appDefaults <<- rbind(perLibrary = ezFrame(Type = "logical", DefaultValue = TRUE, Description = "Run FastQC per library or per cell for single cell experiment"))
      }
    )
  )
```
#### change all "Fastqc" to "Fastqc_1" 

* don't really know what this is for (1)  
```ans4Report[["Fastqc quality measures"]] <- tbl```
* when creating the app class (3)
```
EzAppFastqc <-
  setRefClass("EzAppFastqc",
    contains = "EzApp",
    methods = list(
      initialize = function() {
        "Initializes the application using its specific defaults."
        runMethod <<- ezMethodFastQC
        name <<- "EzAppFastqc"
        appDefaults <<- rbind(perLibrary = ezFrame(Type = "logical", DefaultValue = TRUE, Description = "Run FastQC per library or per cell for single cell experiment"))
      }
    )
  )
```
#### change all "fastqc" to "fastqc_1" 

* werhe we define name of html report (1)
```
  rowNames <- paste0(
    "<a href=", reportDirs, "/fastqc_report.html>",
    names(files), "</a>"
  )
```
* werhe we define name of html report (1)
```
  tbl <- ezMatrix("", rows = rowNames, cols = smy[[2]])
  for (i in 1:nFiles) {
    smy <- ezRead.table(file.path(reportDirs[i], "summary.txt"),
      row.names = NULL, header = FALSE
    )

    href <- paste0(
      reportDirs[i], "/fastqc_report.html#M",
      0:(ncol(tbl) - 1)
    )[colnames(tbl) %in% smy[[2]]]
    img <- paste0(reportDirs[1], "/Icons/", statusToPng[smy[[1]]])
    tbl[i, colnames(tbl) %in% smy[[2]]] <- paste0(
      "<a href=", href,
      "><img src=", img, "></a>"
    )
  }
```
* leave fastqc calls be in ezMethod defintion as I think that refers not to the app but to a bash programm
* also leave multiqc as it is
```
## generate multiQC report
  ezSystem("multiqc .")
```

Then push to github, reinstall ezRun, run sushi and check if app works
  
## creating new ezRun markdown templates
```
fvetsc@fgcz-h-176:/srv/GT/analysis/florian/ezRun/inst/templates$
cp FastQC.Rmd FastQC_1.Rmd
cp FastQC_overview.Rmd FastQC_1_overview.Rmd
```
Changes in the file were just titles and table-column names to FastQC_1.  

Then push to github, reinstall ezRun, run sushi and check if app with new templates works.  
It worked.

# 01 June 2022, Meeting solving problems, Masa + Flo

### Problem 1 :
from local command line:
```
scp fvetsc@fgcz-c-047.uzh.ch:/srv/gstore/projects/p1535/test_vcf_dataset/dataset.tsv .
```  
load the dataset to sushi by using [FGCZ website steps](#fgcz-website-steps)    
An error happens with importing dataset.tsv  
RED file(s) or the following does not exist in gstore: /srv/GT/analysis/course_sushi/public/gstore/projects:
p1535/test_vcf_dataset/ragi_highcov_sa0001_1k.vcf.gz  
Solution:  
The problem was that in my case files are not stored at same place as the production sushi and raw data of dataset.tsv was only on gstore of production sushi.
The file had to be added to my storage as well.
In my sushi instance data is stored at: /srv/GT/analysis/course_sushi/public/gstore/projects


### Problem 2:
Job with ruby app that calls new ezRun app fails. Log states:  
Fehler: Objekt 'EzAppFastqc_1' nicht gefunden
Ausf??hrung angehalten

Solution:
Installation path of ezins was linking to the source code that was not updated: 
```/srv/GT/analysis/florian/ezRun```  
Therefore I deleted the old repo and made sure that under ```/srv/GT/analysis/florian/ezRun``` is the git repo that gets updated

# 02 June 2022, Start my own popgen app, Flo
Using as a basis ```VcfStatsApp.rb``` 
```
fvetsc@fgcz-c-047:/srv/kenlab/flo/flo_sushi_20220511/master/lib$
cp VcfStatsApp.rb FloApp.rb
fvetsc@fgcz-h-176:/srv/GT/analysis/florian/ezRun/R$
cp app-VcfStats.R app-Flo.R
cd ../inst/templates
cp VcfStats.Rmd Flo.Rmd
```
Edit all files in a new app.  

# 04-08 June 2022, Sick again, Flo

# 09 June 2022, continue popgen app, Flo
* added new tab in Flo.Rmd for PCA analysis:
  * displaying head of dataset
  
* started on R script for PCA analysis

## Questions:
* If I understand correctly: app-VcfStats.R does not do the SNP counting itself. The counting is done via bash command by the "vcf-stats" command line tool.  
I do not really understood yet what the equvialent to this would be when wanting to get the data ready for the pca plot. Do I simply do all in the R file or do I need to call on a command line tool?  
* vcf / gds transformation
* explain again please where the output of my analysis is stored and then accessed from the markdwon files


# 10 June 2022, Masa

## Answers:

1. Right. The *app-VcfStats.R* calls *vcf-stats* command (*vcftools*) that counts up SNPs in each sample.

L35, app-VcfStats.R
```
cmd <- paste("vcf-stats", file.path("/srv/gstore/projects", input$getColumn("Filtered VCF")), "-p", prefix)
```

You can choose whatever, either using external command (software) or using R package, but *SNPRelate* does not require to call any external command to make a PCA plt as far as I remember.

2. In the [SNPRelate tutorial](https://www.bioconductor.org/packages/devel/bioc/vignettes/SNPRelate/inst/doc/SNPRelate.html), it gives two ways, *snpgdsVCF2GDS()* or *seqVCF2GDS()* function converts the VCF file into GDS format. Does it not work?

3. You can decide where the output data will be stored. For example, *app-VcfStats.app* set *output_dir* for the output directory. Technically, SUSHI makes a working directory in */scratch* on working node and SUSHI transfers the target directory to */srv/gstore/projects/pXXXX* directory as a post-process. In the SUSHI app, you (developer) should focus on **inside the working directory** and 2) **which direcotry** will be copied at the end of the job by Ruby code (put **[File]** tag to the next dataset column in *next_dataset* function, cf. lib/VcfStatsApp.rb: L31, *'Report [File]'=>report_file*)

I can explain it again later when we meet.

# 10 June 2022, Florian + Masa

* updated app-Flo.R to load necessary libraries
### Problem:
Log: 
Fehler in library(SNPRelate) : es gibt kein Paket namens ???SNPRelate???
Ruft auf: <Anonymous> -> withCallingHandlers -> runMethod -> library
error exists: gxtx_data_mngt@fgcz.ethz.ch
mail sent to: gxtx_data_mngt@fgcz.ethz.ch
Ausf??hrung angehalten

### Answer:

* I succeeded in loading SNPRelate in my environment. Please check *.libPaths()* and your *~/.Rprofile*.

in RStudio (https://fgcz-genomics.uzh.ch)
```
> R.version.string
[1] "R version 4.1.2 (2021-11-01)"

> .libPaths()
[1] "/misc/GT/analysis/florian/R_LIBS"                 "/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library"

> library(SNPRelate)
Loading required package: gdsfmt
SNPRelate -- supported by Streaming SIMD Extensions 2 (SSE2)
```

* I have found the cause. By default, *snpgdsPCA()* removed other than autosomal SNPs (probably based on the scaffold/chromosome IDs in VCF file).
* Please add the following option: *autosome.only=FALSE*
    * cf. https://support.bioconductor.org/p/114050/
    * I searched by Google with the key words from error message like this: "SNPRelate Excluding  SNPs on non-autosomes"

### Try out the Answer
 
```
fvetsc@fgcz-h-176:~$ R
 > R.version.string
[1] "R version 4.2.0 (2022-04-22)"
> .libPaths()
[1] "/misc/GT/analysis/florian/R_LIBS"
[2] "/misc/ngseq10/packages/Dev/R/4.2.0/lib/R/library"
> library(SNPRelate)
Error in library(SNPRelate) : there is no package called ???SNPRelate???  
```
Loading SNPRelate in R studio on https://fgcz-genomics.uzh.ch/ has always worked so far.  
On the server fvetsc@fgcz-h-176 and when running the app-Flo.R it fails however (see above).  
The R version on fgcz-h-176 is a newer one than you used, is that a problem?

Thanks a lot for the help with the pca it worked in the R studio!

# 13 June 2022, SNPRelate loging test, Masa

Note
* Recently, the default R version was upgraded to v4.2.0, from 4.1.2.
* I installed **SNPRelate**, and now it should work.

Tips (for the future)
* Please check which R version you are using (for installation, for execusion)
* If you cannot load the library, you can install it where (you have a permission) you can install

Log
```
masaomi@fgcz-h-176:~$ module load Dev/R/4.2.0

The following have been reloaded with a version change:
  1) Dev/R/4.1.2 => Dev/R/4.2.0

masaomi@fgcz-h-176:~$ R -q -e "R.version.string; .libPaths(); library(SNPRelate)"
> R.version.string; .libPaths(); library(SNPRelate)
[1] "R version 4.2.0 (2022-04-22)"
[1] "/misc/GT/analysis/florian/R_LIBS"
[2] "/misc/ngseq10/packages/Dev/R/4.2.0/lib/R/library"
Error in library(SNPRelate) : there is no package called ???SNPRelate???
Execution halted
masaomi@fgcz-h-176:~$ module load Dev/R/4.1.2

The following have been reloaded with a version change:
  1) Dev/R/4.2.0 => Dev/R/4.1.2

masaomi@fgcz-h-176:~$ R -q -e "R.version.string; .libPaths(); library(SNPRelate)"
> R.version.string; .libPaths(); library(SNPRelate)
[1] "R version 4.1.2 (2021-11-01)"
[1] "/misc/GT/analysis/florian/R_LIBS"
[2] "/misc/ngseq10/packages/Dev/R/4.1.2/lib/R/library"
Loading required package: gdsfmt
SNPRelate -- supported by Streaming SIMD Extensions 2 (SSE2)

```

Log
```
masaomi@fgcz-h-176:~$ R

R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"

> if (!require("BiocManager", quietly = TRUE))
+     install.packages("BiocManager")
Bioconductor version 3.15 (BiocManager 1.30.18), R 4.2.0 (2022-04-22)
> BiocManager::install("SNPRelate")
...
installing to /misc/GT/analysis/florian/R_LIBS/00LOCK-SNPRelate/00new/SNPRelate/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (SNPRelate)
```

Log
```
masaomi@fgcz-h-176:~$ R -q -e "R.version.string; .libPaths(); library(SNPRelate)"
> R.version.string; .libPaths(); library(SNPRelate)
[1] "R version 4.2.0 (2022-04-22)"
[1] "/misc/GT/analysis/florian/R_LIBS"
[2] "/misc/ngseq10/packages/Dev/R/4.2.0/lib/R/library"
Loading required package: gdsfmt
SNPRelate -- supported by Streaming SIMD Extensions 2 (SSE2)
```
# 13-15 June 2022, Embeding pca & phylogenetic analysis in the app, Flo
@ Masa thanks that makes things clearer!
 
* Altering the R app and the markdwon template accordingly   
   So far the pca analysis works, but the ggplots are not displayed properly
    
```   
fvetsc@fgcz-h-176:/srv/GT/analysis/florian$
$R
BiocManager::install("fastreeR", lib="/misc/GT/analysis/florian/R_LIBS")
```
With the R library fastreeR phylogenetic trees can directly be created from vcf files

## Questions:  
* The analysis all works only the plots are not displayed properly.
* I am not sure yet which parts of the Flo.R app that are based on the vcf stats app I can delete. I tried to delete the block that runs the vcf stats command line programm but got an error when trying to run the altered app  
    
## Answers:
* I have updated /srv/GT/analysis/florian/ezRun/R/app-Flo. Please check: https://github.com/flo-v/ezRun/commit/3e53251dfad562eefc44ac52b8906a57dd29cdb2 
* *00index_files* folder is generated when you use *ggplot* or *plot* function for figures, except for *plotly*, but you missed copying it to the result folder (*vcf_stats*), and that is why the figure was not shown

