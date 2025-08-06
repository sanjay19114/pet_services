import 'package:flutter/material.dart';
import 'package:pet_services_aggregator/screens/pet_center_detail_screen.dart.dart';
import '../models/pet_service.dart';

class ServiceListCard extends StatelessWidget {
  final PetService service;
  final EdgeInsets? margin;

  const ServiceListCard({
    Key? key,
    required this.service,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetCenterDetailScreen(service: service),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildServiceImage(),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildServiceHeader(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                _buildServiceDetails(),
                SizedBox(height: 12),
                _buildPetTypesAndStatus(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _getServiceColor().withOpacity(0.8),
            _getServiceColor(),
          ],
        ),
      ),
      child: Icon(
        _getServiceIcon(),
        color: Colors.white,
        size: 28,
      ),
    );
  }

  Widget _buildServiceHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Text(
          service.serviceTypeString,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16),
            SizedBox(width: 4),
            Text(
              '${service.rating}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(width: 4),
            Text(
              '(${service.reviewCount} reviews)',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceDetails() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey[500], size: 16),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                service.address,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.access_time, color: Colors.grey[500], size: 16),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: service.isOpen ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: service.isOpen ? Colors.green : Colors.red,
                  width: 1,
                ),
              ),
              child: Text(
                service.isOpen ? 'Open Now' : 'Closed',
                style: TextStyle(
                  color: service.isOpen ? Colors.green.shade700 : Colors.red.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPetTypesAndStatus() {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            spacing: 6,
            runSpacing: 4,
            children: service.petTypesSupported.take(3).map((petType) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getServiceColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  petType,
                  style: TextStyle(
                    fontSize: 11,
                    color: _getServiceColor(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getServiceColor(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'View Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Color _getServiceColor() {
    switch (service.type) {
      case ServiceType.grooming:
        return Color(0xFF4A90E2);
      case ServiceType.veterinary:
        return Color(0xFF50C878);
      case ServiceType.boarding:
        return Color(0xFFFF6B6B);
      case ServiceType.daycare:
        return Color(0xFFFFD93D);
      case ServiceType.training:
        return Color(0xFF9B59B6);
    }
  }

  IconData _getServiceIcon() {
    switch (service.type) {
      case ServiceType.grooming:
        return Icons.pets;
      case ServiceType.veterinary:
        return Icons.local_hospital;
      case ServiceType.boarding:
        return Icons.home;
      case ServiceType.daycare:
        return Icons.schedule;
      case ServiceType.training:
        return Icons.school;
    }
  }
}