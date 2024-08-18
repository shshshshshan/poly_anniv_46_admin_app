import 'package:anniv_46_admin_app/common/widgets/appbar/appbar.dart';
import 'package:anniv_46_admin_app/common/widgets/loaders/loaders.dart';
import 'package:anniv_46_admin_app/data/services/registrants_sheets_api.dart';
import 'package:anniv_46_admin_app/features/main/models/registrants/registrant.dart';
import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:anniv_46_admin_app/utils/device/device_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PaymentStatusEdit extends StatefulWidget {
  const PaymentStatusEdit({super.key, required this.registrant});

  final Registrant registrant;

  @override
  PaymentStatusEditState createState() => PaymentStatusEditState();
}

class PaymentStatusEditState extends State<PaymentStatusEdit> {
  PaymentStatus? paymentStatus;

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
                initialSelection: paymentStatus,
                width: MainDeviceUtils.getScreenWidth(context) -
                    MainSizes.defaultSpace * 2,
                leadingIcon: const Icon(Iconsax.money),
                onSelected: (value) {
                  setState(() {
                    paymentStatus = value;
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                dropdownMenuEntries: PaymentStatus.values
                    .where((value) => value != widget.registrant.paymentStatus)
                    .map((value) =>
                        DropdownMenuEntry(value: value, label: value.name))
                    .toList(),
                label: const Text('Select ${MainTexts.paymentStatus}'),
              ),
            ),

            const SizedBox(height: MainSizes.sectionGap),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (paymentStatus == null) {
                    throw 'Payment status cannot be null';
                  }

                  if (paymentStatus == widget.registrant.paymentStatus) {
                    MainLoaders.warningSnackbar(
                        title: 'Warning',
                        message: 'Cannot set the same payment status.');
                    return;
                  }

                  final updatedRegistrant = Registrant(
                      timestamp: widget.registrant.timestamp,
                      name: widget.registrant.name,
                      email: widget.registrant.email,
                      gender: widget.registrant.gender,
                      nickname: widget.registrant.nickname,
                      batchYear: widget.registrant.batchYear,
                      modeOfPayment: widget.registrant.modeOfPayment,
                      gcashName: widget.registrant.gcashName,
                      gcashRefId: widget.registrant.gcashRefId,
                      isPartialPayment: widget.registrant.isPartialPayment,
                      paymentStatus: paymentStatus!);

                  bool updated = false;

                  try {
                    updated = await RegistrantsSheetsApi.updateRegistrant(
                        updatedRegistrant);

                    if (!updated) throw Error();
                  } catch (e) {
                    MainLoaders.errorSnackbar(
                        title: 'Oops!', message: 'Something went wrong');
                    if (kDebugMode) print(e);
                    return;
                  }

                  if (updated) {
                    Get.back();

                    MainLoaders.successSnackbar(
                        title: 'Success!',
                        message: 'Payment status successfully updated.');
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
