@echo off
rem �л������ļ������̷����磺  d:
%~d0
rem ���뱾�ļ�����Ŀ¼���磺 cd d:\kdb
cd %~dp0
set SSL_VERIFY_SERVER=NO
set KX_VERIFY_SERVER=NO
rem ����QHOME������%~dp0 Ϊ��ǰ�������ļ���·����
set QHOME=%~dp0q
start "5002" %QHOME%\w64\q.exe -p 5002


