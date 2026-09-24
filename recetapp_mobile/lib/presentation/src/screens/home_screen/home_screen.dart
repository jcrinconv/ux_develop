import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
import 'package:recetapp_mobile/domain/stores/scheduled_medications_store.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';
import 'package:recetapp_mobile/presentation/src/core/recetapp_resources.dart';

const homeScreenRoute = '/homeScreenRoute';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigationService = locator<NavigationService>();
  final _scheduledMedications = locator<ScheduledMedicationsStore>();

  static const _profiles = [
    RecetappProfileOption(name: 'Juan', subtitle: 'Persona · activo'),
    RecetappProfileOption(name: 'Lulo', subtitle: 'Mascota · 1 tratamiento'),
    RecetappProfileOption(name: 'Federico', subtitle: 'Persona · sin tratamientos'),
  ];
  String _profileName = _profiles.first.name;

  Future<void> _selectProfile() async {
    final profile = await showSelectProfileDialog(context, profiles: _profiles, selectedName: _profileName);
    if (profile != null) setState(() => _profileName = profile.name);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: RecetappHomeTopBar(profileName: _profileName, onProfileTap: _selectProfile, onNotificationsTap: () {}),
        bottomNavigationBar: RecetappBottomNav(
          items: [
            RecetappBottomNavItemData(iconPath: RecetappIcons.packageIcon, label: 'Tratamientos'),
            RecetappBottomNavItemData(iconPath: RecetappIcons.userIcon, label: 'Perfil'),
          ],
          currentIndex: 0,
          onTap: (index) {},
        ),
        floatingActionButton: RecetappFab(
          onPressed: () => navigationService.navigateToNamedRoute(scanPrescriptionScreenRoute),
          size: 54.h,
          iconSize: 36.h,
        ),
        body: RecetappBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Text(DateTime.now().todayLabel, style: RecetappTextStyles.h3),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Observer(
                  builder: (context) => Text(
                    '${_scheduledMedications.scheduledDosesCount} tomas programadas - '
                    '${_scheduledMedications.takenDosesCount} completada(s)',
                    style: RecetappTextStyles.hint,
                  ),
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (context) {
                    final medications = _scheduledMedications.medications;
                    return ListView.separated(
                      padding: EdgeInsets.only(bottom: 40.h),
                      itemCount: medications.length,
                      separatorBuilder: (context, index) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final medication = medications[index];
                        return RecetappTreatmentCard(
                          name: medication.name,
                          presentation: medication.presentationLabel,
                          frequency: medication.frequencyLabel,
                          duration: medication.durationLabel,
                          time: medication.timeLabel,
                          taken: medication.taken,
                          onToggle: () {},
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
