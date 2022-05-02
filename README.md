# SUSHI_labrotation

Table of Contents
=================

 * [26 Apr\. 2022, Kick\-off meeting, Florian \+ Masa](#26-apr-2022-kick-off-meeting-florian--masa)
 * [27-29 Apr\. 2022, get sushi test instance working for Flo](#27-29-apr-2022-get-sushi-test-instance-working-for-flo)

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
4. Confirm by clickin DataSet in menu
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
fvetsc@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426/master/
$ source /usr/local/ngseq/etc/lmod_profile
$ module load Dev/Ruby/3.0.3
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```
Then started VPN and accessed http://fgcz-c-047.uzh.ch:5000:  
Page loads but login to BFabric account doesn't work.   
Error message: "We're sorry, but something went wrong."

So I killed the process and logged off

### Questions/problems:
* ~~what is the adress for the ssh connection to the server again? maybe I got somthing wrong?~~

* ~~when starting the VPN access to http://fgcz-c-047.uzh.ch:5000 doesn't work~~
* after having done everything in the log above and started VPN to access http://fgcz-c-047.uzh.ch:5000 : page loads but login to BFabric account doesn't work. Error message: "We're sorry, but something went wrong."
