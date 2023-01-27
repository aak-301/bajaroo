import 'package:bajaroo/providers/orders.dart' show Orders;
import 'package:bajaroo/widgets/app_drawer.dart';
import 'package:bajaroo/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: ((context, i) => OrderItem(order: orderData.orders[i])),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
