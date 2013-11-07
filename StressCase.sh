#!/bin/sh

help(){
cat <<EOF
++++          +        +     +
+    +       + +          +
+  +        +++++         +
+    +     +     +        +
2013 10-22, Create the stress cases for WMTA-178GN to try out find some bugs. 
2013 10-28, Add some cases.
2013 11-06, Modify some cases.
2013 11-07, Modify "for loop" description.

Usage:
- OnMsg: OnMsg
- OffMsg: OffMsg
- OnMoveMsgToHere: OnMoveMsgToHere
- OffMoveMsgToHere: OffMoveMsgToHere
- HW_D_002: HW_D_002 count(no functionality in 0.0.4.4 until the new version release.)
- HW_D_003: HW_D_003 count(no functionality in 0.0.4.4 until the new version release.)
- SW_001: SW_001 count(need the stable WIFI APs env.)
- SW_002: SW_002 count(it works in 0.0.4.4)
- SW_003: SW_003 count(it works in 0.0.4.4)
- SW_004: SW_004 count(it works in 0.0.4.4)
- SW_005: SW_005 count(it works in 0.0.4.4)
- SW_006: SW_006 count(it works in 0.0.4.4)
- SW_007: SW_007 count(it works in 0.0.4.4)
- SW_008: SW_008 count(no functionality in 0.0.4.4 until the new version release.)
- SW_009: SW_009 count(no functionality in 0.0.4.4 until the new version release.)
- SW_010: SW_010 count(no functionality in 0.0.4.4 until the new version release.)
EOF
}

OnMsg(){
touch /var/alimain/log/all
}

OffMsg(){
rm /var/alimain/log/all
}

OnMoveMsgToHere(){
    HERE=$(pwd)
    namepatch=$(date +%Y%m%d%H%M%S)
    touch $HERE/alimain_$namepatch.log
    echo $HERE/alimain.log > /var/alimain/logout
}

OffMoveMsgToHere(){
    echo /dev/console > /var/alimain/logout
}


TAG="SQA:"

getFWVersion()
{
    VER=$(cat /etc/version)
    echo -e "$TAG ALI SW $VER"
}

getThisVer()
{
    echo -e "$TAG Tool Version 0.6 2013-11-07"
}

HW_D_002(){
echo "$TAG HW_D_002 START"
COUNTER=0
getThisVer
getVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
while [ $COUNTER -lt "$@" ]; do
    echo $TAG The counter is $COUNTER
    time1=$(date)
    echo -e "$TAG $time1"
    echo -e "$TAG INDEX PAGE"
    sleep 0.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 5.000

    echo -e "$TAG INDEX PAGE"
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 6.000
    echo -e "$TAG Press Power button"
    echo KEY_IN:POWER > /tmp/robot_receiver
    echo -e "$TAG In Suspend"
    sleep 6.000
    echo -e "$TAG Press Power button again"
    echo KEY_IN:POWER > /tmp/robot_receiver
    echo -e "$TAG In Resume"
    sleep 5.000
    let COUNTER=COUNTER+1
    time2=$(date)
    echo -e "$TAG $time2"
    done  
echo "$TAG Done HW_D_002"  
}


HW_D_003(){
echo "$TAG HW_D_003 START"
COUNTER=0
getThisVer
getVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
while [ $COUNTER -lt "$@" ]; do
    echo $TAG The counter is $COUNTER
    time1=$(date)
    echo -e "$TAG $time1"
    echo -e "$TAG INDEX PAGE"
    sleep 0.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 5.000

    echo -e "$TAG Channel 20"
    echo KEY_IN:20 > /tmp/robot_receiver
    sleep 20.000
    echo -e "$TAG Press Power button"
    echo KEY_IN:POWER > /tmp/robot_receiver
    echo -e "$TAG In Suspend"
    sleep 6.000
    echo -e "$TAG Press Power button again"
    echo KEY_IN:POWER > /tmp/robot_receiver
    echo -e "$TAG In Resume"
    sleep 5.000
    let COUNTER=COUNTER+1
    time2=$(date)
    echo -e "$TAG $time2"
    done    
echo "$TAG Done HW_D_003"
}

