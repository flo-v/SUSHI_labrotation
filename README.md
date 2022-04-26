# SUSHI_labrotation

## 26 Apr. 2022, Kick-off meeting, Florian + Masa

ToDo/Done
1. ~~Making a git repository~~
2. ~~Fork SUSHI repository~~
3. ~~Fork ezRun repository~~
4. Demo local SUSHI instance on fgcz-c-047.uzh.ch
5. Test local instance access, job submission

Log
```
22-04-26 14:26 masaomi@fgcz-c-047: mkdir /srv/kenlab/flo

22-04-26 14:29 masaomi@fgcz-c-047:/srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426
$ tar zxvf flo_sushi_20220426.tgz
$ cd flo_sushi_20220426/master/
$ bundle exec rails s -e production -b fgcz-c-047.uzh.ch -p 5000
```

Then
* start VPN
* access http://fgcz-c-047.uzh.ch:5000

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

To check the process
```
$ ps aux |grep rails
masaomi  16798 20.6  0.0 321176 125024 pts/58  Sl+  14:49   0:04 /misc/ngseq10/packages/Dev/Ruby/3.0.3/bin/ruby script/rails s -e production -b fgcz-c-047.uzh.ch -p 5000
$ kill -9 16798
```



Note
* /srv/kenlab/masa/2022/UZH/Masa/test_sushi_20220426/flo_sushi_20220426.tgz



