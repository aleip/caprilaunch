echo %PATH%
echo %USERDOMAIN%\%USERNAME%
echo %cd%
cd gui
echo %cd%
PATH=jars;%PATH%
java -Xmx1G -Xverify:none -XX:+UseParallelGC -XX:PermSize=20M -XX:MaxNewSize=32M -XX:NewSize=32M -Djava.library.path=jars -classpath jars\gig.jar de.capri.ggig.BatchExecution  jenkins.ini capri_gui_definition.xml batchfiles\build_database_and_baseline.txt