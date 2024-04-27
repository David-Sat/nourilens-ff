import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nutrivalue_model.dart';
export 'nutrivalue_model.dart';

class NutrivalueWidget extends StatefulWidget {
  const NutrivalueWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<NutrivalueWidget> createState() => _NutrivalueWidgetState();
}

class _NutrivalueWidgetState extends State<NutrivalueWidget> {
  late NutrivalueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutrivalueModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        height: 32.0,
        decoration: BoxDecoration(
          color: () {
            if (widget.parameter1! >= 7) {
              return FlutterFlowTheme.of(context).secondary;
            } else if (widget.parameter1! <= 4) {
              return FlutterFlowTheme.of(context).error;
            } else {
              return FlutterFlowTheme.of(context).warning;
            }
          }(),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Text(
              'Nutritional Value: ${widget.parameter1?.toString()}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
