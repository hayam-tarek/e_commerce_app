import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:e_commerce_app/views/widgets/custom_circle_avatar.dart';
import 'package:e_commerce_app/views/widgets/display_contact.dart';
import 'package:e_commerce_app/views/widgets/tapped_card.dart';
import 'package:e_commerce_app/views/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.userDataModel,
  });
  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CustomCircleAvatar(
            networkImageUrl: userDataModel.image,
          ),
          const SizedBox(height: 20),
          TitleText(text: userDataModel.name),
          const SizedBox(height: 10),
          DisplayContact(
            title: userDataModel.email,
            iconData: Icons.email_rounded,
          ),
          const SizedBox(height: 10),
          DisplayContact(
            title: userDataModel.phone,
            iconData: Icons.phone_rounded,
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
            height: 25,
          ),
          TappedCard(
            title: 'Update data',
            iconData: Icons.person,
            onTap: () {},
          ),
          TappedCard(
            title: 'Orders',
            iconData: Icons.shopping_basket_rounded,
            onTap: () {},
          ),
          TappedCard(
            title: 'Log out',
            iconData: Icons.logout_rounded,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
