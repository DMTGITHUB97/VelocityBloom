import 'package:flutter/material.dart';
import 'package:velocitybloom/Screen/account/browse_faqs.dart';
import 'package:velocitybloom/Screen/account/coupons.dart';
import 'package:velocitybloom/Screen/account/help_center.dart';
import 'package:velocitybloom/Screen/account/my_account.dart';
import 'package:velocitybloom/Screen/account/order.dart';
import 'package:velocitybloom/Screen/account/questions%20_Answers.dart';
import 'package:velocitybloom/Screen/account/reviews_screen.dart';
import 'package:velocitybloom/Screen/account/saved_address.dart';
import 'package:velocitybloom/Screen/account/saved_payment_modes.dart';
import 'package:velocitybloom/Screen/account/sell_product_on_app.dart';
import 'package:velocitybloom/Screen/account/terms_and_conditions.dart';
import 'package:velocitybloom/Screen/account/wishlist.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Hey! User', style: TextStyle(color: Colors.black)),
      ),
      body: _getAccountScreenBody(),
    );
  }

  Widget _getAccountScreenBody() {
    return SingleChildScrollView(
        child: SizedBox(
      child: Column(children: [
        _getButtonCard(),
        _getEmailUpdatedCard(),
        _getAccountSettingCard(),
        _getMyActivityCard(),
        _getEarnWithVelocityBloomCard(),
        _getFeedbackAndInformationCard(),
        _getLogOutBtn()
      ]),
    ));
  }

  Widget _getLogOutBtn() {
    return Container(
      width: double.infinity,
      height: 40,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.5),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: TextButton(
          onPressed: () {},
          child: const Text(
            'Log Out',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.purple),
          )),
    );
  }

  Widget _getMyActivityCard() {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('My Activity',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReviewsScreen()));
              },
              leading: Icon(
                Icons.rate_review_outlined,
                color: Colors.purple,
              ),
              title: Text('Reviews'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionsAnswersScreen()));
              },
              leading: Icon(
                Icons.messenger_outline,
                color: Colors.purple,
              ),
              title: Text('Questions & Answers'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
          ],
        ));
  }

  Widget _getEarnWithVelocityBloomCard() {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('Earn with Velocity Bloom',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellProductOnApp()));
              },
              leading: Icon(
                Icons.blinds_outlined,
                color: Colors.purple,
              ),
              title: Text('Sell on Velocity Bloom'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
          ],
        ));
  }

  Widget _getFeedbackAndInformationCard() {
    return Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('Feedback & Information',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsPoliciesLicencesScreen()));
              },
              leading: Icon(
                Icons.event_note_outlined,
                color: Colors.purple,
              ),
              title: Text('Terms, Policies and Licenses'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BrowseFAQsScreen()));
              },
              leading: Icon(
                Icons.info_outlined,
                color: Colors.purple,
              ),
              title: Text('Browse FAQs'),
              trailing: Icon(Icons.contact_support_outlined),
            ),
          ],
        ));
  }

  Widget _getAccountSettingCard() {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('Account Settings',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccount()));
              },
              leading: Icon(
                Icons.perm_identity_rounded,
                color: Colors.purple,
              ),
              title: Text('Edit Profile'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SavedPaymentModes()));
              },
              leading: Icon(
                Icons.wallet,
                color: Colors.purple,
              ),
              title: Text('Saved Cards & Wallets'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SavedAddressScreen()));
              },
              leading: Icon(
                Icons.location_on_outlined,
                color: Colors.purple,
              ),
              title: Text('Saved Addresses'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.sort_by_alpha_outlined,
                color: Colors.purple,
              ),
              title: Text('Select Language'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.edit_notifications_outlined,
                color: Colors.purple,
              ),
              title: Text('Notification Settings'),
              trailing: Icon(Icons.chevron_right_outlined),
            ),
          ],
        ));
  }

  Widget _getEmailUpdatedCard() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyAccount()));
          },
          leading: const Icon(
            Icons.mail,
            size: 40,
            color: Colors.purple,
          ),
          title: const Text('Add/Verify your Email'),
          subtitle: const Text('Get latest updates of your orders'),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white)),
                backgroundColor: MaterialStateProperty.all(Colors.purple)),
            child: const Text(
              "Update",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }

  Widget _getButtonCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Orders()));
                          },
                          icon: const Icon(Icons.inventory_2_outlined),
                          label: const Text(
                            'Orders',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              iconColor: MaterialStateProperty.all(
                                  Colors.purpleAccent),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(color: Colors.grey))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WishlistScreen()));
                        },
                        icon: const Icon(Icons.favorite_outline),
                        label: const Text(
                          'Wishlist',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            iconColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(color: Colors.grey))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CouponsScreen()));
                          },
                          icon: const Icon(Icons.card_giftcard_outlined),
                          label: const Text(
                            'Coupons',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              iconColor: MaterialStateProperty.all(
                                  Colors.purpleAccent),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(color: Colors.grey))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpCenterScreen()));
                        },
                        icon: const Icon(Icons.headset_mic_outlined),
                        label: const Text(
                          'Help Center',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            iconColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(color: Colors.grey))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
