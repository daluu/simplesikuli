rem pre-requisites: 
rem Sikuli X installed and class path references set up
rem to compile:
rem javac -cp .;sikuli-script.jar -d bin src
rem to execute command line interface:
rem java -cp .;sikuli-script.jar org.robotframework.remotelibrary.SikuliLibrary
rem to package as a single JAR (untested):
rem cd bin
rem add your test libraries within this bin folder structure if not already
rem Extract the bundled jars
rem jar xf sikuli-script.jar
rem Create the new jar containing everything
rem jar cvfe sikuliLibrary.jar org/robotframework/remotelibrary/SikuliLibrary org/ sikuli/