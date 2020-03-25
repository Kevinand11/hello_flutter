import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:helloworld/components/drawer.dart';

class PlatformScreen extends StatefulWidget {
  final String title;

  PlatformScreen({Key key, this.title}) : super(key: key);

  @override
  _PlatformScreenState createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Text('Operating system: ${Platform.operatingSystem}'),
              Text('OS version: ${Platform.operatingSystemVersion}'),
              Text('Locale Name: ${Platform.localeName}'),
              Text('Executable: ${Platform.executable}'),
              Text('Local HostName: ${Platform.localHostname}'),
              Text('No of processors: ${Platform.numberOfProcessors}'),
              Text('Executable args: ${Platform.executableArguments}'),
              Text('Package config: ${Platform.packageConfig}'),
              Text('Path separator: ${Platform.pathSeparator}'),
              Text('Resolved execs: ${Platform.resolvedExecutable}'),
              Text('Script: ${Platform.script}'),
              Text('Environment: ${Platform.environment}'),
            ],
          ),
        ),
      );
}
