import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'avatar_with_update_model.dart';
export 'avatar_with_update_model.dart';

class AvatarWithUpdateWidget extends StatefulWidget {
  const AvatarWithUpdateWidget({
    super.key,
    this.avatar,
    bool? uploadEnable,
  }) : this.uploadEnable = uploadEnable ?? false;

  final String? avatar;
  final bool uploadEnable;

  @override
  State<AvatarWithUpdateWidget> createState() => _AvatarWithUpdateWidgetState();
}

class _AvatarWithUpdateWidgetState extends State<AvatarWithUpdateWidget> {
  late AvatarWithUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarWithUpdateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AVATAR_WITH_UPDATE_AvatarWithUpdate_ON_I');
      if (widget!.avatar != null && widget!.avatar != '') {
        logFirebaseEvent('AvatarWithUpdate_update_component_state');
        _model.avatarURL = widget!.avatar;
        _model.updatePage(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 100.0,
      height: 100.0,
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          ClipOval(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 22.0,
                    color: Color(0x0C000000),
                    offset: Offset(
                      0.0,
                      12.0,
                    ),
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(111.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/l260dcr57pr2/user-default.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if ((widget!.avatar != null && widget!.avatar != '') &&
                        (_model.avatarURL == null || _model.avatarURL == ''))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'AVATAR_WITH_UPDATE_Image_keaqubst_ON_TAP');
                          logFirebaseEvent('Image_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: widget!.avatar!,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: widget!.avatar!,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: widget!.avatar!,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(111.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: widget!.avatar!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    if (_model.isDataUploading)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(111.0),
                        child: Image.asset(
                          'assets/images/upload_image.gif',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (!_model.isDataUploading &&
                        (_model.avatarURL != null && _model.avatarURL != ''))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'AVATAR_WITH_UPDATE_Image_lkyy7uqa_ON_TAP');
                          logFirebaseEvent('Image_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: _model.avatarURL!,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: _model.avatarURL!,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: _model.avatarURL!,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(111.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: _model.avatarURL!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (widget!.uploadEnable)
            Align(
              alignment: AlignmentDirectional(1.05, 0.88),
              child: Container(
                width: 38.0,
                height: 38.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12.0,
                      color: Color(0x1A000000),
                      offset: Offset(
                        0.0,
                        4.0,
                      ),
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 100.0,
                  borderWidth: 1.0,
                  buttonSize: 38.0,
                  fillColor: FlutterFlowTheme.of(context).tfBg,
                  icon: Icon(
                    Icons.image_search,
                    color: FlutterFlowTheme.of(context).lightBlack,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('AVATAR_WITH_UPDATE_COMP_update_ON_TAP');
                    logFirebaseEvent('update_upload_media_to_supabase');
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      storageFolderPath: valueOrDefault<String>(
                        'users/uploads/${currentUserUid}',
                        'users/uploads',
                      ),
                      maxWidth: 800.00,
                      imageQuality: 80,
                      allowPhoto: true,
                      includeBlurHash: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = await uploadSupabaseStorageFiles(
                          bucketName: FFAppState().StorageBuckets.shared,
                          selectedFiles: selectedMedia,
                        );
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    if (_model.uploadedFileUrl != null &&
                        _model.uploadedFileUrl != '') {
                      logFirebaseEvent('update_update_component_state');
                      _model.avatarURL = _model.uploadedFileUrl;
                      _model.blureHash = _model.uploadedLocalFile.blurHash;
                      _model.updatePage(() {});
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
