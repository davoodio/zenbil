import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/header/header_widget.dart';
import '/components/loaders/loader_query_inside/loader_query_inside_widget.dart';
import '/components/transaction_card_widget.dart';
import '/components/wallet_front_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wallet_history_model.dart';
export 'wallet_history_model.dart';

class WalletHistoryWidget extends StatefulWidget {
  const WalletHistoryWidget({
    super.key,
    required this.wallet,
  });

  final int? wallet;

  @override
  State<WalletHistoryWidget> createState() => _WalletHistoryWidgetState();
}

class _WalletHistoryWidgetState extends State<WalletHistoryWidget> {
  late WalletHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletHistoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WalletHistory'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            'gvyi92ma' /* Wallet History */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: wrapWithModel(
                          model: _model.walletFrontCardModel,
                          updateCallback: () => safeSetState(() {}),
                          child: WalletFrontCardWidget(
                            showHistory: false,
                            wallet: FFAppState().Wallet,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<TransactionsRow>>(
                          future: TransactionsTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'user_id',
                                  currentUserUid,
                                )
                                .eq(
                                  'wallet_id',
                                  widget!.wallet,
                                )
                                .order('created_at'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return LoaderQueryInsideWidget();
                            }
                            List<TransactionsRow>
                                transactionsTransactionsRowList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                24.0,
                                0,
                                24.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: transactionsTransactionsRowList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 16.0),
                              itemBuilder: (context, transactionsIndex) {
                                final transactionsTransactionsRow =
                                    transactionsTransactionsRowList[
                                        transactionsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: TransactionCardWidget(
                                    key: Key(
                                        'Keytlq_${transactionsIndex}_of_${transactionsTransactionsRowList.length}'),
                                    transaction: transactionsTransactionsRow,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
