import 'package:crafty_bay/presentation/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/payment_web_view_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CreateInvoiceController>().createInvoice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: GetBuilder<CreateInvoiceController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenterProgressIndicator();
        }
        final invoiceData = controller.paymentMethodListModel.paymentMethodList!.first;
        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payable: ${invoiceData.payable}", style: TextStyle(fontSize: 20)),
              Text("Vat: ${invoiceData.vat}"),
              Text("Total: ${invoiceData.total}"),
              SizedBox(height: 10),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: invoiceData.paymentMethod?.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: Image.network(invoiceData.paymentMethod?[index].logo ?? '', width: 50),
                      title: Text(invoiceData.paymentMethod?[index].name ?? ''),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Get.to(() =>
                            PaymentWebViewScreen(url: invoiceData.paymentMethod![index].redirectGatewayURL!));
                      },
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
