# Introduction #

This page documents how to use this SikuliLibrary with Robot Framework. There are 2 methods, both described below. As well as a test case sample demonstrating how to use the library.

**NOTE:** that for Robot Framework integration with Sikuli, it is assumed you are already familiar with [Robot Framework](http://www.robotframework.org) and perhaps you should already have read the following article for background reference:

http://blog.mykhailo.com/2011/02/how-to-sikuli-and-robot-framework.html

# As native Java library with Robot Framework via Jython or JAR file #

In theory, should be able to use with Robot Framework via Jython & Jybot or the all-in-one packaged Robot Framework JAR requiring only Java.

To use the library in either case:

  * Deploy the class file with its folder structure "org/robotframework/remotelibrary/SikuliLibrary.class" relative to your test suite. That is, org folder is in same folder as or in lib folder under test suite folder.
  * Place a copy of sikuli-script.jar from the Sikuli install location to your test suite local path (same folder or a lib folder).

You may also opt to package SikuliLibrary and sikuli-script.jar together or together with the Robot Framework JAR. The [Robot Framework Java Integration](http://code.google.com/p/robotframework/wiki/JavaIntegration) may be helpful for doing that.

## Using with Jybot and Robot Framework installation ##

  1. Set classpath, if needed, to include test suite local path, or path to org.robotframework.remotelibrary.SikuliLibrary and path to sikuli-script.jar.
  1. Run your Robot Framework test that calls SikuliLibrary with Jybot. No special parameters required.

As an example, for setting classpath on Windows from command line, assuming you put the library files in same folder as test suite:

> `set classpath=.;%CLASSPATH%;sikuli-script.jar`

**NOTE:** depending on what the value of CLASSPATH already is before setting, you may or may not need the semicolon right after %CLASSPATH%, and you might not need to append the local path "." if it's already there.

## Using with Robot Framework JAR ##

  1. Set class path and execute Robot Framework test all in one step.

Steps here are similar to the Jybot method with one exception, class path search order matters here. So set RF Jar as first in class path reference, before others like this on Windows:

> `java -cp robotframework-2.5.7.jar:sikuli-script.jar:. org.robotframework.RobotFramework demo.tsv`

Otherwise, you will get exceptions about not being able to find or import robot or robotframework, etc.

## Import Java library to Robot Framework test suite ##

|Setting|Value|
|:------|:----|
|Library|org.robotframework.remotelibrary.SikuliLibrary|

# As (native) Java remote library #

This has only been tested with the pure Java remote library server. Using as Java remote library over Jython (via Python remote library server executed over Jython) will be similar the other method of using as native Java library with Robot Framework (via Jython).

**NOTE:** that for this method, you run the Java remote library server with Sikuli on the machine where Sikuli will run. You then make calls to Sikuli remotely via Robot Framework running on another machine or same machine.

See [Java remote library server usage details](http://code.google.com/p/jrobotremoteserver/wiki/RemoteServerDetails) for an overview first.

To use with SikuliLibrary, you simply add sikuli-script.jar to the classpath, and replace the ExampleLibrary as library parameter value with:

> `org.robotframework.remotelibrary.SikuliLibrary`

and place a copy of the SikuliLibrary class file (or perhaps JAR equivalent) to the remote server working directory (where ExampleLibrary also resides).

For the classpath reference, I put a copy of sikuli-script.jar in local path of the Java remote library server and added classpath reference to it. You could alternatively use classpath reference to the Sikuli JAR's installation directory under Program Files, etc. (untested by me).

I won't go over how to execute Robot Framework tests using the remote library but here's an example of how to use the remote library in the test suite:

## Import remote library to Robot Framework test suite ##

|Setting|Value|Value|Value|
|:------|:----|:----|:----|
|Library|Remote|http://localhost:8270|#Replace localhost & port as needed|

This is also assuming you've started the remote server per the previous section.

# Example usage of library in Robot Framework test cases #

|Test Case|Action|Argument|Argument|Argument|
|:--------|:-----|:-------|:-------|:-------|
|Sikuli Library Demo|${result}=|Object Exists|C:\\Temp\\startMenu.png|${60}|
|  |Should Be True|${result}|# verify object detected|  |
|  |${result}=|Hover Over Object|C:\\Temp\\nonExistentObject.png|# try hover over object|
|  |Should Not Be True|${result}|# verify previous command failed|  |

**NOTE:** If you want exceptions for test failure rather than checking true/false for pass/fail, then remove exception handling from SikuliLibrary methods, and modifying methods to "throws FindFailedException" or your own custom exception.