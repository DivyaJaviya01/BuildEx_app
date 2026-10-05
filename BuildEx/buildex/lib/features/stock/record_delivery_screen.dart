import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: Record Stock Delivery.
class RecordDeliveryScreen extends StatelessWidget {
  static const route = '/stock/record';
  const RecordDeliveryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: delivery form only, submit returns to stock panel (static).
    return const Scaffold(appBar: BuildExAppBar(title: 'Record Stock Delivery'), body: Center(child: Text('Record Stock Delivery — TODO')));
  }
}
