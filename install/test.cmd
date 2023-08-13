@ECHO OFF
chcp 65001
set temp=1
set temp1=2
if %temp%==1 if %temp1%==2 echo 11111

set app=false
set gamefolder=false
set PMfolder=false
if exist .\Calabiyau.exe set app=true
if exist .\Game set gamefolder=true
if exist .\PM set PMfolder=true
