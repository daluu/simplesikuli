# Using SikuliLibrary or its API over XML-RPC #

There are possibly other ways to use this library with XML-RPC. But one easy straight-forward way is to use the Java remote library server that's designed for Robot Framework, but instead use it stand-alone and not with Robot Framework.

**NOTE:** that for this method, you run the XML-RPC server with Sikuli on the machine where Sikuli will run. You then make calls to Sikuli remotely over XML-RPC from same machine or a remote machine.

**NOTE:** if you just want to remotely execute Sikuli (IDE) scripts over XML-RPC rather than execute Sikuli API commands then take a look at this project: [Sikuli XML-RPC server for executing Sikuli scripts remotely](https://github.com/enix12enix/sikuliserver)

See [Java remote library server usage details](http://code.google.com/p/jrobotremoteserver/wiki/RemoteServerDetails) for an overview first.

To use with SikuliLibrary, you simply add sikuli-script.jar to the classpath, and replace the ExampleLibrary as library parameter value with:

> `org.robotframework.remotelibrary.SikuliLibrary`

and place a copy of the SikuliLibrary class file (or perhaps JAR equivalent) to the remote server working directory (where ExampleLibrary also resides).

For the classpath reference, I put a copy of sikuli-script.jar in local path of the Java remote library server and added classpath reference to it. You could alternatively use classpath reference to the Sikuli JAR's installation directory under Program Files, etc. (untested by me).

Once the server is started, you can make XML-RPC requests to it from a client and get back a response that you can then analyze for pass/fail. You can use any XML-RPC client to communicate with this library server. I won't go into examples of using any code language based client, but rather briefly go over the communication protocol as plain XML.

In general, you send a XML-RPC request for method run\_keyword with parameter as follows: 1st parameter = string name of API method to call, 2nd parameter = array data structure with arguments to the API method. The array will typically consist of 1 or more arguments, with the first argument typically being a string for path to image file. Subsequent argument may be another string for another image file, or a modifier key, or instead of type double with value the time in seconds for a timeout. Request may look like this:

```
<?xml version='1.0' encoding='UTF-8'?>
 <methodCall>
  <methodName>run_keyword</methodName>
  <params>
   <param>
    <value><string>object_exists</string></value>
   </param>
   <param>
    <value>
     <array>
      <data>
       <value><string>C:\Temp\startMenu.png</string></value>
       <value><double>60</double></value>
      </data>
     </array>
    </value>
   </param>
  </params>
 </methodCall>
```

and you will get back a response like this:

```
<?xml version="1.0" encoding="UTF-8"?>
 <methodResponse>
  <params>
   <param>
    <value>
     <struct>
      <member>
       <name>error</name>
       <value><string></string></value>
      </member>
      <member>
       <name>status</name>
       <value><string>PASS</string></value>
      </member>
      <member>
       <name>traceback</name>
       <value><string></string></value>
      </member>
      <member>
       <name>return</name>
       <value><boolean>1</boolean></value>
      </member>
      <member>
       <name>output</name>
       <value><string></string></value>
      </member>
     </struct>
    </value>
   </param>
 </params>
```

an XML-RPC data structure where member "return" will be 0/false if the API method failed or 1/true if it passed. The status will always be PASS the way the library is currently implemented. If you want the status to equal fail, then do not catch the exceptions in SikuliLibrary.