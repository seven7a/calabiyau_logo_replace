@ECHO OFF
chcp 65001
echo 请确认你执行文件的位置在卡拉比丘游戏目录"CalabiyauGame"之下，如果是请按任意键继续，如果不是请关闭此窗口后在正确的目录下执行
:search
set app=false
set gamefolder=false
set PMfolder=false
if exist .\Calabiyau.exe set app=true
if exist .\Game set gamefolder=true
if exist .\PM set PMfolder=true

if %app%==true if %gamefolder%==true set type=1
if %app%==true if %PMfolder%==true goto set type=2
if %app%==false if %gamefolder%==false goto set type=0

if %type%==0 (
    set /p loc=未找到游戏目录，请手动输入文件目录，请确保目录下有名为"PM"的文件夹
    cd /d %loc%
    goto search
)

echo 选择你需要下载的视频，用数字表示
echo 1=原神
echo 2=APEX
set /p video=请输入：

md videoTemp
if %video%==1 (
    powershell wget "https://mc-server-pack.oss-cn-hangzhou.aliyuncs.com/logo2.mp4" -OutFile .\videoTemp\TX_LOGO_PC.mp4
)

if %type%==1(
 echo 检测到您的游戏安装方式为默认目录

)