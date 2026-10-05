import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Jainil. Figma: Material Log.
class MaterialLogScreen extends StatelessWidget {
  static const route = '/material-log';
  const MaterialLogScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: Material Type + Quantity + Unit + ADD TO RECORD + recent entries + SAVE MATERIAL LOG.
    return const Scaffold(appBar: BuildExAppBar(title: 'Material Log'), body: Center(child: Text('Material Log — TODO')));
  }
}
