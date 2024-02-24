import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_indicator/loading_indicator_widget.dart';
import '/components/nutritional_overview/nutritional_overview_widget.dart';
import '/components/successes/successes_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (urlReceipt)] action in FloatingActionButton widget.
  ApiCallResponse? receiptData;
  // Stores action output result for [Custom Action - formatReceipt] action in FloatingActionButton widget.
  FullReceiptStruct? fullReceipt;
  // Model for successes component.
  late SuccessesModel successesModel1;
  // Model for successes component.
  late SuccessesModel successesModel2;
  // Model for nutritionalOverview component.
  late NutritionalOverviewModel nutritionalOverviewModel;
  // Model for loading_indicator component.
  late LoadingIndicatorModel loadingIndicatorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    successesModel1 = createModel(context, () => SuccessesModel());
    successesModel2 = createModel(context, () => SuccessesModel());
    nutritionalOverviewModel =
        createModel(context, () => NutritionalOverviewModel());
    loadingIndicatorModel = createModel(context, () => LoadingIndicatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    successesModel1.dispose();
    successesModel2.dispose();
    nutritionalOverviewModel.dispose();
    loadingIndicatorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
