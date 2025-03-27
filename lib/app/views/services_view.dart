import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesPage extends StatelessWidget {
  final List<Map<String, dynamic>> servicesData;
  
  const ServicesPage({
    super.key,
    this.servicesData = const [], // Default to empty list if not provided
  });

  factory ServicesPage.fromArguments() {
    final args = Get.arguments as Map<String, dynamic>?;
    return ServicesPage(
      servicesData: args?['servicesData'] as List<Map<String, dynamic>>? ?? const [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.teal, // Replace with AppTheme.brightTeal
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(left: 16),
          child: Center(
            child: IconButton(
              iconSize: 20,
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
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
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search for services",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: servicesData.isEmpty
                  ? const Center(child: Text('No services available'))
                  : ListView.builder(
                      itemCount: servicesData.length,
                      itemBuilder: (context, index) {
                        final category = servicesData[index]['category'] as String;
                        final subServices = servicesData[index]['subServices'] as List<String>;
                        return ServiceCategoryTile(
                          category: category,
                          subServices: subServices,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCategoryTile extends StatefulWidget {
  final String category;
  final List<String> subServices;

  const ServiceCategoryTile({
    super.key,
    required this.category,
    required this.subServices,
  });

  @override
  State<ServiceCategoryTile> createState() => _ServiceCategoryTileState();
}


class _ServiceCategoryTileState extends State<ServiceCategoryTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final displayServices = _isExpanded ? widget.subServices : widget.subServices.take(5).toList();

    return ExpansionTile(
      title: Text(
        widget.category.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 8.0),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      children: [
        ...displayServices.map((subService) => ServiceItem(subService: subService)),
        if (widget.subServices.length > 5 && !_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = true;
                });
              },
              child: const Text(
                'See More',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ),
          ),
      ],
      onExpansionChanged: (expanded) {
        if (!expanded) {
          setState(() {
            _isExpanded = false;
          });
        }
      },
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String subService;

  const ServiceItem({super.key, required this.subService});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        subService,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      onTap: () {
        // Navigate to a detailed view for the sub-service
      },
    );
  }
}