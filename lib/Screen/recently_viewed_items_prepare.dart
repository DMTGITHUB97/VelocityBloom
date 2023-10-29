import 'package:flutter/material.dart';

class RecentlyViewedItems extends StatefulWidget {
  const RecentlyViewedItems({Key? key}) : super(key: key);

  @override
  State<RecentlyViewedItems> createState() => _RecentlyViewedItemsState();
}

class _RecentlyViewedItemsState extends State<RecentlyViewedItems> {
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
  Widget build(BuildContext context) {
    return SizedBox(
      child: Visibility(
        visible: recentlyViewedList.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recently Viewed Stores',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
