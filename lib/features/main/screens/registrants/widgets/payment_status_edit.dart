import 'package:anniv_46_admin_app/common/widgets/appbar/appbar.dart';
import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:anniv_46_admin_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PaymentStatusEdit extends StatefulWidget {
  const PaymentStatusEdit({super.key, required this.status});

  final PaymentStatus status;

  @override
  PaymentStatusEditState createState() => PaymentStatusEditState();
}

class PaymentStatusEditState extends State<PaymentStatusEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        showBackArrow: true,
        title: Text('Edit ${MainTexts.paymentStatus}',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MainSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              'Double-check the payment when changing the payment status.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: MainSizes.sectionGap),

            // Text fields
            Form(
              child: DropdownMenu(
                initialSelection: widget.status,
                width: MainDeviceUtils.getScreenWidth(context) -
                    MainSizes.defaultSpace * 2,
                leadingIcon: const Icon(Iconsax.money),
                onSelected: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                dropdownMenuEntries: PaymentStatus.values.map((value) {
                  return DropdownMenuEntry(value: value, label: value.name);
                }).toList(),
                label: const Text('Select ${MainTexts.paymentStatus}'),
              ),
            ),

            const SizedBox(height: MainSizes.sectionGap),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