SW_001(){
echo "$TAG SW_001 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."

time0=$(date)
echo -e "$TAG $time0"
echo -e "$TAG INDEX PAGE"
sleep 0.0
echo KEY_IN:INDEX > /tmp/robot_receiver
sleep 2.0
echo KEY_IN:INDEX > /tmp/robot_receiver
sleep 2.0
echo KEY_IN:INDEX > /tmp/robot_receiver
sleep 9.598
	
echo -e "$TAG SETTING PAGE"
echo KEY_IN:SETTING > /tmp/robot_receiver
sleep 10.764
echo -e "$TAG GO TO WIFI PAGE"
echo KEY_IN:OK > /tmp/robot_receiver
sleep 20.212


while [ $COUNTER -lt "$@" ]; do
    echo $TAG The counter is $COUNTER
    time1=$(date)
    echo -e "$TAG $time1"
    
    echo -e "$TAG SHOW the WIFI SITE SURVEY"
    echo -e "$TAG SELECT the first one AP in the list."
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 5.700	
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 2.515
    echo -e "$TAG GO Back button"
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 2.580
    echo -e "$TAG SELECT the second one AP in the list."
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 2.484
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 2.36
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 2.404
    echo -e "$TAG GO Back button"
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 2.580


    sleep 5.000
    let COUNTER=COUNTER+1
    time2=$(date)
    echo -e "$TAG $time2"
    done
echo "$TAG Done SW_001"
}

SW_002(){
echo "$TAG SW_002 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
while [ $COUNTER -lt "$@" ]; do
    echo $TAG The counter is $COUNTER
    time1=$(date)
    echo -e "$TAG $time1"
    echo -e "$TAG INDEX PAGE"
    sleep 0.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 9.598
	
    echo -e "$TAG SETTING PAGE"
    echo KEY_IN:SETTING > /tmp/robot_receiver
    sleep 4.386
    echo KEY_IN:RIGHT > /tmp/robot_receiver
    sleep 2.914
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 4.584
	
    echo -e "$TAG LANGUAGE PAGE"
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 1.600
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 2.140
    echo KEY_IN:UP > /tmp/robot_receiver
    sleep 1.484
    echo KEY_IN:UP > /tmp/robot_receiver
    sleep 1.527
    echo KEY_IN:UP > /tmp/robot_receiver
    sleep 1.403
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 1.520
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 1.211
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 2.413
    echo KEY_IN:UP > /tmp/robot_receiver
    sleep 1.414
    echo KEY_IN:UP > /tmp/robot_receiver
    sleep 1.535
    echo KEY_IN:UP > /tmp/robot_receiver
    sleep 2.823
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 1.399
    echo KEY_IN:DOWN > /tmp/robot_receiver
    sleep 9.509
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 6.309
	
    echo KEY_IN:INDEX > /tmp/robot_receiver
    echo -e "$TAG LANGUAGE PAGE"
    sleep 5.000
    let COUNTER=COUNTER+1
    time2=$(date)
    echo -e "$TAG $time2"
    done
echo "$TAG Done SW_002"
}

SW_003(){
echo "$TAG SW_003 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
while [ $COUNTER -lt "$@" ]; do
    echo $TAG The counter is $COUNTER
    time1=$(date)
    echo -e "$TAG $time1"
    echo -e "$TAG INDEX PAGE"
    sleep 0.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:INDEX > /tmp/robot_receiver
    sleep 9.598
	
    echo -e "$TAG Channel 0"
    echo KEY_IN:0 > /tmp/robot_receiver
    sleep 1.605
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 11.755
    echo -e "$TAG Channel 1"
    echo KEY_IN:1 > /tmp/robot_receiver
    sleep 2.332
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 6.920	
    echo -e "$TAG Channel 2"
    echo KEY_IN:2 > /tmp/robot_receiver
    sleep 2.0
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 5.348
    echo -e "$TAG Channel 3"
    echo KEY_IN:3 > /tmp/robot_receiver
    sleep 1.306
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 4.974
    echo -e "$TAG Channel 4"
    echo KEY_IN:4 > /tmp/robot_receiver
    sleep 1.398
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 9.998
    echo -e "$TAG Channel 5"
    echo KEY_IN:5 > /tmp/robot_receiver
    sleep 9.100
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 11.760
    echo -e "$TAG Channel 6"
    echo KEY_IN:6 > /tmp/robot_receiver
    sleep 1.433
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 5.185
    echo -e "$TAG Channel 7"
    echo KEY_IN:7 > /tmp/robot_receiver
    sleep 1.209
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 4.795
    echo -e "$TAG Channel 8"
    echo KEY_IN:8 > /tmp/robot_receiver
    sleep 1.150
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 4.196
    echo -e "$TAG Channel 9"
    echo KEY_IN:9 > /tmp/robot_receiver
    sleep 1.104
    echo KEY_IN:ENTER > /tmp/robot_receiver
    sleep 4.91
	
    echo -e "$TAG INDEX PAGE"
    echo KEY_IN:INDEX > /tmp/robot_receiver
    echo "$TAG Done it" 
    sleep 5.000
    let COUNTER=COUNTER+1
    time2=$(date)
    echo -e "$TAG $time2"
    done

echo "$TAG Done SW_003"
}


