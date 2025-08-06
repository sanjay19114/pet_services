import 'package:flutter/material.dart';

enum ServiceType { grooming, boarding, veterinary, daycare, training }

class PetService {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final ServiceType type;
  final double rating;
  final int reviewCount;
  final bool isOpen;
  final String imageAsset;
  final List<String> petTypesSupported;
  final List<ServiceOffering> services;
  final List<Professional> professionals;
  final String description;

  PetService({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.type,
    required this.rating,
    required this.reviewCount,
    required this.isOpen,
    required this.imageAsset,
    required this.petTypesSupported,
    required this.services,
    required this.professionals,
    required this.description,
  });

  String get serviceTypeString {
    switch (type) {
      case ServiceType.grooming:
        return 'Pet Grooming';
      case ServiceType.boarding:
        return 'Pet Boarding';
      case ServiceType.veterinary:
        return 'Veterinary Clinic';
      case ServiceType.daycare:
        return 'Pet Daycare';
      case ServiceType.training:
        return 'Pet Training';
    }
  }
}

class ServiceOffering {
  final String name;
  final double price;
  final String duration;

  ServiceOffering({
    required this.name,
    required this.price,
    required this.duration,
  });
}

class Professional {
  final String name;
  final String title;
  final String imageAsset;
  final double rating;

  Professional({
    required this.name,
    required this.title,
    required this.imageAsset,
    required this.rating,
  });
}

class ServiceCategory {
  final String name;
  final ServiceType type;
  final IconData icon;
  final Color color;

  ServiceCategory({
    required this.name,
    required this.type,
    required this.icon,
    required this.color,
  });
}