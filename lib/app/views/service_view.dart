import 'package:bytedev/core/theme/app_theme.dart';
import 'package:flutter/material.dart';


class ServiceView extends StatelessWidget {
  ServiceView({super.key});

  final List<Service> services = [
    Service(name: "Amina Alhasan", rating: 4.6, location: "Kasoa", price: 40),
    Service(name: "Baba Tundey", rating: 4.4, location: "Kasoa", price: 40),
    Service(name: "Yaa Tiwaa", rating: 4.3, location: "Kasoa", price: 40),
    Service(name: "Yandex Comp.", rating: 4.2, location: "Kasoa", price: 40),
    Service(name: "Amina Alhasan", rating: 4.1, location: "Kasoa", price: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(
        //   height: 40,
        //   width: 40,
        //   decoration: const BoxDecoration(
        //     color: Colors.teal, // Replace with AppTheme.brightTeal
        //     shape: BoxShape.circle,
        //   ),
        //   margin: const EdgeInsets.only(left: 16),
        //   child: Center(
        //     child: IconButton(
        //       iconSize: 20,
        //       icon: const Icon(Icons.arrow_back, color: Colors.white),
        //       onPressed: () => Get.back(),
        //       padding: EdgeInsets.zero,
        //       constraints: const BoxConstraints(),
        //     ),
        //   ),
        // ),
        title: const Text(
          'Services',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "General House cleaning",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  filled: true,
                  fillColor: AppTheme.lightgrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                return ServiceCard(service: services[index]);
              },
            ),
          ),
          ],
        ),
      ),
    );
  }
}


class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.lightgrey,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/woman.png"),
                ),
                SizedBox(width: 10),
                Text(
                  service.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.orange),
                Text(service.rating.toString()),
              ],
            ),
            SizedBox(height: 5),
            Text("Contact me for all your cleaning needs"),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                Text("${service.location} 25 mins away"),
                Spacer(),
                Text("GH₵ ${service.price}/hr",
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String name;
  final double rating;
  final String location;
  final int price;

  Service(
      {required this.name,
      required this.rating,
      required this.location,
      required this.price});
}
