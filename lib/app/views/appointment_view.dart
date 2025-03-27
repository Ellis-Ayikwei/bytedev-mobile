import 'package:bytedev/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Main Appointment View
class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return EmployeeProfileCard(
      name: "Amina Alhasan",
      title: "Cleaner",
      rating: 4.6,
      reviewCount: 260,
      isBookmarked: false,
      location: "Kasoa 25 mins away",
      availability: "8 am",
      about:
          "Offer deep cleaning, home maintenance, and specialized cleaning services using eco-friendly products...",
      specializations: [
        "General Cleaning",
        "Sofa & Carpet Cleaning",
        "Move-In/Move-Out",
      ],
      imageUrl: "assets/images/cleaner.png",
      serviceType: "Cleaning Services",
      status: "Active",
    );
  }
}

// Main Profile Card Widget
class EmployeeProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final double rating;
  final int reviewCount;
  final bool isBookmarked;
  final String location;
  final String availability;
  final String about;
  final List<String> specializations;
  final String imageUrl;
  final String serviceType;
  final String status;

  const EmployeeProfileCard({
    super.key,
    required this.name,
    required this.title,
    required this.rating,
    required this.reviewCount,
    required this.isBookmarked,
    required this.location,
    required this.availability,
    required this.about,
    required this.specializations,
    required this.imageUrl,
    required this.serviceType,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(imageUrl: imageUrl),
            const SizedBox(height: 40),
            ProfileContent(
              name: name,
              rating: rating,
              reviewCount: reviewCount,
              location: location,
              serviceType: serviceType,
              status: status,
              specializations: specializations,
              about: about,
              availability: availability,
            ),
          ],
        ),
      ),
    );
  }
}

// Header Widget with Image and Avatar
class ProfileHeader extends StatelessWidget {
  final String imageUrl;

  const ProfileHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 16,
          bottom: -40,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: AppTheme.brightTeal,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage('assets/images/woman.png'),
            ),
          ),
        ),
        Positioned(
          right: 95,
          bottom: -50,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.softWhite,
              border: Border.all(
                color: AppTheme.brightTeal,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage('assets/images/woman.png'),
            ),
          ),
        ),
        Positioned(
          right: 48,
          bottom: -50,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.softWhite,
              border: Border.all(
                color: AppTheme.brightTeal,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage('assets/images/woman.png'),
            ),
          ),
        ),
      ],
    );
  }
}

// Main Content Widget
class ProfileContent extends StatelessWidget {
  final String name;
  final double rating;
  final int reviewCount;
  final String location;
  final String serviceType;
  final String status;
  final List<String> specializations;
  final String about;
  final String availability;

  const ProfileContent({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.serviceType,
    required this.status,
    required this.specializations,
    required this.about,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameRatingRow(name: name, rating: rating, reviewCount: reviewCount),
          LocationRow(location: location),
          const SizedBox(height: 30),
          ServiceTypeSection(serviceType: serviceType, status: status),
          const SizedBox(height: 20),
          const OverviewSection(),
          const SizedBox(height: 10),
          SpecializationSection(specializations: specializations),
          const SizedBox(height: 20),
          AboutSection(about: about),
          const SizedBox(height: 20),
          AvailabilityBookingSection(availability: availability),
        ],
      ),
    );
  }
}

// Name and Rating Row
class NameRatingRow extends StatelessWidget {
  final String name;
  final double rating;
  final int reviewCount;

  const NameRatingRow({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppTheme.brightTeal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Cleaner",
                style: TextStyle(
                  color: AppTheme.softWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text('$rating ($reviewCount reviews)'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Location Row
class LocationRow extends StatelessWidget {
  final String location;

  const LocationRow({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, size: 16),
        const SizedBox(width: 4),
        Text(location),
      ],
    );
  }
}

// Service Type Section
class ServiceTypeSection extends StatelessWidget {
  final String serviceType;
  final String status;

  const ServiceTypeSection({
    super.key,
    required this.serviceType,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.brightTeal,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Service Type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  serviceType,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppTheme.softWhite,
                  ),
                ),
              ],
            ),
            Chip(
              label: Text(status),
              labelStyle: TextStyle(
                color: AppTheme.softWhite,
              ),
              backgroundColor: AppTheme.deepBlue,
            ),
          ],
        ),
      ),
    );
  }
}

// Overview Section
class OverviewSection extends StatefulWidget {
  const OverviewSection({super.key});

  @override
  State<OverviewSection> createState() => _MyChatViewState();
}

class _MyChatViewState extends State<OverviewSection> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.softWhite,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabItem('Overview', 0),
            _buildTabItem('Recent Work', 1),
            _buildTabItem('Reviews', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              _selectedTabIndex == index ? Colors.blue[50] : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: _selectedTabIndex ==
                    index // Updated to use local state variable
                ? FontWeight.bold
                : FontWeight.normal,
            color: _selectedTabIndex ==
                    index // Updated to use local state variable
                ? Colors.blue
                : Colors.black,
          ),
        ),
      ),
    );
  }
}

// Specialization Section
class SpecializationSection extends StatelessWidget {
  final List<String> specializations;

  const SpecializationSection({super.key, required this.specializations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specialization',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: specializations
                .map(
                  (spec) => Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Center(
                      child: Text(
                        spec,
                        style: TextStyle(
                          color: AppTheme.softBlack,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

// About Section
class AboutSection extends StatelessWidget {
  final String about;

  const AboutSection({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          about,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

// Availability and Booking Section
class AvailabilityBookingSection extends StatelessWidget {
  final String availability;

  const AvailabilityBookingSection({super.key, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 42,
          width: 170,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: Center(
            child: Text(
              "Next Available:  $availability",
              style: TextStyle(
                color: AppTheme.softBlack,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Book appointment'),
        ),
      ],
    );
  }
}
