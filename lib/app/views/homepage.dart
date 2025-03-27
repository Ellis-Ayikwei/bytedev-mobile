import 'package:bytedev/app/controllers/auth_controller.dart';
import 'package:bytedev/app/redux/states/app_state.dart';
import 'package:bytedev/app/redux/states/auth_state.dart';
import 'package:bytedev/app/views/appointment_view.dart';
import 'package:bytedev/app/views/chat_view.dart';
import 'package:bytedev/app/views/profile_view.dart';
import 'package:bytedev/app/views/service_view.dart';
import 'package:bytedev/core/theme/app_theme.dart';
import 'package:bytedev/core/widgets/category_data.dart';
import 'package:bytedev/core/widgets/homepage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatefulWidget {
  final AuthController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    ServiceView(),
    ProfileView(),
    AppointmentView(),
    ChatView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.authState,
      builder: (context, authState) {
        // final phoneController = TextEditingController();

        return Scaffold(
          backgroundColor: AppTheme.lightGray,
          body: Container(
            color: _selectedIndex == 0
                ? AppTheme.lightGray // Change color for HomePageContent
                : const Color.fromARGB(
                    255, 29, 28, 28), // Default color for other pages
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}

class HomePageContent extends StatelessWidget {
  HomePageContent({super.key});

  final List<Map<String, dynamic>> categories = [
    {'title': 'Home', 'image': 'assets/images/house.png'},
    {'title': 'Beauty', 'image': 'assets/images/Makeup.png'},
    {'title': 'Handyman', 'image': 'assets/images/Maintenance.png'},
    {'title': 'Food', 'image': 'assets/images/food.png'},
    // {'title': 'Luxury', 'image': 'assets/images/Diamond.png'},
    // {'title': 'Pets', 'image': 'assets/images/Pets.png'},
    // {'title': 'Auto', 'image': 'assets/images/Auto.png'},
    // {'title': 'Garden', 'image': 'assets/images/Garden.png'},
    // {'title': 'Cleaning', 'image': 'assets/images/Cleaning.png'},
    // {'title': 'Health', 'image': 'assets/images/Health.png'},
    // {'title': 'Education', 'image': 'assets/images/Education.png'},
    // {'title': 'Others', 'image': 'assets/images/Others.png'},
  ];

  // Sample data for services
  // final List<String> services = [
  //   'Hairdressing',
  //   'Chef',
  //   'Yoga Instructor',
  //   'Web Developer',
  //   'Carpentry',
  //   'Courier',
  // ];

  // Sample data for popular services
  final List<Map<String, dynamic>> popularServices = [
    {
      'title': 'Home Cleaning',
      'price': 'GH₵ 30.0',
      'rating': 4.6,
      'distance': '46 Km away',
      'image': 'assets/images/woman.png',
    },
    {
      'title': 'Plumbing Work',
      'price': 'GH₵ 30.0',
      'rating': 4.6,
      'distance': '46 Km away',
      'image': 'assets/images/man.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location and Search Bar
          Container(
            margin: EdgeInsets.only(left: 7, right: 7),
            padding: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: AppTheme.brightTeal,
            ),
            child: Column(
              children: [
                LocationBar(),
                SearchBars(),
              ],
            ),
          ),
          PromotionalBanner(),
          CategoriesSection(categories: categoryList, isCircular: false),
          ServicesSection(services: servicesData),
          PopularServicesSection(popularServices: popularServices),
        ],
      ),
    );
  }
}
