@echo off
rem �л������ļ������̷����磺  d:
%~d0
rem ���뱾�ļ�����Ŀ¼���磺 cd d:\kdb
cd %~dp0
set KX_VERIFY_SERVER=NO
set SSL_VERIFY_SERVER=NO

rem ����QHOME������%~dp0 Ϊ��ǰ�������ļ���·����
set QHOME=%~dp0\q

rem tickerplant         symָ��schema�ļ�Ϊtick/sym.q ;        ./dbָ��log��hdbĿ¼���ɸ�����Ҫ�޸�
start "tickerplant(5010)"  %QHOME%\w32\q.exe tick/tick.q sym -p 5010
ping 127.0.0.1 -n 1 -w 100 > nul

rem rdb   :5010 �� :5012 �ֱ�Ϊtickerplant��hdb�Ķ˿�
start "rdb(5011)"  %QHOME%\w32\q.exe tick/r.q :5010 :5012 -p 5011
ping 127.0.0.1 -n 1 -w 100 > nul

rem hdb
if not exist hdb md hdb
start "hdb(5012)" %~dp0\q\w32\q.exe hdb -p 5012 

rem ��Ʊ����ӿ�
start "csmd(5013)" %~dp0\q\w32\q.exe tick/csmd.q sym :5010 -p 5013

rem ctp�ڻ�����ӿ�
start "cfmd(5014)" %~dp0\q\w32\q.exe tick/cfmd.q sym :5010 -p 5014
cd %~dp0

