@ECHO OFF
chcp 65001
echo 请确认你执行文件的位置在卡拉比丘游戏目录"CalabiyauGame"之下
:search

set app=false
set gamefolder=false
set PMfolder=false
if exist .\Calabiyau.exe set app=true
if exist .\Game set gamefolder=true
if exist .\PM set PMfolder=true

if %app%==true if %gamefolder%==true set type=1
if %app%==true if %PMfolder%==true set type=2
if %app%==false if %gamefolder%==false set type=0

if %type%==0 (
    set /p loc=未找到游戏目录，请手动输入文件目录，请确保目录下有名为"PM"的文件夹
    cd /d %loc%
    goto search
)

:videoVar
echo 选择你需要下载的视频，用数字表示，使用github为下载源如果遇到错误请重新启动此cmd下载
echo 1=原神
echo 2=APEX
echo 3=崩坏:星穹铁道
set /p video=请输入数字：


:download
md videoTemp
echo 下载已经开始，下载源为github可能出现下载失败的情况，程序会尝试多次下载，请耐心等待
if %video%==2 (
    powershell wget "https://github.com/seven7a/calabiyau_logo_replace/raw/master/video/APEXlogo00007238.mp4" -OutFile .\videoTemp\IDreamSky_Logo_PC.mp4
    powershell wget "https://github.com/seven7a/calabiyau_logo_replace/raw/master/video/APEXlogo00007418.mp4" -OutFile .\videoTemp\TX_LOGO_PC.mp4
) ELSE if %video%==1 (
    powershell wget "https://github.com/seven7a/calabiyau_logo_replace/raw/master/video/genshinlogo00000570.mp4" -OutFile .\videoTemp\IDreamSky_Logo_PC.mp4
    powershell wget "https://github.com/seven7a/calabiyau_logo_replace/raw/master/video/genshinlogo00000872.mp4" -OutFile .\videoTemp\TX_LOGO_PC.mp4
) ELSE if %video%==3 (
    powershell wget "https://github.com/seven7a/calabiyau_logo_replace/raw/master/video/raillogo00000345.mp4" -OutFile .\videoTemp\IDreamSky_Logo_PC.mp4
    powershell wget "https://github.com/seven7a/calabiyau_logo_replace/raw/master/video/raillogo00000525.mp4" -OutFile .\videoTemp\TX_LOGO_PC.mp4
) ELSE (
    echo 输入可能有误？没有找到此视频
    goto videoVar
)

if NOT exist .\videoTemp\IDreamSky_Logo_PC.mp4 goto download
if NOT exist .\videoTemp\TX_LOGO_PC.mp4 goto download

if %type%==1 (
    echo 检测到您的游戏安装方式为默认目录
    xcopy .\videoTemp\IDreamSky_Logo_PC.mp4 .\Game\PM\Content\Movies\Logos\ /y
    xcopy .\videoTemp\TX_LOGO_PC.mp4 .\Game\PM\Content\Movies\Logos\ /y
)
if %type%==2 (
    echo 检测到您的游戏安装方式为自定义目录
    xcopy .\videoTemp\IDreamSky_Logo_PC.mp4 .\PM\Content\Movies\Logos\ /y
    xcopy .\videoTemp\TX_LOGO_PC.mp4 .\PM\Content\Movies\Logos\ /y
)

del .\videoTemp\ /f /s /q
rd videoTemp

echo ***********   *         *
echo *         *   *      *
echo *         *   *   *
echo *         *   * *
echo *         *   *   *
echo *         *   *     *
echo *         *   *       *
echo ***********   *         *
echo 程序已完成，你可以运行游戏检查是否已经替换成功