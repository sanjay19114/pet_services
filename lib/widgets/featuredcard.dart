import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_services_aggregator/screens/pet_center_detail_screen.dart.dart';
import '../models/pet.dart';

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
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
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
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildServiceImage(),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildServiceInfo(context),
                ),
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
        color: _getServiceColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        image:  DecorationImage(
          image: AssetImage(service.imageAsset),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildServiceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.name,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          maxLines: 2,
          overflow: TextOverflow.clip,
        ),
        Text(
          service.serviceTypeString,
          style: GoogleFonts.inter(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey[500], size: 8),
            Expanded(
              child: Text(
                _getShortAddress(),
                style: GoogleFonts.inter(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            const SizedBox(width: 4),
            Text(
              '${service.rating}',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              '(${service.reviewCount})',
              style: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: service.isOpen ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                service.isOpen ? 'Open' : 'Closed',
                style: GoogleFonts.inter(
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
        return const Color(0xFF4A90E2);
      case ServiceType.veterinary:
        return const Color(0xFF50C878);
      case ServiceType.boarding:
        return const Color(0xFFFF6B6B);
      case ServiceType.daycare:
        return const Color(0xFFFFD93D);
      case ServiceType.training:
        return const Color(0xFF9B59B6);
    }
  }

}