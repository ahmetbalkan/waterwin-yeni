import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/custom_widgets/custom_button.dart';
import 'package:waterwin_app/custom_widgets/custom_space.dart';
import 'package:waterwin_app/custom_widgets/top_snackbar.dart';
import 'package:waterwin_app/presentations/account_page/presentations/drink_reminder_page/presentations/bloc/drink_reminder_cubit.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/presentations/bloc/login_cubit.dart';

class DrinkReminderPage extends StatefulWidget {
  final DrinkReminderCubit? drinkReminderCubit;

  const DrinkReminderPage({super.key, this.drinkReminderCubit});

  @override
  State<DrinkReminderPage> createState() => _DrinkReminderPageState();
}

class _DrinkReminderPageState extends State<DrinkReminderPage> {
  late final DrinkReminderCubit _drinkReminderCubit;
  late TextEditingController reminderMessageController;
  late FixedExtentScrollController scrollController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _drinkReminderCubit = widget.drinkReminderCubit ?? DrinkReminderCubit()
      ..getReminderData();
    reminderMessageController = TextEditingController();
    scrollController = FixedExtentScrollController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _drinkReminderCubit.close();
    reminderMessageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _drinkReminderCubit,
      child: BlocConsumer<DrinkReminderCubit, DrinkReminderState>(
        listener: (context, state) {
          if (state.status == DrinkReminderStatus.error) {
            showTopSnackBar(context, state.errorMessage);
          }
          if (state.status == DrinkReminderStatus.saved) {
            showTopSnackBar(
              context,
              "Reminder settings updated successfully",
            );
            context.pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: TColors.lightBackground,
            appBar: const AppBarWidget(
              title: "Accounts",
            ),
            body: state.status == DrinkReminderStatus.loading
                ? Center(child: CircularProgressIndicator())
                : SafeArea(
                    child: Container(
                      alignment: Alignment.topCenter,
                      width:
                          MediaQuery.of(context).size.width, // Ekran genişliği
                      height: MediaQuery.of(context)
                          .size
                          .height, // Ekran yüksekliği
                      child: FittedBox(
                        fit: BoxFit.scaleDown, // İçeriği ekrana sığdırmak için
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(24.w),
                          child: ConstrainedBox(
                            // İçeriğin ne kadar büyüyüp/küçülebileceğini sınırlıyoruz
                            constraints: BoxConstraints(
                              maxWidth: 1.sw, // En fazla tam ekran genişliğinde
                              minWidth:
                                  1.sw, // Minimum da tam ekran genişliğinde
                              maxHeight:
                                  0.85.sh, // En fazla tam ekran yüksekliğinde
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
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
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                IconlyLight.notification,
                                                color: TColors.primary,
                                                size: 24.w,
                                              ),
                                              Space(),
                                              Expanded(
                                                child: Text(
                                                  "Reminder",
                                                  style: TTextStyles.h6,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              CupertinoSwitch(
                                                value: state.isReminderOn == 1,
                                                activeColor: TColors.primary,
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          DrinkReminderCubit>()
                                                      .toggleReminder(value);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                            color: TColors.greyBackground,
                                            height: 1.w),
                                        InkWell(
                                          onTap: () => _settingModalBottomSheet(
                                            context,
                                            ReminderMessageWidget(
                                              initialMessage:
                                                  state.reminderMessage,
                                              onMessageSaved: (message) {
                                                _drinkReminderCubit
                                                    .updateReminderMessage(
                                                        message);
                                              },
                                            ),
                                            "Reminder Message",
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  IconlyLight.message,
                                                  color: TColors.primary,
                                                  size: 24.w,
                                                ),
                                                const Space(),
                                                Expanded(
                                                  child: Text(
                                                    "Reminder Message",
                                                    style: TTextStyles.h6,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                Icon(
                                                    FontAwesomeIcons.angleRight,
                                                    size: 20.w),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Space(),
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
                                      children: [
                                        InkWell(
                                          onTap: () => _settingModalBottomSheet(
                                            context,
                                            TimePickerWidget(
                                              initialTime: state.dayStart,
                                              onTimeSelected:
                                                  _drinkReminderCubit
                                                      .updateDayStart,
                                            ),
                                            "Day Start",
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.clock,
                                                  color: TColors.primary,
                                                  size: 24.w,
                                                ),
                                                const Space(),
                                                Expanded(
                                                  child: Text(
                                                    "Day Start",
                                                    style: TTextStyles.h6,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                Icon(
                                                    FontAwesomeIcons.angleRight,
                                                    size: 20.w),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color: TColors.greyBackground,
                                          height: 1.w,
                                        ),
                                        InkWell(
                                          onTap: () => _settingModalBottomSheet(
                                            context,
                                            TimePickerWidget(
                                              initialTime: state.dayEnd,
                                              onTimeSelected:
                                                  _drinkReminderCubit
                                                      .updateDayEnd,
                                            ),
                                            "Day End",
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.clock,
                                                  color: TColors.primary,
                                                  size: 24.w,
                                                ),
                                                const Space(),
                                                Expanded(
                                                  child: Text(
                                                    "Day End",
                                                    style: TTextStyles.h6,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                Icon(
                                                    FontAwesomeIcons.angleRight,
                                                    size: 20.w),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color: TColors.greyBackground,
                                          height: 1.w,
                                        ),
                                        InkWell(
                                          onTap: () => _settingModalBottomSheet(
                                            context,
                                            IntervalPickerWidget(
                                              initialInterval:
                                                  state.reminderInterval,
                                              onIntervalSelected: (interval) {
                                                _drinkReminderCubit
                                                    .updateInterval(interval);
                                              },
                                            ),
                                            "Select Interval",
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.stopwatch,
                                                  color: TColors.primary,
                                                  size: 24.w,
                                                ),
                                                const Space(),
                                                Expanded(
                                                  child: Text(
                                                    "Select Interval",
                                                    style: TTextStyles.h6,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                Icon(
                                                    FontAwesomeIcons.angleRight,
                                                    size: 20.w),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Space(),
                                  CustomButton(
                                    onTap: () {
                                      _drinkReminderCubit.updateReminder();
                                    },
                                    padding: 0,
                                    textStyle: TTextStyles.mediumBold.copyWith(
                                      color: TColors.white,
                                    ),
                                    backgroundColor: TColors.primary,
                                    text: "Save",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  void _settingModalBottomSheet(
      BuildContext context, Widget widget, String title) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: TColors.white,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          // Added Scroll view for bottom sheet
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: 1.sw,
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 38.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: TColors.textGrey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  Space(height: 16.w),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Icon(FontAwesomeIcons.xmark,
                              size: 24.w, color: TColors.black),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(title,
                            textAlign: TextAlign.center,
                            style:
                                TTextStyles.h4.copyWith(color: TColors.black)),
                      ),
                    ],
                  ),
                  Space(height: 8.w),
                  const Divider(),
                  Space(height: 8.w),
                  widget,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReminderMessageWidget extends StatelessWidget {
  final String initialMessage;
  final ValueChanged<String> onMessageSaved;

  const ReminderMessageWidget({
    super.key,
    required this.initialMessage,
    required this.onMessageSaved,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: initialMessage);

    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Reminder Message",
          ),
          minLines: 4,
          maxLines: null,
          validator: (value) => value != null && value.isNotEmpty
              ? null
              : 'Message cannot be empty',
        ),
        const SizedBox(height: 16),
        CustomButton(
          textStyle: TTextStyles.mediumBold.copyWith(color: TColors.white),
          padding: 0,
          onTap: () {
            if (controller.text.isNotEmpty) {
              onMessageSaved(controller.text);
              Navigator.pop(context);
            }
          },
          backgroundColor: TColors.primary,
          text: "Save",
        ),
      ],
    );
  }
}

class TimePickerWidget extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onTimeSelected;

  const TimePickerWidget({
    Key? key,
    required this.initialTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late int selectedHour;
  late int selectedMinute;
  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;

  @override
  void initState() {
    super.initState();
    selectedHour = widget.initialTime.hour;
    selectedMinute = widget.initialTime.minute;
    hourController = FixedExtentScrollController(initialItem: selectedHour);
    minuteController = FixedExtentScrollController(initialItem: selectedMinute);
  }

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CupertinoPicker(
                scrollController: hourController,
                itemExtent: 50,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedHour = index;
                  });
                },
                children: List.generate(
                    24,
                    (index) =>
                        Center(child: Text(index.toString().padLeft(2, '0')))),
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                scrollController: minuteController,
                itemExtent: 50,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedMinute = index;
                  });
                },
                children: List.generate(
                    60,
                    (index) =>
                        Center(child: Text(index.toString().padLeft(2, '0')))),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomButton(
          padding: 0,
          textStyle: TTextStyles.mediumBold.copyWith(color: TColors.white),
          onTap: () {
            final selectedTime =
                TimeOfDay(hour: selectedHour, minute: selectedMinute);
            widget.onTimeSelected(selectedTime);
            Navigator.pop(context);
          },
          backgroundColor: TColors.primary,
          text: "Save",
        ),
      ],
    );
  }
}

class IntervalPickerWidget extends StatefulWidget {
  final int initialInterval;
  final ValueChanged<int> onIntervalSelected;

  const IntervalPickerWidget({
    Key? key,
    required this.initialInterval,
    required this.onIntervalSelected,
  }) : super(key: key);

  @override
  _IntervalPickerWidgetState createState() => _IntervalPickerWidgetState();
}

class _IntervalPickerWidgetState extends State<IntervalPickerWidget> {
  late int selectedInterval;
  late FixedExtentScrollController intervalController;

  @override
  void initState() {
    super.initState();
    selectedInterval = widget.initialInterval;
    intervalController =
        FixedExtentScrollController(initialItem: selectedInterval - 1);
  }

  @override
  void dispose() {
    intervalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: CupertinoPicker(
            scrollController: intervalController,
            itemExtent: 50,
            onSelectedItemChanged: (index) {
              setState(() {
                selectedInterval = index + 1;
              });
            },
            children: List.generate(60, (index) {
              return Center(child: Text("${index + 1} min"));
            }),
          ),
        ),
        const SizedBox(height: 16),
        CustomButton(
          padding: 0,
          textStyle: TTextStyles.mediumBold.copyWith(color: TColors.white),
          onTap: () {
            widget.onIntervalSelected(selectedInterval);
            Navigator.pop(context);
          },
          backgroundColor: TColors.primary,
          text: "Save",
        ),
      ],
    );
  }
}
