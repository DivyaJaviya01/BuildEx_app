import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/info_card.dart';
import '../../resources/widgets/primary_button.dart';
import 'record_delivery_screen.dart';
import 'widgets/stock_card.dart';

// Owner: Divya. Figma: Material Stock Panel.png.
class MaterialStockScreen extends StatelessWidget {
  static const route = '/stock';
  const MaterialStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildExAppBar(
        title: 'Material Stock Panel',
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          InfoCard(
            child: Row(
              children: [
                Icon(Icons.inventory_2_outlined, size: 32, color: AppColors.primary),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('3 Materials Tracked', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                    Text('Active Site Inventory',
                        style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          StockCard(
            name: 'Portland Cement',
            qty: '250 / 300 bags',
            threshold: 'Threshold: 300',
            badge: 'LOW STOCK',
            badgeColor: AppColors.danger,
            level: 0.83,
            barColor: AppColors.danger,
          ),
          SizedBox(height: 10),
          StockCard(
            name: 'Coarse Sand',
            qty: '1,200 CFT remaining',
            badge: 'ON TRACK',
            badgeColor: Color(0xFF388E3C),
            level: 0.7,
            barColor: AppColors.primary,
          ),
          SizedBox(height: 10),
          StockCard(
            name: 'Rebar',
            qty: '15 tons remaining',
            badge: 'ARRIVING',
            badgeColor: Color(0xFFB78A00),
            level: 0.35,
            barColor: AppColors.accent,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          label: '+  Record Stock Delivery',
          onPressed: () => Navigator.pushNamed(context, RecordDeliveryScreen.route),
        ),
      ),
    );
  }
}
