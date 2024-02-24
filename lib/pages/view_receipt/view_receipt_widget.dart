import '/backend/backend.dart';
import '/components/single_item/single_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_receipt_model.dart';
export 'view_receipt_model.dart';

class ViewReceiptWidget extends StatefulWidget {
  const ViewReceiptWidget({
    super.key,
    required this.receipt,
  });

  final FullReceiptRecord? receipt;

  @override
  State<ViewReceiptWidget> createState() => _ViewReceiptWidgetState();
}

class _ViewReceiptWidgetState extends State<ViewReceiptWidget> {
  late ViewReceiptModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewReceiptModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('receipts_overview');
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Receipt Details',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Below are the items bought on  ${dateTimeFormat(
                      'MMMMEEEEd',
                      widget.receipt?.receipt.date,
                      locale: FFLocalizations.of(context).languageCode,
                    )}',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
                Builder(
                  builder: (context) {
                    final items =
                        widget.receipt?.receipt.receiptItems.toList() ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: items.length,
                      itemBuilder: (context, itemsIndex) {
                        final itemsItem = items[itemsIndex];
                        return wrapWithModel(
                          model: _model.singleItemModels.getModel(
                            itemsIndex.toString(),
                            itemsIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: SingleItemWidget(
                            key: Key(
                              'Keycul_${itemsIndex.toString()}',
                            ),
                            itemData: itemsItem,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
