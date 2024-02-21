import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'single_suggestion_model.dart';
export 'single_suggestion_model.dart';

class SingleSuggestionWidget extends StatefulWidget {
  const SingleSuggestionWidget({
    super.key,
    required this.foodSuggestion,
  });

  final SuggestionStruct? foodSuggestion;

  @override
  State<SingleSuggestionWidget> createState() => _SingleSuggestionWidgetState();
}

class _SingleSuggestionWidgetState extends State<SingleSuggestionWidget> {
  late SingleSuggestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleSuggestionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 570.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.foodSuggestion?.prevItem,
                              'prev',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            formatNumber(
                              widget.foodSuggestion!.prevItemPrice,
                              formatType: FormatType.custom,
                              currency: '',
                              format: '',
                              locale: '',
                            ),
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      '>',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.foodSuggestion?.newItem,
                              'new',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            formatNumber(
                              widget.foodSuggestion!.newItemPrice,
                              formatType: FormatType.custom,
                              currency: '',
                              format: '',
                              locale: '',
                            ),
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF57636C),
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: AutoSizeText(
                  valueOrDefault<String>(
                    widget.foodSuggestion?.description,
                    'default',
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
