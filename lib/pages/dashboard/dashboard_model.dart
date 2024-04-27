import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_indicator/loading_indicator_widget.dart';
import '/components/successes/successes_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  List<FullReceiptStruct> listFullReceipts = [];
  void addToListFullReceipts(FullReceiptStruct item) =>
      listFullReceipts.add(item);
  void removeFromListFullReceipts(FullReceiptStruct item) =>
      listFullReceipts.remove(item);
  void removeAtIndexFromListFullReceipts(int index) =>
      listFullReceipts.removeAt(index);
  void insertAtIndexInListFullReceipts(int index, FullReceiptStruct item) =>
      listFullReceipts.insert(index, item);
  void updateListFullReceiptsAtIndex(
          int index, Function(FullReceiptStruct) updateFn) =>
      listFullReceipts[index] = updateFn(listFullReceipts[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in dashboard widget.
  List<ReceiptsRecord>? outputListUsers;
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
  // Model for loading_indicator component.
  late LoadingIndicatorModel loadingIndicatorModel;

  @override
  void initState(BuildContext context) {
    successesModel1 = createModel(context, () => SuccessesModel());
    successesModel2 = createModel(context, () => SuccessesModel());
    loadingIndicatorModel = createModel(context, () => LoadingIndicatorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    successesModel1.dispose();
    successesModel2.dispose();
    loadingIndicatorModel.dispose();
  }
}
