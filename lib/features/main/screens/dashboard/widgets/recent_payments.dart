import 'package:anniv_46_admin_app/common/widgets/placeholders/card_placeholder.dart';
import 'package:anniv_46_admin_app/features/main/controllers/dashboard/payment_stats_controller.dart';
import 'package:anniv_46_admin_app/features/main/controllers/registrants/registrant_controller.dart';
import 'package:anniv_46_admin_app/features/main/models/registrants/registrant.dart';
import 'package:anniv_46_admin_app/features/main/screens/registrants/widgets/registrant_card.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecentPayments extends StatefulWidget {
  const RecentPayments({super.key, this.isStriped = true});

  final bool isStriped;

  @override
  RecentPaymentsState createState() {
    return RecentPaymentsState();
  }
}

class RecentPaymentsState extends State<RecentPayments> {
  late Future<Column> items;
  static const maxRecentItems = 10;

  @override
  void initState() {
    super.initState();
    items = getItems();
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MainSizes.defaultSpace),
      child: FutureBuilder<Column>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
                children: List.generate(
                    5,
                    (_) => Shimmer.fromColors(
                        baseColor: dark ? MainColors.darkerGrey : MainColors.grey,
                        highlightColor:
                            dark ? MainColors.darkGrey : MainColors.light,
                        child: const CardPlaceholder())));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return snapshot.data ?? const Column(children: []);
          }
        },
      ),
    );
  }

  Future<Column> getItems() async {
    List<Widget> children = [];

    await RegistrantController.instance.fetchRegistrants();
    PaymentStatsController.instance.updateAll();

    int count = 0;
    for (Registrant? registrant in RegistrantController.instance.registrants) {
      if (count == maxRecentItems) {
        break;
      }

      children
          .add(RegistrantCard(registrant: registrant ?? Registrant.empty(), clickable: false));
      count++;
    }

    return Column(children: children);
  }
}
