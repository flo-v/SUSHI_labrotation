# Clean_log SUSHI labrotation
A cleaner version of the labrotation log, that reduces redundancies  
Can be of use for the next person building on sushi


Table of Contents
=================

* [Setup and test running apps](#setup-and-test-running-apps)
* [Creating new apps](#creating-new-apps)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go)  
  
Cheat Sheet
* https://docs.google.com/document/d/1wTNdJgTzK7J54p90yH-djF5L_4VUwl64JknVmSCNxCE

## Setup and test running apps

### Setting up basics

1. Get windows subsystem (or any other way to use bash commands on local mashine)
2. Create personal Github account (if not already existing)
3. Making a git repository, for the lab rotation
4. Fork SUSHI repository
5. Fork ezRun repository
6. Connect Git Repos via ssh with local mashine (https://www.linuxfordevices.com/tutorials/linux/connect-to-github-with-ssh)

@ Masa what did you have to do permission wise to let me use the servers? on the first meeting and then with the second in person meeting


@ Masa what permission did you have to give me for the functional genomics server?

### Instaling ezRun on functional genomics server
```
ssh fvetsc@fgcz-genomics.uzh.ch
$ vim ~/.Rprofile
.libPaths("/srv/GT/analysis/florian/R_LIBS")
$ cd /srv/GT/analysis/florian/

# clone ezRun fork into directory, for this we need to generate a ssh key again
$ ls -al ~/.ssh # check if key is existing, creating a new one anyway
$ ssh-keygen -t ed25519 -C "flo-v@Github"
# press enter to save at default location
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
$ cat ~/.ssh/id_ed25519.pub # copy the key from output
# adding key on Github.com
$ git clone git@github.com:flo-v/ezRun.git

$ R CMD INSTALL /srv/GT/analysis/florian/ezRun
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



### Running sushi on kenlab server
```
ssh fvetsc@fgcz-c-047.uzh.ch # from local command line
fvetsc@fgcz-c-047: 
$ mkdir /srv/kenlab/flo
$ /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ cd /srv/kenlab/flo

@ Masa what is flo_sushi_20220510.tgz a copy of?

$ cp -r /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220510.tgz .
$ tar zxvf flo_sushi_20220510.tgz
```
#### Executing sushi steps
```
$ cd flo_sushi_20220510/master/
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
Start VPN and accessed http://fgcz-c-047.uzh.ch:5000: (5000 or whatever number defined in rails execution)   
Logging in with username  
Run analysis on data:
1. Select project 1535 ((if data-to-be-analyzed is already loaded in sushi skip directly to step 4)
2. gStore-ventricles_100k-test_masa_dataset.tsv (or other data; download, if not already done)
3. Import-Browse-test_masa_dataset.tsv-DataSet (or use other data), define Name:xxxx-load dataset
4. Confirm by clickin DataSet in menu
5. Click test_dataset with given name xxxx (Applications - refresh if you cannot see the application buttons)
6. Select whatever application you want (here FastQCApp), and submit
7. Wait for some minutes, and check the result (by clicking on DataSets once again)


## Creating new apps

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



























