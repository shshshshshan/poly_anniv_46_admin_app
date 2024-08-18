import 'package:anniv_46_admin_app/features/main/models/registrants/registrant.dart';
import 'package:anniv_46_admin_app/common/widgets/appbar/appbar.dart';
import 'package:anniv_46_admin_app/common/widgets/authentication/label.dart';
import 'package:anniv_46_admin_app/common/widgets/loaders/loaders.dart';
import 'package:anniv_46_admin_app/common/widgets/profile/profile_menu.dart';
import 'package:anniv_46_admin_app/common/widgets/texts/section_heading.dart';
import 'package:anniv_46_admin_app/features/main/screens/registrants/widgets/payment_status_edit.dart';
import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegistrantView extends StatefulWidget {
  const RegistrantView({super.key, required this.registrant});

  final Registrant registrant;

  @override
  State<RegistrantView> createState() => RegistrantViewState();
}

class RegistrantViewState extends State<RegistrantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        showBackArrow: true,
        title: Text(MainTexts.registrantsViewTitle,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MainSizes.defaultSpace),
          child: Column(
            children: [
              const MainSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: MainSizes.itemGap),
              MainProfileMenu(
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: widget.registrant.name))
                        .then((_) {
                      MainLoaders.successSnackbar(
                          title: MainTexts.copySuccessTitle,
                          message: MainTexts.copySuccessSubtitle);
                    });
                  },
                  title: MainTexts.fullName,
                  value: widget.registrant.name),
              MainProfileMenu(
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: widget.registrant.name))
                        .then((_) {
                      MainLoaders.successSnackbar(
                          title: MainTexts.copySuccessTitle,
                          message: MainTexts.copySuccessTitle);
                    });
                  },
                  title: MainTexts.email,
                  value: widget.registrant.email),
              MainProfileMenu(
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: widget.registrant.name))
                        .then((_) {
                      MainLoaders.successSnackbar(
                          title: MainTexts.copySuccessTitle,
                          message: MainTexts.copySuccessTitle);
                    });
                  },
                  title: MainTexts.nickName,
                  value: widget.registrant.nickname),
              MainProfileMenu(
                  icon: null,
                  title: MainTexts.gender,
                  value: widget.registrant.gender!.titleName,
                  textColor: widget.registrant.gender!.color),
              MainProfileMenu(
                  icon: null,
                  title: MainTexts.batch,
                  value: widget.registrant.batchYear),
              const SizedBox(height: MainSizes.sectionGap),
              const MainSectionHeading(
                  title: 'Payment Information', showActionButton: false),
              const SizedBox(height: MainSizes.itemGap),
              MainProfileMenu(
                  icon: null,
                  title: MainTexts.modePayment,
                  value: widget.registrant.modeOfPayment!.name),
              MainProfileMenu(
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: widget.registrant.name))
                        .then((_) {
                      MainLoaders.successSnackbar(
                          title: MainTexts.copySuccessTitle,
                          message: MainTexts.copySuccessTitle);
                    });
                  },
                  title: MainTexts.gcashName,
                  value: widget.registrant.gcashName),
              MainProfileMenu(
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: widget.registrant.name))
                        .then((_) {
                      MainLoaders.successSnackbar(
                          title: MainTexts.copySuccessTitle,
                          message: MainTexts.copySuccessTitle);
                    });
                  },
                  title: MainTexts.gcashRefId,
                  value: widget.registrant.gcashRefId),
              MainProfileMenu(
                  icon: null,
                  title: MainTexts.partialPayment,
                  value: widget.registrant.isPartialPayment),
              MainProfileMenu(
                  onPressed: () => Get.to(() => PaymentStatusEdit(registrant: widget.registrant)),
                  title: MainTexts.paymentStatus,
                  value: widget.registrant.paymentStatus!.name,
                  textColor: widget.registrant.paymentStatus!.color),
              const SizedBox(height: MainSizes.sectionGap * 2),
              MainLabel(
                  labelText: 'Register Time: ${widget.registrant.timestamp}'),
            ],
          ),
        ),
      ),
    );
  }
}
