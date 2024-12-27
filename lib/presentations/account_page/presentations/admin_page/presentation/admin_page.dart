import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Cupertino widgetlar için
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/domain/model/referance_admin_model.dart';
import 'package:waterwin_app/presentations/account_page/presentations/admin_page/presentation/bloc/admin_cubit.dart';

class AdminPage extends StatefulWidget {
  final AdminCubit? adminCubit;

  const AdminPage({super.key, this.adminCubit});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late final AdminCubit _adminCubit;
  bool _cubitCreatedLocally = false;

  int? _pendingPointAddition;
  bool _isDeletingReference = false;

  @override
  void initState() {
    super.initState();
    if (widget.adminCubit != null) {
      _adminCubit = widget.adminCubit!;
    } else {
      _adminCubit = AdminCubit();
      _cubitCreatedLocally = true;
    }
  }

  @override
  void dispose() {
    if (_cubitCreatedLocally) {
      _adminCubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _adminCubit,
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state.status == AdminStatus.error && state.message != null) {
            showTopSnackBar(context, state.message!);
          } else if (state.status == AdminStatus.loaded &&
              state.message != null) {
            showTopSnackBar(context, state.message!);
          }

          // Puan ekleme bottom sheet
          if (state.status == AdminStatus.loaded &&
              _pendingPointAddition != null &&
              state.referenceList.isNotEmpty) {
            final point = _pendingPointAddition!;
            _pendingPointAddition = null;
            _showReferenceSelector(
              context,
              references: state.referenceList,
              title: "$point Puan Eklenecek Referansı Seç",
              onSelected: (refUserId) {
                Navigator.pop(context);
                _adminCubit.addReferancePoints(refUserId, point);
              },
            );
          }

          // Tek kullanıcı referansını silme bottom sheet
          if (state.status == AdminStatus.loaded &&
              _isDeletingReference &&
              state.referenceList.isNotEmpty) {
            _isDeletingReference = false;
            _showReferenceSelector(
              context,
              references: state.referenceList,
              title: "Silinecek Referansı Seç",
              onSelected: (refUserId) {
                Navigator.pop(context);
                _adminCubit.deleteReference(refUserId);
              },
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AdminCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Admin Page'),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Kendine Puan Ekle
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            color: TColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 16.w,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.plus,
                                        size: 24.w, color: TColors.primary),
                                    Space(
                                      width: 24.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Kendine Puan Ekle",
                                        style: TTextStyles.h6
                                            .copyWith(color: TColors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Icon(IconlyLight.arrowRight2,
                                        size: 24.w, color: TColors.primary),
                                  ],
                                ),
                              ),
                              Divider(
                                  color: TColors.lightBackground, height: 1.w),
                              Space(height: 16.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      onTap: () {
                                        cubit.addPoints(100);
                                      },
                                      padding: 0,
                                      textStyle: TTextStyles.largeBold.copyWith(
                                        color: TColors.white,
                                      ),
                                      backgroundColor: TColors.primary,
                                      text: "100 puan ekle",
                                    ),
                                  ),
                                  Space(width: 16.w),
                                  Expanded(
                                    child: CustomButton(
                                      onTap: () {
                                        cubit.addPoints(1000);
                                      },
                                      padding: 0,
                                      textStyle: TTextStyles.largeBold.copyWith(
                                        color: TColors.white,
                                      ),
                                      backgroundColor: TColors.primary,
                                      text: "1000 puan ekle",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Space(height: 16.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            color: TColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 16.w,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.plus,
                                        size: 24.w, color: TColors.primary),
                                    Space(width: 24.w),
                                    Expanded(
                                      child: Text(
                                        "Referanslarına Puan Ekle",
                                        style: TTextStyles.h6
                                            .copyWith(color: TColors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Icon(IconlyLight.arrowRight2,
                                        size: 24.w, color: TColors.primary),
                                  ],
                                ),
                              ),
                              Divider(
                                  color: TColors.lightBackground, height: 1.w),
                              Space(height: 16.h),
                              CustomButton(
                                onTap: () {
                                  cubit.addReference();
                                },
                                padding: 0,
                                textStyle: TTextStyles.largeBold.copyWith(
                                  color: TColors.white,
                                ),
                                backgroundColor: TColors.primary,
                                text: "Tek Referans Ekle",
                              ),
                              Space(height: 16.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      onTap: () {
                                        _pendingPointAddition = 100;
                                        cubit.getReferences();
                                      },
                                      padding: 0,
                                      textStyle: TTextStyles.largeBold.copyWith(
                                        color: TColors.white,
                                      ),
                                      backgroundColor: TColors.primary,
                                      text: "100 puan ekle",
                                    ),
                                  ),
                                  Space(width: 16.w),
                                  Expanded(
                                    child: CustomButton(
                                      onTap: () {
                                        _pendingPointAddition = 1000;
                                        cubit.getReferences();
                                      },
                                      padding: 0,
                                      textStyle: TTextStyles.largeBold.copyWith(
                                        color: TColors.white,
                                      ),
                                      backgroundColor: TColors.primary,
                                      text: "1000 puan ekle",
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Space(height: 16.h),

                        // Verileri Sil
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            color: TColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 16.w,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.plus,
                                        size: 24.w, color: TColors.primary),
                                    Space(width: 24.w),
                                    Expanded(
                                      child: Text(
                                        "Verileri Sil",
                                        style: TTextStyles.h6
                                            .copyWith(color: TColors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Icon(IconlyLight.arrowRight2,
                                        size: 24.w, color: TColors.primary),
                                  ],
                                ),
                              ),
                              Divider(
                                  color: TColors.lightBackground, height: 1.w),
                              Space(height: 16.h),

                              CustomButton(
                                onTap: () {
                                  _showCupertinoConfirmDialog(
                                    context,
                                    title: "Onay",
                                    message:
                                        "Tüm veriler silinecek. Emin misiniz?",
                                    onConfirm: () {
                                      cubit.deleteUserAndReferencePoints();
                                    },
                                  );
                                },
                                padding: 0,
                                textStyle: TTextStyles.largeBold.copyWith(
                                  color: TColors.white,
                                ),
                                backgroundColor: TColors.primary,
                                text: "Tüm Verileri Sil",
                              ),

                              Space(height: 16.h),
                              CustomButton(
                                onTap: () {
                                  _showCupertinoConfirmDialog(
                                    context,
                                    title: "Onay",
                                    message:
                                        "Tüm referans puanları silinecek. Emin misiniz?",
                                    onConfirm: () {
                                      cubit.deleteOnlyReferencePoints();
                                    },
                                  );
                                },
                                padding: 0,
                                textStyle: TTextStyles.largeBold.copyWith(
                                  color: TColors.white,
                                ),
                                backgroundColor: TColors.primary,
                                text: "Tüm Referansların Puanlarını Sil",
                              ),

                              Space(height: 16.h),
                              CustomButton(
                                onTap: () {
                                  _isDeletingReference = true;
                                  cubit.getReferences();
                                },
                                padding: 0,
                                textStyle: TTextStyles.largeBold.copyWith(
                                  color: TColors.white,
                                ),
                                backgroundColor: TColors.primary,
                                text: "Tek Kullanıcı Referanslarını Sil",
                              ),
                              // Tek Kullanıcı Referanslarını Sil - Bu işlem öncesi yine liste çekip bottom sheet açtığımız için onay sormayabiliriz.
                            ],
                          ),
                        ),
                        Space(height: 16.h),
                      ],
                    ),
                  ),
                ),
                if (state.isLoading)
                  Container(
                    color: Colors.black26,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Cupertino onay dialog fonksiyonu
  void _showCupertinoConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title, style: TTextStyles.h6),
          content: Text(message, style: TTextStyles.largeRegular),
          actions: [
            CupertinoDialogAction(
              child: const Text("İptal"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: const Text("Evet"),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
          ],
        );
      },
    );
  }

  void _showReferenceSelector(
    BuildContext context, {
    required List<ReferanceAdminModel> references,
    required String title,
    required ValueChanged<int> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: 0.7.sh,
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TTextStyles.h6),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(FontAwesomeIcons.xmarkCircle,
                          color: TColors.primary, size: 24.w),
                    ),
                  ],
                ),
              ),
              Divider(color: TColors.lightBackground, height: 1.w),
              Expanded(
                child: ListView.builder(
                  itemCount: references.length,
                  itemBuilder: (context, index) {
                    final ref = references[index];
                    return ListTile(
                      title: Text(ref.name),
                      subtitle: Text(ref.email),
                      onTap: () {
                        onSelected(ref.userId);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
