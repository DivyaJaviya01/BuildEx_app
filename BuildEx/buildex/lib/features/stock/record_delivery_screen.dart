import 'package:flutter/material.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/app_date_field.dart';
import '../../resources/widgets/app_dropdown.dart';
import '../../resources/widgets/app_text_field.dart';
import '../../resources/widgets/primary_button.dart';

// Owner: Divya. Figma: Record Stock Delivery.png.
class RecordDeliveryScreen extends StatefulWidget {
  static const route = '/stock/record';
  const RecordDeliveryScreen({super.key});

  @override
  State<RecordDeliveryScreen> createState() => _RecordDeliveryScreenState();
}

class _RecordDeliveryScreenState extends State<RecordDeliveryScreen> {
  final _qty = TextEditingController();
  final _supplier = TextEditingController();
  final _note = TextEditingController();
  String? _material;
  String? _unit = 'Bags';

  @override
  void dispose() {
    _qty.dispose();
    _supplier.dispose();
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        title: 'Record Stock Delivery',
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppDropdown(
            label: 'Material Type',
            hint: 'Select Material',
            items: const ['Portland Cement', 'Coarse Sand', 'Rebar'],
            value: _material,
            onChanged: (v) => setState(() => _material = v),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AppTextField(label: 'Quantity Delivered', hint: '0.0', controller: _qty),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppDropdown(
                  label: 'Unit',
                  items: const ['Bags', 'CFT', 'Tons'],
                  value: _unit,
                  onChanged: (v) => setState(() => _unit = v),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const AppDateField(label: 'Delivery Date'),
          const SizedBox(height: 12),
          AppTextField(label: 'Supplier/Vendor Name', hint: 'Enter supplier name', controller: _supplier),
          const SizedBox(height: 12),
          AppTextField(
              label: 'Delivery Note/Comments',
              hint: 'Add any details about the delivery condition...',
              maxLines: 4,
              controller: _note),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(label: 'SUBMIT DELIVERY', onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
