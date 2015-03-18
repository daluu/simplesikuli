# Introduction #

**NOTE:**  You may want to check out the forks of this project on Github, starting with: https://github.com/ljszalai/rfsikuli

This is a simple wrapper library interface to Sikuli's Java API, which also happens to expose a command line interface (CLI). It is simple in that it only wraps a subset of Sikuli's automation features, basically the most commonly used automation commands.

FYI, for those wondering, I made this library to avoid dependency on Python and Jython to use Sikuli. As well as avoid need to create "Sikuli" scripts. Since the core of Sikuli is in Java, and that's all that's minimally required to use Sikuli, why not just use it that way too. With the library, I can now use Sikuli from command line w/o needing to write any Sikuli scripts or I can integrate w/ XML-RPC or Robot Framework and also not have to write any Sikuli scripts, rather going directly with its APIs.

**NOTE:** I don't really intend to enhance the wrapper interface to support a greater subset of Sikuli or do more things. So will generally defer or ignore enhancement requests (or changes). If you need some missing functionality, feel free to do any of the following:

  * extend or modify the wrapper library as needed
  * use the native Sikuli Java API to do what you want (full API)
  * use Sikuli script and/or Jython, if you're not comfortable with Java
  * use the Jython/Python integration option for Robot Framework as documented [here](http://blog.mykhailo.com/2011/02/how-to-sikuli-and-robot-framework.html).

# Usage information #

See UsageDetails.

## Use with Robot Framework as test library ##

See RobotFrameworkIntegration page in particular.

# News #

  * 08/25/12 - This project got a fork with improvements at Github: https://github.com/ljszalai/rfsikuli
  * 01/07/12 - there are additional requirements for Mac and Linux, see this article: http://selesik.blogspot.com/2011/12/how-to-integrate-sikuli-in-selenium.html
  * 10/02/11 - Initial release. Your feedback welcome.

# Download #

  * [Compiled class](http://simplesikuli.googlecode.com/files/simplesikuli_v1.0.zip)

# Other notes #

**NOTE:** alternatively, instead of this wrapper library's command line interface (CLI), one could natively use the Sikuli Java API interactively via a Java-based interpreter shell like Beanshell for example. However, you'd have to know or go through the Java API to know what classes and methods to call to use it. The interactive usage though can be considered an improvement over a CLI. You could also use this wrapper class library in Beanshell as well to give you both an interactive session and a simplified API to work with.

**NOTE:** if you just want to remotely execute Sikuli (IDE) scripts over XML-RPC rather than execute Sikuli API commands then take a look at this project: [Sikuli XML-RPC server for executing Sikuli scripts remotely](https://github.com/enix12enix/sikuliserver)

**NOTE:** if you just want to be able to use a ready made server you can call via Java code w/o using XML-RPC, take a look at this project: [Sikuli Remote Control](https://github.com/enix12enix/sikuli-remote-control)