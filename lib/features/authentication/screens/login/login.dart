import 'package:anniv_46_admin_app/common/styles/spacing_styles.dart';
import 'package:anniv_46_admin_app/common/widgets/authentication/label.dart';
import 'package:anniv_46_admin_app/common/widgets/authentication/social_icons.dart';
import 'package:anniv_46_admin_app/common/widgets/dividers/divider.dart';
import 'package:anniv_46_admin_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:anniv_46_admin_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MainSpacingStyle.paddingWithAppBarHeight,
          child: Column(children: [
            // Logo, Title, Sub-title
            MainLoginHeader(),

            // Form
            MainLoginForm(),

            MainDivider(dividerText: MainTexts.optionalAltLoginText),

            SizedBox(height: MainSizes.sectionGap),

            SocialIcons(),

            SizedBox(height: MainSizes.sectionGap),

            MainLabel(labelText: MainTexts.copyRight)
          ]),
        ),
      ),
    );
  }
}