SW_004(){
echo "$TAG SW_004 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
time1=$(date)
echo -e "$TAG $time1"
s=3
#for (( i=1; i<=$s; i=i+1 ))
for i in `seq 1 $s`
do
     echo -e "$TAG INDEX PAGE($i/$s)"
     sleep 0.0
     echo KEY_IN:INDEX > /tmp/robot_receiver
     sleep 5.598
done
	
echo -e "$TAG Channel 021"
echo KEY_IN:0 > /tmp/robot_receiver
sleep 0.632
echo KEY_IN:2 > /tmp/robot_receiver
sleep 0.588
echo KEY_IN:1 > /tmp/robot_receiver
sleep 2.643	
echo KEY_IN:ENTER > /tmp/robot_receiver
echo -e "$TAG Waiting...Buffering Content"
sleep 30.000
    
while [ $COUNTER -lt "$@" ]; do
    time2=$(date)
    echo -e "$TAG $time2"
    echo $TAG The counter is $COUNTER
    echo -e "$TAG Open menu"
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 3.491
    echo KEY_IN:RIGHT > /tmp/robot_receiver
    sleep 3.491
    echo KEY_IN:RIGHT > /tmp/robot_receiver
    sleep 3.491
    echo -e "$TAG Select one"
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 15.998
    echo -e "$TAG Open menu again"
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 3.491
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 3.491
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 3.491
    echo -e "$TAG Select one again"
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 15.998
    let COUNTER=COUNTER+1
    time3=$(date)
    echo -e "$TAG $time3"
    done

echo "$TAG Done SW_004"
}

SW_005(){
echo "$TAG SW_005 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."

time1=$(date)
echo -e "$TAG $time1"
s=3
#for (( i=1; i<=$s; i=i+1 ))
for i in `seq 1 $s`
do
     echo -e "$TAG INDEX PAGE($i/$s)"
     sleep 0.0
     echo KEY_IN:INDEX > /tmp/robot_receiver
     sleep 5.598
done
	
echo -e "$TAG Channel 021"
echo KEY_IN:0 > /tmp/robot_receiver
sleep 0.632
echo KEY_IN:2 > /tmp/robot_receiver
sleep 0.588
echo KEY_IN:1 > /tmp/robot_receiver
sleep 2.643	
echo KEY_IN:ENTER > /tmp/robot_receiver
echo -e "$TAG Waiting...Buffering Content"
sleep 30.000

while [ $COUNTER -lt "$@" ]; do
    echo $TAG The counter is $COUNTER
    time2=$(date)
    echo -e "$TAG $time2"
    echo -e "$TAG Pause the screen"
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 5.422
    echo KEY_IN:OK > /tmp/robot_receiver
    sleep 4.000
    let COUNTER=COUNTER+1
    time3=$(date)
    echo -e "$TAG $time3"
    done
echo "$TAG Done SW_005"
}

