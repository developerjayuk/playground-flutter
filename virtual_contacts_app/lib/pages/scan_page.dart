import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  static const String routeName = 'scan';
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool isScanComplete = false;
  List<String> lines = [];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanner')),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Capture'),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.photo_album),
                label: const Text('Gallery'),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
          Wrap(children: lines.map((line) => LineItem(line: line)).toList()),
        ],
      ),
    );
  }

  void getImage(ImageSource camera) async {
    final xFile = await ImagePicker().pickImage(source: camera);

    if (xFile != null) {
      EasyLoading.show(status: 'Processing');

      final textRecognizer = TextRecognizer(
        script: TextRecognitionScript.latin,
      );

      final recognizedText = await textRecognizer.processImage(
        InputImage.fromFile(File(xFile.path)),
      );

      EasyLoading.dismiss();

      final tempList = <String>[];
      for (var block in recognizedText.blocks) {
        for (var line in block.lines) {
          tempList.add(line.text);
        }
      }

      setState(() {
        lines = tempList.toSet().toList();
        isScanComplete = true;
      });
    }
  }
}

class LineItem extends StatelessWidget {
  final String line;
  const LineItem({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: line,
      dragAnchorStrategy: childDragAnchorStrategy,
      feedback: Container(
        key: GlobalKey(),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(color: Colors.black45),
        child: Text(
          line,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
      child: Chip(label: Text(line)),
    );
  }
}

class DropTargetItem extends StatefulWidget {
  final String property;
  final Function(String, String) onDrop;

  const DropTargetItem({
    super.key,
    required this.property,
    required this.onDrop,
  });

  @override
  State<DropTargetItem> createState() => _DropTargetItemState();
}

class _DropTargetItemState extends State<DropTargetItem> {
  String dragItem = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(widget.property)),
        Expanded(
          flex: 2,
          child: DragTarget<String>(
            builder: (context, candidateData, rejectedData) => Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: candidateData.isNotEmpty
                    ? Border.all(color: Colors.red, width: 2.0)
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(dragItem.isNotEmpty ? 'Drop here' : dragItem),
                  ),
                  if (dragItem.isNotEmpty)
                    InkWell(
                      onTap: () {
                        setState(() {
                          dragItem = '';
                        });
                      },
                    ),
                ],
              ),
            ),
            onAcceptWithDetails: (details) {
              setState(() {
                if (dragItem.isEmpty) {
                  dragItem = details.data;
                } else {
                  dragItem += ' ${details.data}';
                }
              });
              widget.onDrop(widget.property, dragItem);
            },
          ),
        ),
      ],
    );
  }
}
