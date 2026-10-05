import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: M2. Figma: Material Stock Panel (builder).
class MaterialStockScreen extends StatelessWidget {
  static const route = '/stock';
  const MaterialStockScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: remaining qty + low-stock flags + Record Stock Delivery button.
    return const Scaffold(appBar: BuildExAppBar(title: 'Material Stock'), body: Center(child: Text('Material Stock — TODO')));
  }
}
