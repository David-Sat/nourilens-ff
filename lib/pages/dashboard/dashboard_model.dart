import '/backend/api_requests/api_calls.dart';
import '/components/nutritional_overview_widget.dart';
import '/components/successes_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for successes component.
  late SuccessesModel successesModel1;
  // Model for successes component.
  late SuccessesModel successesModel2;
  // Model for nutritionalOverview component.
  late NutritionalOverviewModel nutritionalOverviewModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (test_post_test_post)] action in FloatingActionButton widget.
  ApiCallResponse? apiResultm0q;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    successesModel1 = createModel(context, () => SuccessesModel());
    successesModel2 = createModel(context, () => SuccessesModel());
    nutritionalOverviewModel =
        createModel(context, () => NutritionalOverviewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    successesModel1.dispose();
    successesModel2.dispose();
    nutritionalOverviewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
