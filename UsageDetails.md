The library can be used in 3 to 4 ways as described below.

# Pre-requisites #

  * Sikuli X installed.
  * Any needed class path & system path environment variables set up (see Sikuli website and various online postings about path issues)
  * Good idea to verify Sikuli working for you, via Sikuli IDE, etc.
  * On Mac and Linux, additional installation of OpenCV, see this blog post: http://selesik.blogspot.com/2011/12/how-to-integrate-sikuli-in-selenium.html

# Command-line use #

Run command like follows:

> `java -cp .;sikuli-script.jar org.robotframework.remotelibrary.SikuliLibrary command [parameters]`

or if you package everything into a single JAR (untested by me, see later section)

> `java -jar sikuliLibrary.jar command [parameters]`

Run without command and subsequent parameters to get a display of the available commands and usage details.

**NOTE:** commands return a return code of 0 (false/fail) or 1 (true/pass), which can be used by the external calling script or application (for integration use) to determine pass/fail status. Commands also output similar info to standard output.

The following is a Windows command line example:

```
F:\projects\sikulilibrary\bin>echo %errorlevel%
0

F:\projects\sikulilibrary\bin>java -cp sikuli-script.jar;. org.robotframework.re
motelibrary.SikuliLibrary hover c:\Temp\startMenu.png
[info] Windows utilities loaded.
Hovering over object c:\Temp\startMenu.png
[info] Sikuli vision engine loaded.

F:\projects\sikulilibrary\bin>echo %errorlevel%
1

F:\projects\sikulilibrary\bin>java -cp sikuli-script.jar;. org.robotframework.re
motelibrary.SikuliLibrary hover c:\Temp\nonExistentObject.png
[info] Windows utilities loaded.
Hovering over object c:\Temp\nonExistentObject.png
[info] Sikuli vision engine loaded.
[info] Text Recognizer inited.
Failed to hover over object c:\Temp\nonExistentObject.png
Here's a stack dump of the caught exception for more details of failure...
FindFailed: can not find c:\Temp\nonExistentObject.png
Line ?, in File ?
        at org.sikuli.script.Region.handleFindFailed(Region.java:349)
        at org.sikuli.script.Region.wait(Region.java:420)
        at org.sikuli.script.Region.find(Region.java:308)
        at org.sikuli.script.Region.getLocationFromPSRML(Region.java:856)
        at org.sikuli.script.Region.hover(Region.java:529)
        at org.robotframework.remotelibrary.SikuliLibrary.hover_over_object(Siku
liLibrary.java:238)
        at org.robotframework.remotelibrary.SikuliLibrary.main(SikuliLibrary.jav
a:358)

F:\projects\sikulilibrary\bin>echo %errorlevel%
0
```

The echoes provide an example of the return code you would get from the Windows command line shell for which can be used in batch files/scripts (or other scripting platforms, though the return code for those is not referenced as "errorlevel").

In the echoes in the example, the first echo shows default shell state, second echo shows that return code is 1 for the previous Sikuli command call, meaning that the command executed successfully on acting against the specified object. The third echo shows return code of 0 for prior Sikuli command call, meaning that command failed to act on the specified object.

# API use #

Nothing to really document here. You just include the class in your Java code/project and call the class methods as needed.

Javadoc documentation soon to come.

# Use with Robot Framework as test library #

See RobotFrameworkIntegration page.

# Use with XML-RPC (server) #

See UseWithXmlRpc page.

# Packaging SikuliLibrary into a JAR #

Could be done for easier Robot Framework integration (as remote library or just Java library), or for easier command line execution, or easier deployment as XML-RPC server.

**NOTE:** this packaging currently not tested.

> `cd bin`

> `#add your test libraries within this bin folder structure if not already`

> `#Extract the bundled jars`

> `jar xf sikuli-script.jar`

> `#Create the new jar containing everything. Something like this (untested):`

> `jar cvfe sikuliLibrary.jar org/robotframework/remotelibrary/SikuliLibrary org/ sikuli/`