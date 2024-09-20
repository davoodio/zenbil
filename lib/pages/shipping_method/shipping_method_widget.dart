import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choose_shipping_method_item_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shipping_method_model.dart';
export 'shipping_method_model.dart';

class ShippingMethodWidget extends StatefulWidget {
  const ShippingMethodWidget({super.key});

  @override
  State<ShippingMethodWidget> createState() => _ShippingMethodWidgetState();
}

class _ShippingMethodWidgetState extends State<ShippingMethodWidget> {
  late ShippingMethodModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingMethodModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ShippingMethod'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          title: FFLocalizations.of(context).getText(
                            '8vl05jsx' /* Shipping Method */,
                          ),
                          showBackButton: true,
                          showCart: true,
                          goToCartOnClick: false,
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<UsersRow>>(
                          future: UsersTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id',
                              currentUserUid,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 38.0,
                                  height: 38.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UsersRow> containerUsersRowList =
                                snapshot.data!;

                            final containerUsersRow =
                                containerUsersRowList.isNotEmpty
                                    ? containerUsersRowList.first
                                    : null;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: FutureBuilder<List<DeliveryMethodsRow>>(
                                  future: DeliveryMethodsTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'published',
                                      true,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 38.0,
                                          height: 38.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<DeliveryMethodsRow>
                                        shippingAddressColumnDeliveryMethodsRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        20.0,
                                        0,
                                        20.0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          shippingAddressColumnDeliveryMethodsRowList
                                              .length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 16.0),
                                      itemBuilder: (context,
                                          shippingAddressColumnIndex) {
                                        final shippingAddressColumnDeliveryMethodsRow =
                                            shippingAddressColumnDeliveryMethodsRowList[
                                                shippingAddressColumnIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SHIPPING_METHOD_Container_sc63us0o_ON_TA');
                                            logFirebaseEvent(
                                                'ChooseShippingMethodItem_backend_call');
                                            await UsersTable().update(
                                              data: {
                                                'default_delivery_method':
                                                    shippingAddressColumnDeliveryMethodsRow
                                                        .id,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                currentUserUid,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'ChooseShippingMethodItem_navigate_back');
                                            context.safePop();
                                          },
                                          child: ChooseShippingMethodItemWidget(
                                            key: Key(
                                                'Keysc6_${shippingAddressColumnIndex}_of_${shippingAddressColumnDeliveryMethodsRowList.length}'),
                                            title:
                                                shippingAddressColumnDeliveryMethodsRow
                                                    .name,
                                            icon: Icon(
                                              FFIcons.ktruckDelivery,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              size: 24.0,
                                            ),
                                            isDefault: containerUsersRow
                                                    ?.defaultDeliveryMethod ==
                                                shippingAddressColumnDeliveryMethodsRow
                                                    .id,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
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
