// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:typed_data';

class Base64ImageViewer extends StatefulWidget {
  const Base64ImageViewer({
    Key? key,
    this.width,
    this.height,
    required this.base64String,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String base64String;

  @override
  _Base64ImageViewerState createState() => _Base64ImageViewerState();
}

class _Base64ImageViewerState extends State<Base64ImageViewer> {
  Uint8List? imageBytes;
  String? currentBase64String;

  @override
  void initState() {
    super.initState();
    _updateImage(widget.base64String);
  }

  @override
  void didUpdateWidget(Base64ImageViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.base64String != oldWidget.base64String) {
      _updateImage(widget.base64String);
    }
  }

  void _updateImage(String base64String) {
    if (base64String.startsWith('data:image')) {
      base64String = base64String.split(',')[1];
    }
    setState(() {
      imageBytes = base64.decode(base64String);
      currentBase64String = base64String;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Only rebuild the image if imageBytes is not null
    if (imageBytes == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Image.memory(
      imageBytes!,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
    );
  }
}
