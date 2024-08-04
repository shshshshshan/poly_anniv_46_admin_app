import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    items = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MainSizes.defaultSpace),
      child: FutureBuilder<Column>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
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
    return const Column(children: []);
  }
}
