// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrescriptionDetailsStore on _PrescriptionDetailsStore, Store {
  Computed<String>? _$doseCaptionComputed;

  @override
  String get doseCaption => (_$doseCaptionComputed ??= Computed<String>(
    () => super.doseCaption,
    name: '_PrescriptionDetailsStore.doseCaption',
  )).value;
  Computed<String>? _$doseQuantityCaptionComputed;

  @override
  String get doseQuantityCaption =>
      (_$doseQuantityCaptionComputed ??= Computed<String>(
        () => super.doseQuantityCaption,
        name: '_PrescriptionDetailsStore.doseQuantityCaption',
      )).value;

  late final _$presentationAtom = Atom(
    name: '_PrescriptionDetailsStore.presentation',
    context: context,
  );

  @override
  String get presentation {
    _$presentationAtom.reportRead();
    return super.presentation;
  }

  @override
  set presentation(String value) {
    _$presentationAtom.reportWrite(value, super.presentation, () {
      super.presentation = value;
    });
  }

  late final _$startDayAtom = Atom(
    name: '_PrescriptionDetailsStore.startDay',
    context: context,
  );

  @override
  String get startDay {
    _$startDayAtom.reportRead();
    return super.startDay;
  }

  @override
  set startDay(String value) {
    _$startDayAtom.reportWrite(value, super.startDay, () {
      super.startDay = value;
    });
  }

  late final _$hourAtom = Atom(
    name: '_PrescriptionDetailsStore.hour',
    context: context,
  );

  @override
  String get hour {
    _$hourAtom.reportRead();
    return super.hour;
  }

  @override
  set hour(String value) {
    _$hourAtom.reportWrite(value, super.hour, () {
      super.hour = value;
    });
  }

  late final _$minuteAtom = Atom(
    name: '_PrescriptionDetailsStore.minute',
    context: context,
  );

  @override
  String get minute {
    _$minuteAtom.reportRead();
    return super.minute;
  }

  @override
  set minute(String value) {
    _$minuteAtom.reportWrite(value, super.minute, () {
      super.minute = value;
    });
  }

  late final _$periodAtom = Atom(
    name: '_PrescriptionDetailsStore.period',
    context: context,
  );

  @override
  String get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(String value) {
    _$periodAtom.reportWrite(value, super.period, () {
      super.period = value;
    });
  }

  late final _$nameErrorAtom = Atom(
    name: '_PrescriptionDetailsStore.nameError',
    context: context,
  );

  @override
  String? get nameError {
    _$nameErrorAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String? value) {
    _$nameErrorAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  late final _$presentationErrorAtom = Atom(
    name: '_PrescriptionDetailsStore.presentationError',
    context: context,
  );

  @override
  String? get presentationError {
    _$presentationErrorAtom.reportRead();
    return super.presentationError;
  }

  @override
  set presentationError(String? value) {
    _$presentationErrorAtom.reportWrite(value, super.presentationError, () {
      super.presentationError = value;
    });
  }

  late final _$doseErrorAtom = Atom(
    name: '_PrescriptionDetailsStore.doseError',
    context: context,
  );

  @override
  String? get doseError {
    _$doseErrorAtom.reportRead();
    return super.doseError;
  }

  @override
  set doseError(String? value) {
    _$doseErrorAtom.reportWrite(value, super.doseError, () {
      super.doseError = value;
    });
  }

  late final _$doseQuantityErrorAtom = Atom(
    name: '_PrescriptionDetailsStore.doseQuantityError',
    context: context,
  );

  @override
  String? get doseQuantityError {
    _$doseQuantityErrorAtom.reportRead();
    return super.doseQuantityError;
  }

  @override
  set doseQuantityError(String? value) {
    _$doseQuantityErrorAtom.reportWrite(value, super.doseQuantityError, () {
      super.doseQuantityError = value;
    });
  }

  late final _$durationErrorAtom = Atom(
    name: '_PrescriptionDetailsStore.durationError',
    context: context,
  );

  @override
  String? get durationError {
    _$durationErrorAtom.reportRead();
    return super.durationError;
  }

  @override
  set durationError(String? value) {
    _$durationErrorAtom.reportWrite(value, super.durationError, () {
      super.durationError = value;
    });
  }

  late final _$hoursBetweenDosesErrorAtom = Atom(
    name: '_PrescriptionDetailsStore.hoursBetweenDosesError',
    context: context,
  );

  @override
  String? get hoursBetweenDosesError {
    _$hoursBetweenDosesErrorAtom.reportRead();
    return super.hoursBetweenDosesError;
  }

  @override
  set hoursBetweenDosesError(String? value) {
    _$hoursBetweenDosesErrorAtom.reportWrite(
      value,
      super.hoursBetweenDosesError,
      () {
        super.hoursBetweenDosesError = value;
      },
    );
  }

  late final _$availableDosesErrorAtom = Atom(
    name: '_PrescriptionDetailsStore.availableDosesError',
    context: context,
  );

  @override
  String? get availableDosesError {
    _$availableDosesErrorAtom.reportRead();
    return super.availableDosesError;
  }

  @override
  set availableDosesError(String? value) {
    _$availableDosesErrorAtom.reportWrite(value, super.availableDosesError, () {
      super.availableDosesError = value;
    });
  }

  late final _$_PrescriptionDetailsStoreActionController = ActionController(
    name: '_PrescriptionDetailsStore',
    context: context,
  );

  @override
  void setPresentation(String value) {
    final _$actionInfo = _$_PrescriptionDetailsStoreActionController
        .startAction(name: '_PrescriptionDetailsStore.setPresentation');
    try {
      return super.setPresentation(value);
    } finally {
      _$_PrescriptionDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartDay(String value) {
    final _$actionInfo = _$_PrescriptionDetailsStoreActionController
        .startAction(name: '_PrescriptionDetailsStore.setStartDay');
    try {
      return super.setStartDay(value);
    } finally {
      _$_PrescriptionDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHour(String value) {
    final _$actionInfo = _$_PrescriptionDetailsStoreActionController
        .startAction(name: '_PrescriptionDetailsStore.setHour');
    try {
      return super.setHour(value);
    } finally {
      _$_PrescriptionDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinute(String value) {
    final _$actionInfo = _$_PrescriptionDetailsStoreActionController
        .startAction(name: '_PrescriptionDetailsStore.setMinute');
    try {
      return super.setMinute(value);
    } finally {
      _$_PrescriptionDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeriod(String value) {
    final _$actionInfo = _$_PrescriptionDetailsStoreActionController
        .startAction(name: '_PrescriptionDetailsStore.setPeriod');
    try {
      return super.setPeriod(value);
    } finally {
      _$_PrescriptionDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool submit() {
    final _$actionInfo = _$_PrescriptionDetailsStoreActionController
        .startAction(name: '_PrescriptionDetailsStore.submit');
    try {
      return super.submit();
    } finally {
      _$_PrescriptionDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
presentation: ${presentation},
startDay: ${startDay},
hour: ${hour},
minute: ${minute},
period: ${period},
nameError: ${nameError},
presentationError: ${presentationError},
doseError: ${doseError},
doseQuantityError: ${doseQuantityError},
durationError: ${durationError},
hoursBetweenDosesError: ${hoursBetweenDosesError},
availableDosesError: ${availableDosesError},
doseCaption: ${doseCaption},
doseQuantityCaption: ${doseQuantityCaption}
    ''';
  }
}
