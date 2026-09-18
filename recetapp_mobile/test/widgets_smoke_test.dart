import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      theme: recetappTheme,
      home: Scaffold(body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: child)),
    );
  }

  testWidgets('RecetappButton renders every variant', (tester) async {
    await tester.pumpWidget(
      wrap(
        Wrap(
          children: [
            for (final variant in RecetappButtonVariant.values) RecetappButton(label: 'Botón', onPressed: () {}, variant: variant),
            const RecetappButton(label: 'Disabled', onPressed: null),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('BOTÓN'), findsNWidgets(4));
    expect(find.text('DISABLED'), findsOneWidget);
  });

  testWidgets('RecetappFab renders', (tester) async {
    await tester.pumpWidget(wrap(Row(children: [RecetappFab(onPressed: () {}), RecetappFab(onPressed: () {}, variant: RecetappFabVariant.dark)])));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.add_rounded), findsNWidgets(2));
  });

  testWidgets('RecetappTextField renders with caption and error', (tester) async {
    await tester.pumpWidget(
      wrap(
        Column(
          children: [
            const RecetappTextField(label: 'Etiqueta', hintText: 'Escribe aquí'),
            const RecetappTextField(label: 'Dosis', caption: 'Pastillas'),
            const RecetappTextField(label: 'Etiqueta', errorText: 'Ingresa un valor válido'),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Ingresa un valor válido'), findsOneWidget);
    expect(find.text('Pastillas'), findsOneWidget);
  });

  testWidgets('RecetappSelectField opens options on tap', (tester) async {
    await tester.pumpWidget(
      wrap(RecetappSelectField(label: 'Etiqueta', value: 'Selección', options: const ['Opción 1', 'Opción 2'], onChanged: (_) {})),
    );
    await tester.pumpAndSettle();
    expect(find.text('Opción 1'), findsNothing);

    await tester.tap(find.text('Selección'));
    await tester.pumpAndSettle();
    expect(find.text('Opción 1'), findsOneWidget);
    expect(find.text('Opción 2'), findsOneWidget);
  });

  testWidgets('RecetappTimePicker renders three dropdown segments', (tester) async {
    await tester.pumpWidget(
      wrap(RecetappTimePicker(hour: '09', minute: '00', period: 'am', onHourChanged: (_) {}, onMinuteChanged: (_) {}, onPeriodChanged: (_) {})),
    );
    await tester.pumpAndSettle();
    expect(find.text('09'), findsOneWidget);
    expect(find.text('00'), findsOneWidget);
    expect(find.text('am'), findsOneWidget);
  });

  testWidgets('RecetappChoiceChips highlights the selected option', (tester) async {
    await tester.pumpWidget(
      wrap(RecetappChoiceChips(label: 'Día de inicio', options: const ['Hoy', 'Mañana', '23/Agosto'], selected: 'Hoy', onChanged: (_) {})),
    );
    await tester.pumpAndSettle();
    expect(find.text('Hoy'), findsOneWidget);
    expect(find.text('Mañana'), findsOneWidget);
  });

  testWidgets('RecetappHomeTopBar and RecetappPageTopBar render', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: recetappTheme,
        home: Scaffold(
          appBar: RecetappHomeTopBar(profileName: 'Juan'),
          body: const Column(children: [RecetappPageTopBar(title: 'Título')]),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Juan'), findsOneWidget);
    expect(find.text('Título'), findsOneWidget);
  });

  testWidgets('RecetappBottomNav switches active item', (tester) async {
    await tester.pumpWidget(
      wrap(
        RecetappBottomNav(
          items: const [
            RecetappBottomNavItemData(icon: Icons.inventory_2_outlined, label: 'Tratamientos'),
            RecetappBottomNavItemData(icon: Icons.person_outline_rounded, label: 'Perfil'),
          ],
          currentIndex: 0,
          onTap: (_) {},
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Tratamientos'), findsOneWidget);
    expect(find.text('Perfil'), findsOneWidget);
  });

  testWidgets('RecetappProfileRow renders selected and unselected', (tester) async {
    await tester.pumpWidget(
      wrap(
        Column(
          children: [
            const RecetappProfileRow(name: 'Juan', subtitle: 'Persona · activo'),
            const RecetappProfileRow(name: 'Juan', subtitle: 'Persona · activo', selected: true),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Juan'), findsNWidgets(2));
  });

  testWidgets('RecetappTreatmentCard renders details', (tester) async {
    await tester.pumpWidget(
      wrap(
        const RecetappTreatmentCard(
          name: 'Ibuprofeno',
          presentation: 'Pastilla 500 mg',
          frequency: 'Cada 8 horas',
          duration: 'Tratamiento de 3 días',
          time: '05:00 pm',
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Ibuprofeno'), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
  });

  testWidgets('RecetappReminderCard renders actions', (tester) async {
    await tester.pumpWidget(
      wrap(
        RecetappReminderCard(
          title: 'Es hora de tu medicamento',
          subtitle: 'Ibuprofeno · 1 pastilla · 05:00 pm',
          onPostpone: () {},
          onTaken: () {},
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('POSPONER'), findsOneWidget);
    expect(find.text('YA LA TOMÉ'), findsOneWidget);
  });
}
