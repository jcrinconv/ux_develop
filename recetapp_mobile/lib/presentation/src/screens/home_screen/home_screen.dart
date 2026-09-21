import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
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

  final List<bool> _taken = [false, true, false, false, false];

  final _treatments = const [
    (name: 'Amoxicilina', presentation: '500 mg - Cápsula', frequency: 'Cada 8 horas', duration: '7 días', time: '08:00'),
    (name: 'Paracetamol', presentation: '500 mg - Tableta', frequency: 'Cada 6 horas', duration: '3 días', time: '10:00'),
    (name: 'Loratadina', presentation: '10 mg - Tableta', frequency: 'Cada 24 horas', duration: '5 días', time: '20:00'),
    (name: 'Loratadina', presentation: '10 mg - Tableta', frequency: 'Cada 24 horas', duration: '5 días', time: '20:00'),
    (name: 'Loratadina', presentation: '10 mg - Tableta', frequency: 'Cada 24 horas', duration: '5 días', time: '20:00'),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: RecetappHomeTopBar(profileName: 'Juan', onNotificationsTap: () {}),
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
                child: Text('3 tomas programadas - 1 completada', style: RecetappTextStyles.hint),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 40.h),
                  itemCount: _treatments.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final treatment = _treatments[index];
                    return RecetappTreatmentCard(
                      name: treatment.name,
                      presentation: treatment.presentation,
                      frequency: treatment.frequency,
                      duration: treatment.duration,
                      time: treatment.time,
                      taken: _taken[index],
                      onToggle: () => setState(() => _taken[index] = !_taken[index]),
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
