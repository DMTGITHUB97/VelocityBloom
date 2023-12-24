import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocitybloom/presentation/account/browse_faqs.dart';
import 'package:velocitybloom/presentation/account/coupons.dart';
import 'package:velocitybloom/presentation/account/help_center.dart';
import 'package:velocitybloom/presentation/account/my_account.dart';
import 'package:velocitybloom/presentation/account/order.dart';
import 'package:velocitybloom/presentation/account/questions%20_Answers.dart';
import 'package:velocitybloom/presentation/account/reviews_screen.dart';
import 'package:velocitybloom/presentation/account/saved_address.dart';
import 'package:velocitybloom/presentation/account/saved_payment_modes.dart';
import 'package:velocitybloom/presentation/account/sell_product_on_app.dart';
import 'package:velocitybloom/presentation/account/terms_and_conditions.dart';
import 'package:velocitybloom/presentation/account/wishlist.dart';
import 'package:velocitybloom/presentation/user/login.dart';

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
          onPressed: () {handleLogout();},
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
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('My Activity',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ReviewsScreen()));
              },
              leading: const Icon(
                Icons.rate_review_outlined,
                color: Colors.purple,
              ),
              title: const Text('Reviews'),
              trailing: const Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionsAnswersScreen()));
              },
              leading: const Icon(
                Icons.messenger_outline,
                color: Colors.purple,
              ),
              title: const Text('Questions & Answers'),
              trailing: const Icon(Icons.chevron_right_outlined),
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
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('Earn with Velocity Bloom',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SellProductOnApp()));
              },
              leading: const Icon(
                Icons.blinds_outlined,
                color: Colors.purple,
              ),
              title: const Text('Sell on Velocity Bloom'),
              trailing: const Icon(Icons.chevron_right_outlined),
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
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('Feedback & Information',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsPoliciesLicencesScreen()));
              },
              leading: const Icon(
                Icons.event_note_outlined,
                color: Colors.purple,
              ),
              title: const Text('Terms, Policies and Licenses'),
              trailing: const Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BrowseFAQsScreen()));
              },
              leading: const Icon(
                Icons.info_outlined,
                color: Colors.purple,
              ),
              title: const Text('Browse FAQs'),
              trailing: const Icon(Icons.contact_support_outlined),
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
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15),
              child: Text('Account Settings',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyAccount()));
              },
              leading: const Icon(
                Icons.perm_identity_rounded,
                color: Colors.purple,
              ),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SavedPaymentModes()));
              },
              leading: const Icon(
                Icons.wallet,
                color: Colors.purple,
              ),
              title: const Text('Saved Cards & Wallets'),
              trailing: const Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SavedAddressScreen()));
              },
              leading: const Icon(
                Icons.location_on_outlined,
                color: Colors.purple,
              ),
              title: const Text('Saved Addresses'),
              trailing: const Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.sort_by_alpha_outlined,
                color: Colors.purple,
              ),
              title: const Text('Select Language'),
              trailing: const Icon(Icons.chevron_right_outlined),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.edit_notifications_outlined,
                color: Colors.purple,
              ),
              title: const Text('Notification Settings'),
              trailing: const Icon(Icons.chevron_right_outlined),
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
                context, MaterialPageRoute(builder: (context) => const MyAccount()));
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
                  MaterialPageRoute(builder: (context) => const MyAccount()));
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
                                    builder: (context) => const Orders()));
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
                                  builder: (context) => const WishlistScreen()));
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
                                    builder: (context) => const CouponsScreen()));
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
                                  builder: (context) => const HelpCenterScreen()));
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

  void handleLogout() {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>
        const LoginScreen()));
  }
}
