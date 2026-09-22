/// Presentaciones de medicamento disponibles para una receta médica.
///
/// Cada una define cómo se ven sus campos "Dosis" (ej. de una unidad, con
/// su concentración cuando aplica) y "Cantidad de dosis a tomar" (la unidad
/// que se cuenta cada vez que suena la alarma: tabletas, cucharadas, etc.),
/// ya que ambos dependen de la presentación seleccionada.
enum MedicationPresentation {
  tablet(label: 'Tableta', doseHint: 'Ej. 1 Tableta de 500 mg', quantityUnit: 'Tabletas'),
  capsule(label: 'Cápsula', doseHint: 'Ej. 1 Cápsula de 250 mg', quantityUnit: 'Cápsulas'),
  syrup(label: 'Jarabe', doseHint: 'Ej. 1 Cucharada', quantityUnit: 'Cucharadas'),
  injection(label: 'Inyección', doseHint: 'Ej. 1 Ampolleta de 2 ml', quantityUnit: 'Ampolletas'),
  drops(label: 'Gotas', doseHint: 'Ej. 1 Gota', quantityUnit: 'Gotas'),
  cream(label: 'Crema', doseHint: 'Ej. 1 Aplicación', quantityUnit: 'Aplicaciones');

  const MedicationPresentation({required this.label, required this.doseHint, required this.quantityUnit});

  /// Texto mostrado en el selector de presentación.
  final String label;

  /// Caption/ejemplo para el campo "Dosis" de esta presentación.
  final String doseHint;

  /// Unidad (plural) para el campo "Cantidad de dosis a tomar" de esta
  /// presentación, ej. "Tabletas", "Cucharadas".
  final String quantityUnit;

  static MedicationPresentation? fromLabel(String label) {
    for (final presentation in values) {
      if (presentation.label == label) return presentation;
    }
    return null;
  }
}
