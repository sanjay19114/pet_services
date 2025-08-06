import 'package:flutter/material.dart';
import 'package:pet_services_aggregator/widgets/filter_modal.dart';
import '../models/pet_service.dart';
import '../data/mock_data.dart';
import '../widgets/service_list_card.dart';


class ServiceListingScreen extends StatefulWidget {
  final ServiceType? serviceType;
  final String categoryName;

  const ServiceListingScreen({
    Key? key,
    required this.serviceType,
    required this.categoryName,
  }) : super(key: key);

  @override
  _ServiceListingScreenState createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  List<PetService> services = [];
  List<PetService> filteredServices = [];
  String selectedSort = 'Rating';
  bool showOpenOnly = false;

  @override
  void initState() {
    super.initState();
    _loadServices();
  }

  void _loadServices() {
    if (widget.serviceType != null) {
      services = MockData.getServicesByType(widget.serviceType!);
    } else {
      services = MockData.getPetServices();
    }
    filteredServices = List.from(services);
    _applySorting();
  }

  void _applySorting() {
    setState(() {
      switch (selectedSort) {
        case 'Rating':
          filteredServices.sort((a, b) => b.rating.compareTo(a.rating));
          break;
        case 'Reviews':
          filteredServices.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
          break;
        case 'Name':
          filteredServices.sort((a, b) => a.name.compareTo(b.name));
          break;
      }

      if (showOpenOnly) {
        filteredServices = filteredServices.where((service) => service.isOpen).toList();
      }
    });
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterModal(
        selectedSort: selectedSort,
        showOpenOnly: showOpenOnly,
        onApplyFilters: (sort, openOnly) {
          setState(() {
            selectedSort = sort;
            showOpenOnly = openOnly;
          });
          _applySorting();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.black87),
            onPressed: _showFilterModal,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildServicesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '${filteredServices.length} services found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sort,
                  size: 16,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 4),
                Text(
                  'Sort by $selectedSort',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesList() {
    if (filteredServices.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16),
            Text(
              'No services found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try adjusting your filters',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: filteredServices.length,
      itemBuilder: (context, index) {
        return ServiceListCard(
          service: filteredServices[index],
          margin: EdgeInsets.only(bottom: 16),
        );
      },
    );
  }
}