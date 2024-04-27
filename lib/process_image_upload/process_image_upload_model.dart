import '/flutter_flow/flutter_flow_util.dart';
import 'process_image_upload_widget.dart' show ProcessImageUploadWidget;
import 'package:flutter/material.dart';

class ProcessImageUploadModel
    extends FlutterFlowModel<ProcessImageUploadWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
