import 'package:flutter/material.dart';
import 'package:pet_services_aggregator/screens/pet_center_detail_screen.dart.dart';
import '../models/pet_service.dart';


class FeaturedServiceCard extends StatelessWidget {
  final PetService service;
  final EdgeInsets? margin;

  const FeaturedServiceCard({
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
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
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
            child: Row(
              children: [
                _buildServiceImage(),
                SizedBox(width: 16),
                Expanded(
                  child: _buildServiceInfo(context),
                ),
                _buildBookButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceImage() {
    return Container(
      width: 80,
      height: 80,
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
        size: 36,
      ),
    );
  }

  Widget _buildServiceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          service.serviceTypeString,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey[500], size: 14),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                _getShortAddress(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
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
              '(${service.reviewCount})',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: service.isOpen ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                service.isOpen ? 'Open' : 'Closed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBookButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Book',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _getShortAddress() {
    final parts = service.address.split(',');
    if (parts.length >= 2) {
      return '${parts[0]}, ${parts[1]}';
    }
    return service.address;
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