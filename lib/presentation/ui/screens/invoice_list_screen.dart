import 'package:crafty_bay/presentation/state_holders/invoice_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceListScreen extends StatefulWidget {
  const InvoiceListScreen({super.key});

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<InvoiceListController>().getInvoiceList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invoice List")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: GetBuilder<InvoiceListController>(
          builder: (controller) {
            if (controller.inProgress) {
              return const CenterProgressIndicator();
            } else if (controller.invoiceList.isEmpty) {
              return const Center(child: Text("No Invoice Found"));
            }
            return ListView.separated(
              itemCount: controller.invoiceList.length,
              separatorBuilder: (c, i) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text("Tran-Id: ${controller.invoiceList[index].tranId}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payment-status: ${controller.invoiceList[index].paymentStatus}"),
                      Text("Delivery-status: ${controller.invoiceList[index].deliveryStatus}"),
                    ],
                  ),
                  trailing:
                      Text("৳${controller.invoiceList[index].payable}", style: const TextStyle(fontSize: 15)),
                ));
              },
            );
          },
        ),
      ),
    );
  }
}
