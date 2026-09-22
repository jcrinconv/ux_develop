// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_medications_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduledMedicationsStore on _ScheduledMedicationsStore, Store {
  Computed<int>? _$scheduledDosesCountComputed;

  @override
  int get scheduledDosesCount =>
      (_$scheduledDosesCountComputed ??= Computed<int>(
        () => super.scheduledDosesCount,
        name: '_ScheduledMedicationsStore.scheduledDosesCount',
      )).value;
  Computed<int>? _$takenDosesCountComputed;

  @override
  int get takenDosesCount => (_$takenDosesCountComputed ??= Computed<int>(
    () => super.takenDosesCount,
    name: '_ScheduledMedicationsStore.takenDosesCount',
  )).value;

  late final _$medicationsAtom = Atom(
    name: '_ScheduledMedicationsStore.medications',
    context: context,
  );

  @override
  ObservableList<MedicationSchedule> get medications {
    _$medicationsAtom.reportRead();
    return super.medications;
  }

  @override
  set medications(ObservableList<MedicationSchedule> value) {
    _$medicationsAtom.reportWrite(value, super.medications, () {
      super.medications = value;
    });
  }

  late final _$_ScheduledMedicationsStoreActionController = ActionController(
    name: '_ScheduledMedicationsStore',
    context: context,
  );

  @override
  void addMedication(MedicationSchedule medication) {
    final _$actionInfo = _$_ScheduledMedicationsStoreActionController
        .startAction(name: '_ScheduledMedicationsStore.addMedication');
    try {
      return super.addMedication(medication);
    } finally {
      _$_ScheduledMedicationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTaken(String id) {
    final _$actionInfo = _$_ScheduledMedicationsStoreActionController
        .startAction(name: '_ScheduledMedicationsStore.toggleTaken');
    try {
      return super.toggleTaken(id);
    } finally {
      _$_ScheduledMedicationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medications: ${medications},
scheduledDosesCount: ${scheduledDosesCount},
takenDosesCount: ${takenDosesCount}
    ''';
  }
}
