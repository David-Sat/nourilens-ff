import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_indicator/loading_indicator_widget.dart';
import '/components/single_suggestion/single_suggestion_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'suggestions_model.dart';
export 'suggestions_model.dart';

class SuggestionsWidget extends StatefulWidget {
  const SuggestionsWidget({super.key});

  @override
  State<SuggestionsWidget> createState() => _SuggestionsWidgetState();
}

class _SuggestionsWidgetState extends State<SuggestionsWidget> {
  late SuggestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuggestionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.items = await actions.getRecentItems(
        FFAppState().receipts.toList(),
        7,
        FFAppState().suggestions.toList(),
      );
    });

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

    return StreamBuilder<List<FullReceiptRecord>>(
      stream: queryFullReceiptRecord(
        parent: currentUserReference,
        queryBuilder: (fullReceiptRecord) =>
            fullReceiptRecord.orderBy('receipt.date'),
        limit: 20,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<FullReceiptRecord> suggestionsFullReceiptRecordList =
            snapshot.data!;
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
                  context.pushNamed('dashboard');
                },
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Improvement Suggestions',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 4.0, 0.0, 0.0),
                          child: Text(
                            'Your most recent suggestions for improvement',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: StreamBuilder<List<SuggestionsRecord>>(
                          stream: querySuggestionsRecord(
                            parent: currentUserReference,
                            queryBuilder: (suggestionsRecord) =>
                                suggestionsRecord.orderBy('suggestions.date',
                                    descending: true),
                            limit: 6,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<SuggestionsRecord>
                                listViewSuggestionsRecordList = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewSuggestionsRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewSuggestionsRecord =
                                    listViewSuggestionsRecordList[
                                        listViewIndex];
                                return wrapWithModel(
                                  model: _model.singleSuggestionModels.getModel(
                                    listViewIndex.toString(),
                                    listViewIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: SingleSuggestionWidget(
                                    key: Key(
                                      'Keyhg9_${listViewIndex.toString()}',
                                    ),
                                    foodSuggestion:
                                        listViewSuggestionsRecord.suggestions,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 8.0),
                        child: StreamBuilder<List<SuggestionsRecord>>(
                          stream: querySuggestionsRecord(
                            parent: currentUserReference,
                            queryBuilder: (suggestionsRecord) =>
                                suggestionsRecord.orderBy('suggestions.date',
                                    descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<SuggestionsRecord>
                                menuItemSuggestionsRecordList = snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.receiptList =
                                    await queryFullReceiptRecordOnce(
                                  parent: currentUserReference,
                                  queryBuilder: (fullReceiptRecord) =>
                                      fullReceiptRecord.orderBy('receipt.date',
                                          descending: true),
                                  limit: 15,
                                );
                                _model.itemsLow = await actions.getRecentItems(
                                  suggestionsFullReceiptRecordList
                                      .map((e) => e.receipt)
                                      .toList(),
                                  7,
                                  menuItemSuggestionsRecordList
                                      .map((e) => e.suggestions)
                                      .toList(),
                                );
                                setState(() {
                                  _model.loading = true;
                                });
                                if (_model.itemsLow != '') {
                                  _model.apiSuggestions =
                                      await FastAPIGeminiGroup.suggestionsCall
                                          .call(
                                    itemsString: _model.itemsLow,
                                  );
                                  if ((_model.apiSuggestions?.succeeded ??
                                      true)) {
                                    await SuggestionsRecord.createDoc(
                                            currentUserReference!)
                                        .set(createSuggestionsRecordData(
                                      suggestions: createSuggestionStruct(
                                        prevItem:
                                            PreSuggestionStruct.maybeFromMap(
                                                    (_model.apiSuggestions
                                                            ?.jsonBody ??
                                                        ''))
                                                ?.prevItem,
                                        prevItemPrice:
                                            PreSuggestionStruct.maybeFromMap(
                                                    (_model.apiSuggestions
                                                            ?.jsonBody ??
                                                        ''))
                                                ?.prevItemPrice,
                                        newItem:
                                            PreSuggestionStruct.maybeFromMap(
                                                    (_model.apiSuggestions
                                                            ?.jsonBody ??
                                                        ''))
                                                ?.newItem,
                                        newItemPrice:
                                            PreSuggestionStruct.maybeFromMap(
                                                    (_model.apiSuggestions
                                                            ?.jsonBody ??
                                                        ''))
                                                ?.newItemPrice,
                                        description:
                                            PreSuggestionStruct.maybeFromMap(
                                                    (_model.apiSuggestions
                                                            ?.jsonBody ??
                                                        ''))
                                                ?.description,
                                        date: getCurrentTimestamp,
                                        originalString: _model.itemsLow,
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Successfully generated suggestion',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Suggestion generation failed',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'We have no improvement suggestions at this point :)!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }

                                setState(() {
                                  _model.loading = false;
                                });

                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x411D2429),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Generate New Suggestions',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    wrapWithModel(
                      model: _model.loadingIndicatorModel,
                      updateCallback: () => setState(() {}),
                      child: LoadingIndicatorWidget(
                        parameter1: _model.loading,
                        loadingText: 'Generating Suggestion',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
