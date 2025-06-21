import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔷 HEADER
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 4,
                left: 16,
                right: 8,
                bottom: 8,
              ),
              height: MediaQuery.of(context).padding.top + 68,
              color: const Color(0xFF5dccd8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Explore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          // TODO: Navigate to Search page
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {
                          // TODO: Navigate to Wishlist
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                        onPressed: () {
                          // TODO: Navigate to Cart
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12), // smaller gap

            // 🔹 WEAR THE TREND Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WEAR THE TREND',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Our hottest collections',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Horizontal Product Slider
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 16),
                  buildProductCard('lib/assets/images/sunglasses/sunglass1.png', 'Blend Edit'),
                  buildProductCard('lib/assets/images/sunglasses/sunglass2.png', 'Air Clip On'),
                  buildProductCard('lib/assets/images/sunglasses/sunglass3.png', 'Air Flex'),
                  buildProductCard('lib/assets/images/sunglasses/sunglass4.png', 'Retro Aviator'),
                  const SizedBox(width: 16),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // 🔹 TabBar
            const TabBar(
              labelColor: Color(0xFF03033E),
              unselectedLabelColor: Colors.black54,
              indicatorColor: Color(0xFF5dccd8),
              indicatorWeight: 3,
              tabs: [
                Tab(text: 'Men'),
                Tab(text: 'Women'),
                Tab(text: 'Kids'),
              ],
            ),

            // 🔹 Tab Views
            Expanded(
              child: TabBarView(
                children: [
                  buildTabGrid([
                    {
                      "title": "Casual Cool",
                      "image": "lib/assets/images/men/men1.png",
                    },
                    {
                      "title": "Work Mode",
                      "image": "lib/assets/images/men/men2.png",
                    },
                    {
                      "title": "Sporty Edge",
                      "image": "lib/assets/images/men/men3.png",
                    },
                    {
                      "title": "Vintage Vibes",
                      "image": "lib/assets/images/men/men4.png",
                    },
                  ]),
                  buildTabGrid([
                    {
                      "title": "Boss lady\nlooks",
                      "image": "lib/assets/images/women/women1.png",
                    },
                    {
                      "title": "Weddings &\nOutdoors",
                      "image": "lib/assets/images/women/women2.png",
                    },
                    {
                      "title": "Chic & Casual",
                      "image": "lib/assets/images/women/women3.png",
                    },
                    {
                      "title": "Retro Charm",
                      "image": "lib/assets/images/women/women4.png",
                    },
                  ]),
                  buildTabGrid([
                    {
                      "title": "Bright & Fun",
                      "image": "lib/assets/images/kid/kid1.PNG",
                    },
                    {
                      "title": "Cool Vibes",
                      "image": "lib/assets/images/kid/kid2.png",
                    },
                    {
                      "title": "Little Champs",
                      "image": "lib/assets/images/kid/kid3.PNG",
                    },
                    {
                      "title": "Playground Ready",
                      "image": "lib/assets/images/kid/kid4.png",
                    },
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Horizontal Product Card
  static Widget buildProductCard(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4DB7C0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Explore",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Tab Grid Builder
  Widget buildTabGrid(List<Map<String, String>> looks) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: looks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  looks[index]['image']!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                right: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        looks[index]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Color(0xFF5dccd8),
                      radius: 14,
                      child: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
