@ECHO OFF
chcp 65001
echo 请确认你执行文件的位置在卡拉比丘游戏目录"CalabiyauGame"之下，如果是请按任意键继续，如果不是请关闭此窗口后在正确的目录下执行
if NOT exist .\Calabiyau.exe set app=true
