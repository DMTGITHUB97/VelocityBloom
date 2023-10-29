import 'package:flutter/material.dart';
import 'package:velocitybloom/Screen/application_product_const.dart';
import 'package:velocitybloom/Screen/product_modal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoriesMenuModal> categories = CategoryModalConst.listOfCategories;
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  bool isExpanded = false;
  late List<String> items;
  List<String> recentlyViewedList = [];

  void addToRecentlyViewed(String name, String image) {
    setState(() {
      final item = '$name - $image';
      recentlyViewedList.add(item);
      if (recentlyViewedList.length > 5) {
        recentlyViewedList.removeAt(0);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    items = CategoryModalConst.listOfCategories
        .map((category) => 'Item ${category.categoryName}')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCategoriesAppBar(),
      body: SafeArea(
        child: Row(
          children: [
            Container(
                width: 115,
                color: Colors.grey,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            _pageController.jumpToPage(index);
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: (selectedIndex == index) ? 80 : 0,
                              width: 6,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                color: Colors.white,
                                height: 80,
                                width: 90,
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      categories[index].image,
                                      height: 50,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child:
                                          Text(categories[index].categoryName),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
            Expanded(
                child: PageView(
              controller: _pageController,
              children: [
                _getForYou(),
                _getGrocery(),
                _getFashion(),
                _getAppliances(),
                _getMobiles(),
                _getElectronics(),
                _getHome(),
                _getFurniture(),
                _getToyAndCare(),
                _getPersonalCare(),
                _getFoodAndMore(),
                _getSports(),
                _getMedical()
              ],
            ))
          ],
        ),
      ),
    );
  }

  AppBar _buildCategoriesAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        'All Categories',
        style: TextStyle(color: Colors.grey),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black)),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget _getForYou() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
              child: Text(
                'Popular Store',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: isExpanded ? null : 200.0,
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: isExpanded ? items.length : 5,
                      itemBuilder: (context, index) {
                        final category =
                            CategoryModalConst.listOfCategories[index];
                        return GestureDetector(
                          onTap: () {
                            addToRecentlyViewed(
                              categories[index].categoryName,
                              categories[index].image,
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 65,
                                width: 65,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blueGrey,
                                ),
                                child: Image.asset(
                                  categories[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(categories[index].categoryName)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (!isExpanded)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                    child: const Text('View All'),
                  ),
                if (isExpanded)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                    child: const Text('Show Less'),
                  ),
              ],
            ),
            SizedBox(
              child: Visibility(
                visible: recentlyViewedList.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Recently Viewed Stores',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final item in recentlyViewedList)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildRecentlyViewedTile(item),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Trending Stores',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final category =
                            CategoryModalConst.listOfCategories[index];
                        return GestureDetector(
                          onTap: () {
                            addToRecentlyViewed(
                              categories[index].categoryName,
                              categories[index].image,
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 65,
                                width: 65,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blueGrey,
                                ),
                                child: Image.asset(
                                  categories[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(categories[index].categoryName)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getGrocery() {
    return Container(
      color: Colors.cyan,
      child: const Center(child: Text('Grocery')),
    );
  }

  Widget _getFashion() {
    return Container(
      color: Colors.purple,
      child: const Center(child: Text('Fashion')),
    );
  }

  Widget _getAppliances() {
    return Container(
      color: Colors.green,
      child: const Center(child: Text('Appliances')),
    );
  }

  Widget _getMobiles() {
    return Container(
      color: Colors.white70,
      child: const Center(child: Text('Mobiles')),
    );
  }

  Widget _getElectronics() {
    return Container(
      color: Colors.yellow,
      child: const Center(child: Text('Electronics')),
    );
  }

  Widget _getHome() {
    return Container(
      color: Colors.grey,
      child: const Center(child: Text('Home')),
    );
  }

  Widget _getFurniture() {
    return Container(
      color: Colors.greenAccent,
      child: const Center(child: Text('Furniture')),
    );
  }

  Widget _getToyAndCare() {
    return Container(
      color: Colors.deepOrange,
      child: const Center(child: Text('Toys and care')),
    );
  }

  Widget _getPersonalCare() {
    return Container(
      color: Colors.limeAccent,
      child: const Center(child: Text('PersonalCare')),
    );
  }

  Widget _getFoodAndMore() {
    return Container(
      color: Colors.tealAccent,
      child: const Center(child: Text('Food And More')),
    );
  }

  Widget _getSports() {
    return Container(
      color: Colors.purple,
      child: const Center(child: Text('Sports')),
    );
  }

  Widget _getMedical() {
    return Container(
      color: Colors.amber,
      child: const Center(child: Text('Medical')),
    );
  }

  Widget _buildRecentlyViewedTile(String item) {
    final parts = item.split(' - ');
    final name = parts[0];
    final image = parts[1];
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey,
          ),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        Text(name)
      ],
    );
  }
}
