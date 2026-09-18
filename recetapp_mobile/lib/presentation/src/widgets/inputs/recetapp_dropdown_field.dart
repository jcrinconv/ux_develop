import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Caja con valor seleccionado + flecha que, al tocarse, despliega la lista
/// de opciones justo debajo de sí misma. Es la pieza base de
/// [RecetappSelectField] y [RecetappTimePicker].
class RecetappDropdownField extends StatefulWidget {
  const RecetappDropdownField({super.key, required this.value, required this.options, required this.onChanged, this.width, this.textStyle});

  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;
  final double? width;
  final TextStyle? textStyle;

  @override
  State<RecetappDropdownField> createState() => _RecetappDropdownFieldState();
}

class _RecetappDropdownFieldState extends State<RecetappDropdownField> {
  bool _expanded = false;

  void _toggle() => setState(() => _expanded = !_expanded);

  void _select(String option) {
    widget.onChanged(option);
    setState(() => _expanded = false);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = widget.textStyle ?? RecetappTextStyles.body1Bold.copyWith(color: RecetappThemeColors.textPrimary);

    final Widget field = InkWell(
      onTap: _toggle,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: _expanded ? RecetappThemeColors.primary : RecetappThemeColors.mint, width: _expanded ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: widget.width == null ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(widget.value, style: style, overflow: TextOverflow.ellipsis)),
            const SizedBox(width: 8),
            Icon(_expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: RecetappThemeColors.textPrimary),
          ],
        ),
      ),
    );

    if (!_expanded) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        field,
        const SizedBox(height: 8),
        Container(
          width: widget.width,
          decoration: BoxDecoration(border: Border.all(color: RecetappThemeColors.mint), borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < widget.options.length; i++) ...[
                InkWell(
                  onTap: () => _select(widget.options[i]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Align(alignment: Alignment.centerLeft, child: Text(widget.options[i], style: RecetappTextStyles.body1)),
                  ),
                ),
                if (i != widget.options.length - 1) Divider(height: 1, color: RecetappThemeColors.darkGreen.withValues(alpha: 0.1)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
