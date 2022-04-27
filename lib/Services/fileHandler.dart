import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

var _paths, _pickingType, _extension, _fileName, _filePath;
var mounted;

// late List<List<dynamic>> employeeData;

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// List<PlatformFile>? _paths;
// String? _extension="csv";
// FileType _pickingType = FileType.custom;
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   employeeData  = List<List<dynamic>>.empty(growable: true);
// }
void _openFileExplorer() async {
  try {
    _paths = (await FilePicker.platform.pickFiles(
      type: _pickingType,
      allowMultiple: false,
      allowedExtensions: (_extension.isNotEmpty ?? false)
          ? _extension.replaceAll(' ', '').split(',')
          : null,
    ))
        ?.files;
  } on PlatformException catch (e) {
    print("Unsupported operation" + e.toString());
  } catch (ex) {
    print(ex);
  }
  if (!mounted) return;
  openFile(_paths[0].path);
  print(_paths);
  print("File path ${_paths[0]}");
  print(_paths.first.extension);
}

openFile(filepath) async {
  File f = new File(filepath);
  print("CSV to List");
  final input = f.openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(CsvToListConverter())
      .toList();
  print(fields);
  return fields;
}

// Widget getListData() {
//   ListView.builder(
//       shrinkWrap: true,
//       itemCount: fields.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(fields[index][0]),
//                 Text(fields[index][1]),
//                 Text(fields[index][2]),
//               ],
//             ),
//           ),
//         );
//       });
// }