SW_006(){
echo "$TAG SW_006 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
time1=$(date)
echo -e "$TAG $time1"
s=3
#for (( i=1; i<=$s; i=i+1 ))
for i in `seq 1 $s`
do
     echo -e "$TAG INDEX PAGE($i/$s)"
     sleep 0.0
     echo KEY_IN:INDEX > /tmp/robot_receiver
     sleep 5.598
done
	
echo -e "$TAG Channel 021"
echo KEY_IN:0 > /tmp/robot_receiver
sleep 0.632
echo KEY_IN:2 > /tmp/robot_receiver
sleep 0.588
echo KEY_IN:1 > /tmp/robot_receiver
sleep 2.643	
echo KEY_IN:ENTER > /tmp/robot_receiver
echo -e "$TAG Waiting...Buffering Content"
sleep 30.000

echo -e "$TAG Pause the screen"
echo KEY_IN:OK > /tmp/robot_receiver
sleep 5.422

while [ $COUNTER -lt "$@" ]; do
    echo $TAG The counter is $COUNTER
    time2=$(date)
    echo -e "$TAG $time2"

    echo -e "$TAG Go forward"
    echo KEY_IN:RIGHT > /tmp/robot_receiver
    sleep 1.196
    echo KEY_IN:RIGHT > /tmp/robot_receiver
    sleep 0.801
    echo KEY_IN:RIGHT > /tmp/robot_receiver
    sleep 1.4
    echo -e "$TAG Go backward"
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 1.196
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 0.801
    echo KEY_IN:LEFT > /tmp/robot_receiver
    sleep 1.4
    let COUNTER=COUNTER+1
    time3=$(date)
    echo -e "$TAG $time3"
    done
echo "$TAG Done SW_006"
}

SW_007(){
echo "$TAG SW_007 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
time1=$(date)
echo -e "$TAG $time1"
s=3
#for (( i=1; i<=$s; i=i+1 ))
for i in `seq 1 $s`
do
     echo -e "$TAG INDEX PAGE($i/$s)"
     sleep 0.0
     echo KEY_IN:INDEX > /tmp/robot_receiver
     sleep 5.598
done
	
echo -e "$TAG Channel 021"
echo KEY_IN:0 > /tmp/robot_receiver
sleep 0.632
echo KEY_IN:2 > /tmp/robot_receiver
sleep 0.588
echo KEY_IN:1 > /tmp/robot_receiver
sleep 2.643	
echo KEY_IN:ENTER > /tmp/robot_receiver
echo -e "$TAG Waiting...Buffering Content"
sleep 30.000
    
while [ $COUNTER -lt "$@" ]; do
    time2=$(date)
    echo -e "$TAG $time2"
    echo $TAG The counter is $COUNTER
    
    tc=50
    #for (( i=1; i<=$tc; i=i+1 ))
    for i in `seq 1 $tc`
    do
        echo -e "$TAG Volume Up($i/$tc)"
        echo KEY_IN:VOLUME_UP > /tmp/robot_receiver
        sleep 1.4
    done

    #for (( i=1; i<=$tc; i=i+1 ))
    for i in `seq 1 $tc`
    do
        echo -e "$TAG Volume Down($i/$tc)"
        echo KEY_IN:VOLUME_DOWN > /tmp/robot_receiver
        sleep 1.4
    done

    let COUNTER=COUNTER+1
    time3=$(date)
    echo -e "$TAG $time3"
done

echo "$TAG Done SW_007"
}

SW_008(){
echo "$TAG SW_008 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
echo -e "$TAG ($COUNTER/\"$@\")"
time1=$(date)
echo -e "$TAG $time1"
s=3
#for (( i=1; i<=$s; i=i+1 ))
for i in `seq 1 $s`
do
     echo -e "$TAG INDEX PAGE($i/$s)"
     sleep 0.0
     echo KEY_IN:INDEX > /tmp/robot_receiver
     sleep 5.598
done	

echo "$TAG Done SW_008"
}

SW_009(){
echo "$TAG SW_009 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
echo -e "$TAG ($COUNTER/\"$@\")"
time1=$(date)
echo -e "$TAG $time1"
s=3
#for (( i=1; i<=$s; i=i+1 ))
for i in `seq 1 $s`
do
     echo -e "$TAG INDEX PAGE($i/$s)"
     sleep 0.0
     echo KEY_IN:INDEX > /tmp/robot_receiver
     sleep 5.598
done	

echo "$TAG Done SW_009"
}

SW_010(){
echo "$TAG SW_010 START"
COUNTER=0
getThisVer
getFWVersion

[ "$#" -ne 1 ] && echo "$TAG Miss an argument or too many arguments. Stop here."
echo -e "$TAG ($COUNTER/\"$@\")"
time1=$(date)
echo -e "$TAG $time1"
s=3
#for (( i=1; i<=$s; i=i+1 ))
for i in `seq 1 $s`
do
     echo -e "$TAG INDEX PAGE($i/$s)"
     sleep 0.0
     echo KEY_IN:INDEX > /tmp/robot_receiver
     sleep 5.598
done	

echo "$TAG Done SW_010 START"
}
