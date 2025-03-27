import 'package:animations/animations.dart';
import 'package:bytedev/app/views/category_view.dart';
import 'package:bytedev/app/views/service_page.dart';
import 'package:bytedev/core/theme/app_theme.dart';
import 'package:bytedev/core/widgets/category_data.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// Custom Widget: Location Bar
class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0), // Ensuring alignment
                child: Text(
                  'Location',
                  style: TextStyle(
                    color: AppTheme.softWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppTheme.softWhite,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Tesano, Accra',
                    style: TextStyle(
                      // color: AppTheme.softWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: AppTheme.deepBlue,
                child: IconButton(
                  icon: Icon(Icons.notifications, color: Colors.grey),
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Widget: Search Bar
class SearchBars extends StatelessWidget {
  const SearchBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What service do you need today?',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.refresh, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// Custom Widget: Promotional Banner
class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#SpecialForYou',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppTheme.brightTeal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BannerCard(),
                BannerCard(),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                ),
              ),
              Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Widget: Banner Card
class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/shoe.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Limited time!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Get Special Offer\nUp to 20%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'On first home cleaning',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                // Spacer(),
                Text(
                  'Claim',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Custom Widget: Categories Section
class CategoriesSection extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final bool isCircular;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.isCircular,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> limitedCategories = categories.take(4).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OpenContainer(
                transitionType: ContainerTransitionType.fadeThrough, // Smooth fade effect
                closedElevation: 0,
                closedColor: Colors.transparent,
                openColor: Colors.white,
                transitionDuration: Duration(milliseconds: 300), // Smooth transition
                closedBuilder: (context, action) => TextButton(
                  onPressed: action, // Triggers the OpenContainer transition
                  child: Text(
                    'See All (${categories.length})',
                    style: TextStyle(
                      color: AppTheme.brightTeal,
                      fontSize: 12,
                    ),
                  ),
                ),
                openBuilder: (context, action) => CategoryView(categories: categories),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: limitedCategories.map((category) {
              return CategoryCard(
                title: category['title'],
                image: category['image'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}


// Custom Widget: Category Card
class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isCircular; // New parameter to control circular container

  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppTheme.lightgrey,
            shape: BoxShape.circle, // Conditional shape
          ),
          child: Center(
            child: Image.asset(
              image,
              width: 40, // Adjust image size to fit nicely
              height: 40,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// Custom Widget: Services Section
class ServicesSection extends StatelessWidget {
  final List<Map<String, dynamic>> services;

  const ServicesSection({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OpenContainer(
                  transitionType: ContainerTransitionType.fadeThrough,
                  closedElevation: 0,
                  closedColor: Colors.transparent,
                  openColor: Colors.white,
                  transitionDuration: const Duration(milliseconds: 300),
                  closedBuilder: (context, action) => TextButton(
                    onPressed: action,
                    child: Text(
                      'See All (${services.length})',
                      style: TextStyle(
                        color: AppTheme.brightTeal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  openBuilder: (context, action) => ServicesPage(servicesData: servicesData), // Placeholder, not used with GetX
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: services.take(4).map((service) {
              return ServiceChip(title: service['category']);
            }).toList(), // Limit to 4 chips for preview
          ),
        ],
      ),
    );
  }
}


class ServiceChip extends StatelessWidget {
  final String title;

  const ServiceChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey),
      ),
      onPressed: () {
        // Navigate to ServicesView with filtered data for this category
        final filteredData = servicesData.where((data) => data['category'] == title).toList();
        Get.toNamed(
          '/services_view',
          arguments: {
            'servicesData': filteredData,
          },
        );
      },
    );
  }
}

// Custom Widget: Popular Services Section
class PopularServicesSection extends StatelessWidget {
  final List<Map<String, dynamic>> popularServices;

  const PopularServicesSection({super.key, required this.popularServices});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Services',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ...popularServices.map((service) {
            return PopularServiceCard(
              title: service['title'],
              price: service['price'],
              rating: service['rating'],
              distance: service['distance'],
              image: service['image'],
            );
          }),
        ],
      ),
    );
  }
}

// Custom Widget: Popular Service Card
class PopularServiceCard extends StatelessWidget {
  final String title;
  final String price;
  final double rating;
  final String distance;
  final String image;

  const PopularServiceCard({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.distance,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: price,
                          style: TextStyle(
                            color: AppTheme.brightTeal,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '/hr',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.bookmark_border, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      "Book",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 20),
                    SizedBox(width: 8),
                    Text(
                      distance,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget: Bottom Navigation Bar
class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color backgroundColor;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.backgroundColor = AppTheme.brightTeal,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppTheme.softWhite,
      unselectedItemColor: AppTheme.lightGray,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cleaning_services),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.calendar_today),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedIconTheme: const IconThemeData(
        color: AppTheme.softWhite, // Matches text color when selected
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppTheme.lightGray, // Default white color for unselected icons
      ),
      onTap: onItemTapped,
      backgroundColor: AppTheme.brightTeal,
    );
  }
}
