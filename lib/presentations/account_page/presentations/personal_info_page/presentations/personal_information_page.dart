import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:waterwin_app/core/extentions/activity_extentions.dart';
import 'package:waterwin_app/core/extentions/datetime_extentions.dart';
import 'package:waterwin_app/core/extentions/gender_extentions.dart';
import 'package:waterwin_app/core/extentions/weather_extentions.dart';
import 'package:waterwin_app/core/theme/colors.dart';
import 'package:waterwin_app/core/theme/text_theme.dart';
import 'package:waterwin_app/custom_widgets/appbar_widget.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_bloc.dart';
import 'package:waterwin_app/presentations/information_page/presentations/bloc/information_state.dart';

class PersonalInfoPage extends StatefulWidget {
  final InformationBloc? informationBloc;

  const PersonalInfoPage({super.key, this.informationBloc});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  late final InformationBloc _informationBloc;

  @override
  void initState() {
    super.initState();
    _informationBloc = widget.informationBloc ?? InformationBloc()
      ..getInformation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _informationBloc,
      child: BlocBuilder<InformationBloc, InformationState>(
        builder: (context, state) {
          final List<Map<String, Object>> items = [
            {'title': 'Name Surname', 'value': state.name},
            {'title': 'Phone', 'value': state.phoneNumber},
            {'title': 'Gender', 'value': state.gender.genderToText},
            {'title': 'Height', 'value': '${state.height} cm'},
            {'title': 'Weight', 'value': state.weight},
            {'title': 'Age', 'value': state.age},
            {'title': 'Wake-up Time', 'value': state.wakeUpTime.toShortTime()},
            {'title': 'Bedtime', 'value': state.sleepTime.toShortTime()},
            {
              'title': 'Activity Level',
              'value': state.activityLevel.activityDescription
            },
            {'title': 'Weather', 'value': state.weather.weatherDescription},
          ];
          return Scaffold(
            backgroundColor: TColors.white,
            appBar: const AppBarWidget(title: "Personal Information"),
            body: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = constraints.maxWidth / 2;
                final itemHeight =
                    constraints.maxHeight / ((items.length / 2).ceil());

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (items.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    final startIndex = index * 2;
                    final endIndex = (startIndex + 2 > items.length)
                        ? items.length
                        : startIndex + 2;
                    final rowItems = items.sublist(startIndex, endIndex);

                    return Row(
                      children: rowItems.map((item) {
                        return InkWell(
                          onTap: () {
                            switch (item['title']) {
                              case 'Name Surname':
                                context.push(
                                  "/namesurname-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Phone':
                                context.push(
                                  "/phone-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Gender':
                                context.push(
                                  "/gender-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Height':
                                context.push(
                                  "/height-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Weight':
                                context.push(
                                  "/weight-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Age':
                                context.push(
                                  "/age-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Wake-up Time':
                                context.push(
                                  "/wakeup-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Bedtime':
                                context.push(
                                  "/bedtime-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Activity Level':
                                context.push(
                                  "/activity-account",
                                  extra: _informationBloc,
                                );
                                break;
                              case 'Weather':
                                context.push(
                                  "/weather-account",
                                  extra: _informationBloc,
                                );
                                break;
                              default:
                            }
                          },
                          child: Container(
                            width: itemWidth,
                            height: itemHeight,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: TColors.greyBackground),
                                right: rowItems.last == item
                                    ? BorderSide.none
                                    : BorderSide(color: TColors.greyBackground),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item['title']!.toString(),
                                          style: TTextStyles.largeBold,
                                        ),
                                        Text(
                                          item['value']!.toString(),
                                          style: TTextStyles.largeRegular,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.angleRight,
                                    color: TColors.primary,
                                    size: 18.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
