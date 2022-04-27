import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Displaydata extends StatefulWidget {
  @override
  State<Displaydata> createState() => _DisplaydataState();
}

class _DisplaydataState extends State<Displaydata> {
  List<List<dynamic>> fields;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PlatformFile> _paths;
  String _extension = "csv";
  FileType _pickingType = FileType.custom;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fields = List<List<dynamic>>.empty(growable: true);
  }

  openFile(filepath) async {
    File f = new File(filepath);
    print("CSV to List");
    final input = f.openRead();
    final dt = await input
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
    print(dt);
    setState(() {
      fields = dt;
    });
  }

  void _openFileExplorer() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      openFile(_paths[0].path);
      print(_paths);
      print("File path ${_paths[0]}");
      print(_paths.first.extension);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: Text("Analyse Data")),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 157, 134, 64),
                height: 30,
                child: TextButton(
                  child: Text(
                    "Buisness Data",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _openFileExplorer,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: fields.length,
                  itemBuilder: (context, index) {
                    // Date , Open , High,low
                    // Jul31 , 2763,2889,90

                    Text(fields[index][0].toString());
                    Text(fields[index][1].toString());
                    Text(fields[index][2].toString());
                    Text(fields[index][3].toString());
                    Text(fields[index][4].toString());

                    return Card(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    );

                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
