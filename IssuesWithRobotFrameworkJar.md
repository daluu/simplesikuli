**This page now obsolete, found fix. See RobotFrameworkIntegration page.**

Following [Robot Framework Java Integration](http://code.google.com/p/robotframework/wiki/JavaIntegration) procedures, I still can't get it to work. Good thing the Jython + Robot Framework (Python install) method works.

Anybody have some input on this? Do let me know if you are able to get it to work, and/or what my problem might be.

Here's what I've found so far.

Note that all this trial & error is done on Windows environment, though assume may run into similar issues on Linux and Mac. And on Windows, Sikuli X installed to default location & class paths, and put a copy of Sikuli Jar to same path as Robot Framework Jar.

Here are the type of classpath errors I get trying to run some tests:

```
D:\projects>java -cp .;sikuli-script.jar;robotframework-2.5.7.jar org.robotframework.RobotFramework demo.tsv
Exception in thread "main" Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named robot

D:\projects>java -Xbootclasspath/a:.;sikuli-script.jar -jar robotframework-2.5.7.jar demo.tsv
Exception in thread "main" Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named robot

D:\projects>java -cp .:sikuli-script.jar:robotframework-2.5.7.jar org.robotframework.RobotFramework demo.tsv
Exception in thread "main" java.lang.NoClassDefFoundError: org/robotframework/RobotFramework
Caused by: java.lang.ClassNotFoundException: org.robotframework.RobotFramework
        at java.net.URLClassLoader$1.run(Unknown Source)
        at java.security.AccessController.doPrivileged(Native Method)
        at java.net.URLClassLoader.findClass(Unknown Source)
        at java.lang.ClassLoader.loadClass(Unknown Source)
        at sun.misc.Launcher$AppClassLoader.loadClass(Unknown Source)
        at java.lang.ClassLoader.loadClass(Unknown Source)
Could not find the main class: org.robotframework.RobotFramework.  Program will exit.
```

And if I run

> `D:\projects>java -Xbootclasspath/a:.:sikuli-script.jar -jar robotframework-2.5.7.jar demo.tsv`

or

> `java -cp .;sikuli-script.jar -jar robotframework-2.5.7.jar demo.tsv`

I run into the following type of error:

> `java.lang.NoClassDefFoundError: org/sikuli/script/Screen`
> > `at`

> `org.robotframework.remotelibrary.SikuliLibrary.object_exists(SikuliLibrary.java:49)`

Also didn't help trying to set %CLASSPATH% in command line before executing Robot Framework test, same results.

So would be helpful if someone in the community can help me figure out how to properly reference Sikuli in class path and execute a sample test with this SikuliLibrary using the Robot Framework JAR method.