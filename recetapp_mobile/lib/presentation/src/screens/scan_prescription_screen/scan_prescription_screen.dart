import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

const scanPrescriptionScreenRoute = '/scanPrescriptionScreenRoute';

class ScanPrescriptionScreen extends StatefulWidget {
  const ScanPrescriptionScreen({super.key});

  @override
  State<ScanPrescriptionScreen> createState() => _ScanPrescriptionScreenState();
}

class _ScanPrescriptionScreenState extends State<ScanPrescriptionScreen> with WidgetsBindingObserver {
  final navigationService = locator<NavigationService>();

  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  String? _error;

  final GlobalKey _stackKey = GlobalKey();
  final GlobalKey _frameKey = GlobalKey();
  Rect? _frameRect;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  @override
  void didChangeMetrics() => _measureFrame();

  void _measureFrame() {
    final stackBox = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    final frameBox = _frameKey.currentContext?.findRenderObject() as RenderBox?;
    if (stackBox == null || frameBox == null || !stackBox.hasSize || !frameBox.hasSize) return;
    final origin = frameBox.localToGlobal(Offset.zero, ancestor: stackBox);
    final rect = origin & frameBox.size;
    if (rect != _frameRect) setState(() => _frameRect = rect);
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(backCamera, ResolutionPreset.high, enableAudio: false);
      _initializeControllerFuture = controller.initialize();
      await _initializeControllerFuture;
      if (!mounted) return;
      setState(() => _controller = controller);
    } on CameraException {
      if (!mounted) return;
      setState(() => _error = 'No pudimos acceder a la cámara. Revisa los permisos de la app.');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      controller.dispose();
      _controller = null;
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized || controller.value.isTakingPicture) return;
    await controller.takePicture();
    // TODO: enviar la foto capturada a reconocimiento (OCR) y precargar
    // PrescriptionDetailsScreen con los datos extraídos de la receta.
    if (!mounted) return;
    navigationService.navigateToNamedRemoveCurrent(prescriptionDetailsScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureFrame());
    return Scaffold(
      appBar: const RecetappPageTopBar(title: 'Escanear receta'),
      body: SafeArea(
        child: Stack(
          key: _stackKey,
          fit: StackFit.expand,
          children: [
            _CameraPreview(controller: _controller, error: _error),
            CustomPaint(
              painter: _SpotlightPainter(
                holeRect: _frameRect,
                overlayColor: Colors.black.withValues(alpha: 0.7),
                borderColor: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
                  child: Text(
                    'Toma una foto de tu receta médica',
                    style: RecetappTextStyles.formLabel.copyWith(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                      child: AspectRatio(key: _frameKey, aspectRatio: 3 / 4, child: const SizedBox.shrink()),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 29.h, bottom: 14.h),
                  child: _ShutterButton(onTap: _takePicture),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 43.h),
                  child: RecetappButton(
                    label: 'Ingresar manualmente',
                    variant: RecetappButtonVariant.text,
                    color: RecetappThemeColors.primary,
                    onPressed: () => navigationService.navigateToNamedRemoveCurrent(prescriptionDetailsScreenRoute),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CameraPreview extends StatelessWidget {
  const _CameraPreview({required this.controller, required this.error});

  final CameraController? controller;
  final String? error;

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return ColoredBox(
        color: Colors.black,
        child: Center(
          child: Text(
            error!,
            textAlign: TextAlign.center,
            style: RecetappTextStyles.body1.copyWith(color: Colors.white),
          ),
        ),
      );
    }
    final controller = this.controller;
    if (controller == null || !controller.value.isInitialized) {
      return const ColoredBox(
        color: Colors.black,
        child: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }
    final previewSize = controller.value.previewSize!;
    return ColoredBox(
      color: Colors.black,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(width: previewSize.height, height: previewSize.width, child: CameraPreview(controller)),
      ),
    );
  }
}

class _ShutterButton extends StatelessWidget {
  const _ShutterButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 68.w,
        height: 68.h,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(BorderSide(color: RecetappThemeColors.primary, width: 2.w)),
        ),
        child: const DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: RecetappThemeColors.primary),
        ),
      ),
    );
  }
}

/// Pinta un overlay oscuro que cubre todo el canvas excepto un recuadro
/// (`holeRect`), donde queda transparente para dejar ver la cámara. El
/// recuadro se resalta además con un borde punteado.
class _SpotlightPainter extends CustomPainter {
  const _SpotlightPainter({
    required this.holeRect,
    required this.overlayColor,
    required this.borderColor,
    this.radius = 12,
    this.strokeWidth = 1.5,
    this.dashWidth = 6,
    this.dashSpace = 5,
  });

  final Rect? holeRect;
  final Color overlayColor;
  final Color borderColor;
  final double radius;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Offset.zero & size);
    final rect = holeRect;
    if (rect == null) {
      canvas.drawPath(backgroundPath, Paint()..color = overlayColor);
      return;
    }

    final holeRRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final holePath = Path()..addRRect(holeRRect);
    final overlayPath = Path.combine(PathOperation.difference, backgroundPath, holePath);
    canvas.drawPath(overlayPath, Paint()..color = overlayColor);

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    final dashed = Path();
    for (final metric in holePath.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final double next = distance + dashWidth;
        dashed.addPath(metric.extractPath(distance, next.clamp(0, metric.length)), Offset.zero);
        distance = next + dashSpace;
      }
    }
    canvas.drawPath(dashed, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _SpotlightPainter oldDelegate) =>
      oldDelegate.holeRect != holeRect ||
      oldDelegate.overlayColor != overlayColor ||
      oldDelegate.borderColor != borderColor ||
      oldDelegate.radius != radius ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.dashWidth != dashWidth ||
      oldDelegate.dashSpace != dashSpace;
}
