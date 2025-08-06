import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_services_aggregator/screens/pet_center_detail_screen.dart.dart';
import '../models/pet.dart';

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
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildServiceImage(),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildServiceHeader(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildServiceDetails(),
                const SizedBox(height: 12),
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
      color: _getServiceColor().withValues(alpha: 0.1),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            service.imageAsset,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _getServiceColor().withValues(alpha: 0.8),
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
            },
          ),
      
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.transparent,
                  _getServiceColor().withValues(alpha: 0.2),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildServiceHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.name,
          style: GoogleFonts.inter(
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
          style: GoogleFonts.inter(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            const SizedBox(width: 4),
            Text(
              '${service.rating}',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '(${service.reviewCount} reviews)',
              style: GoogleFonts.inter(
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
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                service.address,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.access_time, color: Colors.grey[500], size: 16),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
              color: service.isOpen ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: service.isOpen ? Colors.green : Colors.red,
                  width: 1,
                ),
              ),
              child: Text(
                service.isOpen ? 'Open Now' : 'Closed',
                style: GoogleFonts.inter(
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getServiceColor().withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _getServiceColor().withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  petType,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.grey[700], 
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getServiceColor(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'View Details',
            style: GoogleFonts.inter(
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