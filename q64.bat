@echo off
rem �л������ļ������̷����磺  d:
%~d0
rem ���뱾�ļ�����Ŀ¼���磺 cd d:\tick
cd %~dp0
rem ����QHOME������%~dp0 Ϊ��ǰ�������ļ���·����
set QHOME=%~dp0q
start "5001" %QHOME%\w64\q.exe -p 5001 -U %QHOME%\qusers


