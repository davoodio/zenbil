import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_bar_item_model.dart';
export 'nav_bar_item_model.dart';

class NavBarItemWidget extends StatefulWidget {
  const NavBarItemWidget({
    super.key,
    String? actiePage,
    String? currentItemName,
    required this.unselectedIcon,
    required this.selectedIcon,
    bool? fancyItem,
    bool? showImageAsIcon,
    this.imageNormal,
    this.imageSelected,
  })  : actiePage = actiePage ?? 'Home',
        currentItemName = currentItemName ?? 'Home',
        fancyItem = fancyItem ?? false,
        showImageAsIcon = showImageAsIcon ?? false;

  final String actiePage;
  final String currentItemName;
  final Widget? unselectedIcon;
  final Widget? selectedIcon;
  final bool fancyItem;
  final bool showImageAsIcon;
  final String? imageNormal;
  final String? imageSelected;

  @override
  State<NavBarItemWidget> createState() => _NavBarItemWidgetState();
}

class _NavBarItemWidgetState extends State<NavBarItemWidget> {
  late NavBarItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 48.0,
            height: 48.0,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                if (!widget.showImageAsIcon)
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        if (widget.fancyItem &&
                            (widget.actiePage == widget.currentItemName))
                          Opacity(
                            opacity: 0.7,
                            child: ClipOval(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(-0.14, 1.45),
                                          child: Container(
                                            width: double.infinity,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (widget.actiePage != widget.currentItemName)
                          widget.unselectedIcon!,
                        if (widget.actiePage == widget.currentItemName)
                          widget.selectedIcon!,
                      ],
                    ),
                  ),
                if (widget.showImageAsIcon)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            if (widget.actiePage == widget.currentItemName)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 500),
                                  fadeOutDuration: const Duration(milliseconds: 500),
                                  imageUrl: widget.imageSelected!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (widget.actiePage != widget.currentItemName)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 500),
                                  fadeOutDuration: const Duration(milliseconds: 500),
                                  imageUrl: widget.imageNormal!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          AutoSizeText(
            widget.currentItemName.maybeHandleOverflow(maxChars: 12),
            minFontSize: 9.0,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Neometric',
                  color: valueOrDefault<Color>(
                    widget.actiePage == widget.currentItemName
                        ? FlutterFlowTheme.of(context).mainBlue
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                  useGoogleFonts: GoogleFonts.asMap().containsKey('Neometric'),
                ),
          ),
        ],
      ),
    );
  }
}
