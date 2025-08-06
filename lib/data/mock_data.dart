import '../models/pet_service.dart';
import 'package:flutter/material.dart';

class MockData {
  static List<ServiceCategory> getServiceCategories() {
    return [
      ServiceCategory(
        name: 'Grooming',
        type: ServiceType.grooming,
        icon: Icons.pets,
        color: Color(0xFF4A90E2),
      ),
      ServiceCategory(
        name: 'Veterinary',
        type: ServiceType.veterinary,
        icon: Icons.local_hospital,
        color: Color(0xFF50C878),
      ),
      ServiceCategory(
        name: 'Boarding',
        type: ServiceType.boarding,
        icon: Icons.home,
        color: Color(0xFFFF6B6B),
      ),
      ServiceCategory(
        name: 'Daycare',
        type: ServiceType.daycare,
        icon: Icons.schedule,
        color: Color(0xFFFFD93D),
      ),
      ServiceCategory(
        name: 'Training',
        type: ServiceType.training,
        icon: Icons.school,
        color: Color(0xFF9B59B6),
      ),
    ];
  }

  static List<PetService> getPetServices() {
    return [
      // ===== VETERINARY SERVICES (3) =====
      PetService(
        id: '1',
        name: 'Bangalore Pet Hospital',
        address: '100 Feet Road, Koramangala, Bangalore 560034',
        phone: '+91 80 4112 3456',
        email: 'info@bangalorepethospital.com',
        type: ServiceType.veterinary,
        rating: 4.8,
        reviewCount: 245,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats', 'Birds', 'Rabbits'],
        description: 'Leading veterinary hospital in Bangalore with 24/7 emergency services and experienced veterinarians.',
        services: [
          ServiceOffering(name: 'General Checkup', price: 800, duration: '30 min'),
          ServiceOffering(name: 'Vaccination', price: 1200, duration: '15 min'),
          ServiceOffering(name: 'Surgery', price: 15000, duration: '2-4 hours'),
          ServiceOffering(name: 'Dental Care', price: 2500, duration: '45 min'),
        ],
        professionals: [
          Professional(
            name: 'Dr. Rajesh Kumar',
            title: 'Chief Veterinarian',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.9,
          ),
          Professional(
            name: 'Dr. Priya Sharma',
            title: 'Small Animal Specialist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.7,
          ),
        ],
      ),

      PetService(
        id: '2',
        name: 'VetCare Animal Clinic',
        address: 'MG Road, Brigade Road, Bangalore 560001',
        phone: '+91 80 2559 7890',
        email: 'contact@vetcareclinic.com',
        type: ServiceType.veterinary,
        rating: 4.6,
        reviewCount: 178,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats', 'Hamsters', 'Guinea Pigs'],
        description: 'Modern veterinary clinic with digital X-ray facilities and specialized exotic pet care.',
        services: [
          ServiceOffering(name: 'Health Checkup', price: 700, duration: '25 min'),
          ServiceOffering(name: 'X-Ray Scanning', price: 2000, duration: '30 min'),
          ServiceOffering(name: 'Lab Tests', price: 1500, duration: '45 min'),
          ServiceOffering(name: 'Emergency Care', price: 3000, duration: '1 hour'),
        ],
        professionals: [
          Professional(
            name: 'Dr. Anil Reddy',
            title: 'Senior Veterinarian',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.8,
          ),
          Professional(
            name: 'Dr. Meera Nair',
            title: 'Exotic Pet Specialist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.5,
          ),
        ],
      ),

      PetService(
        id: '3',
        name: 'Paws & Claws Veterinary Center',
        address: 'Bannerghatta Road, Bangalore 560076',
        phone: '+91 98450 11223',
        email: 'help@pawsclawsvet.com',
        type: ServiceType.veterinary,
        rating: 4.7,
        reviewCount: 203,
        isOpen: false,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats', 'Birds', 'Reptiles'],
        description: 'Comprehensive veterinary center with advanced surgical facilities and 24/7 ICU care.',
        services: [
          ServiceOffering(name: 'Routine Checkup', price: 900, duration: '35 min'),
          ServiceOffering(name: 'Spay/Neuter', price: 8000, duration: '1-2 hours'),
          ServiceOffering(name: 'Ultrasound', price: 2500, duration: '40 min'),
          ServiceOffering(name: 'ICU Care', price: 5000, duration: 'per day'),
        ],
        professionals: [
          Professional(
            name: 'Dr. Suresh Babu',
            title: 'Veterinary Surgeon',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.9,
          ),
          Professional(
            name: 'Dr. Lakshmi Devi',
            title: 'Emergency Care Specialist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.6,
          ),
        ],
      ),

      // ===== GROOMING SERVICES (3) =====
      PetService(
        id: '4',
        name: 'Pawsitive Grooming Studio',
        address: 'CMH Road, Indiranagar, Bangalore 560038',
        phone: '+91 98453 67890',
        email: 'hello@pawsitivegrooming.com',
        type: ServiceType.grooming,
        rating: 4.6,
        reviewCount: 189,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats'],
        description: 'Premium pet grooming studio offering full-service grooming with natural and organic products.',
        services: [
          ServiceOffering(name: 'Basic Grooming', price: 1500, duration: '1 hour'),
          ServiceOffering(name: 'Full Grooming Package', price: 2500, duration: '2 hours'),
          ServiceOffering(name: 'Nail Trimming', price: 300, duration: '15 min'),
          ServiceOffering(name: 'Teeth Cleaning', price: 800, duration: '30 min'),
        ],
        professionals: [
          Professional(
            name: 'Amit Singh',
            title: 'Senior Pet Groomer',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.8,
          ),
          Professional(
            name: 'Sneha Patel',
            title: 'Pet Stylist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.5,
          ),
        ],
      ),

      PetService(
        id: '5',
        name: 'Glamour Pets Salon',
        address: 'Richmond Road, Bangalore 560025',
        phone: '+91 99012 34567',
        email: 'info@glamourpetssalon.com',
        type: ServiceType.grooming,
        rating: 4.4,
        reviewCount: 134,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats', 'Rabbits'],
        description: 'Full-service pet salon with creative styling and spa treatments for your beloved pets.',
        services: [
          ServiceOffering(name: 'Express Wash', price: 800, duration: '30 min'),
          ServiceOffering(name: 'Luxury Spa Package', price: 3500, duration: '3 hours'),
          ServiceOffering(name: 'Creative Styling', price: 2000, duration: '1.5 hours'),
          ServiceOffering(name: 'Flea Treatment', price: 1200, duration: '45 min'),
        ],
        professionals: [
          Professional(
            name: 'Rohit Sharma',
            title: 'Creative Pet Stylist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.6,
          ),
          Professional(
            name: 'Pooja Gupta',
            title: 'Pet Spa Specialist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.3,
          ),
        ],
      ),

      PetService(
        id: '6',
        name: 'Furry Clean Grooming Center',
        address: 'Malleshwaram, Bangalore 560003',
        phone: '+91 98765 43210',
        email: 'bookings@furryclean.com',
        type: ServiceType.grooming,
        rating: 4.5,
        reviewCount: 167,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats'],
        description: 'Affordable and reliable grooming center with experienced groomers and hygienic facilities.',
        services: [
          ServiceOffering(name: 'Standard Grooming', price: 1200, duration: '45 min'),
          ServiceOffering(name: 'De-shedding Treatment', price: 1800, duration: '1 hour'),
          ServiceOffering(name: 'Ear Cleaning', price: 400, duration: '20 min'),
          ServiceOffering(name: 'Paw Care', price: 600, duration: '25 min'),
        ],
        professionals: [
          Professional(
            name: 'Kiran Kumar',
            title: 'Professional Groomer',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.7,
          ),
          Professional(
            name: 'Anjali Rao',
            title: 'Pet Care Specialist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.4,
          ),
        ],
      ),

      // ===== BOARDING SERVICES (3) =====
      PetService(
        id: '7',
        name: 'Happy Tails Pet Resort',
        address: 'ITPL Main Road, Whitefield, Bangalore 560066',
        phone: '+91 80 2845 9876',
        email: 'bookings@happytailsresort.com',
        type: ServiceType.boarding,
        rating: 4.7,
        reviewCount: 156,
        isOpen: false,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats', 'Birds'],
        description: 'Luxury pet boarding facility with spacious accommodations, play areas, and 24/7 care.',
        services: [
          ServiceOffering(name: 'Standard Boarding', price: 1200, duration: 'per day'),
          ServiceOffering(name: 'Premium Suite', price: 2000, duration: 'per day'),
          ServiceOffering(name: 'Daycare', price: 800, duration: 'per day'),
          ServiceOffering(name: 'Training Sessions', price: 1500, duration: '1 hour'),
        ],
        professionals: [
          Professional(
            name: 'Arjun Menon',
            title: 'Pet Care Supervisor',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.6,
          ),
          Professional(
            name: 'Kavya Reddy',
            title: 'Animal Behaviorist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.8,
          ),
        ],
      ),

      PetService(
        id: '8',
        name: 'Cozy Paws Pet Lodge',
        address: 'Electronic City, Bangalore 560100',
        phone: '+91 98876 54321',
        email: 'stay@cozypawslodge.com',
        type: ServiceType.boarding,
        rating: 4.5,
        reviewCount: 92,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats'],
        description: 'Comfortable and secure boarding facility with personalized care and regular updates to pet parents.',
        services: [
          ServiceOffering(name: 'Economy Boarding', price: 900, duration: 'per day'),
          ServiceOffering(name: 'Deluxe Room', price: 1500, duration: 'per day'),
          ServiceOffering(name: 'Medical Care', price: 500, duration: 'per visit'),
          ServiceOffering(name: 'Pickup & Drop', price: 800, duration: 'round trip'),
        ],
        professionals: [
          Professional(
            name: 'Pradeep Singh',
            title: 'Boarding Manager',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.4,
          ),
          Professional(
            name: 'Swathi Nair',
            title: 'Pet Caretaker',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.6,
          ),
        ],
      ),

      PetService(
        id: '9',
        name: 'Pet Paradise Boarding',
        address: 'Hebbal, Bangalore 560024',
        phone: '+91 99164 78901',
        email: 'info@petparadiseboarding.com',
        type: ServiceType.boarding,
        rating: 4.8,
        reviewCount: 211,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats', 'Birds', 'Rabbits'],
        description: 'Premium boarding facility with climate-controlled rooms, outdoor play areas, and veterinary support.',
        services: [
          ServiceOffering(name: 'Standard Stay', price: 1400, duration: 'per day'),
          ServiceOffering(name: 'VIP Suite', price: 2500, duration: 'per day'),
          ServiceOffering(name: 'Grooming Add-on', price: 1000, duration: '1 hour'),
          ServiceOffering(name: 'Exercise Sessions', price: 600, duration: '30 min'),
        ],
        professionals: [
          Professional(
            name: 'Rajesh Khanna',
            title: 'Facility Director',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.9,
          ),
          Professional(
            name: 'Divya Krishnan',
            title: 'Senior Pet Caretaker',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.7,
          ),
        ],
      ),


      PetService(
        id: '10',
        name: 'Furry Friends Daycare',
        address: 'HSR Layout, Bangalore 560102',
        phone: '+91 99160 12345',
        email: 'info@furryfriendsdaycare.com',
        type: ServiceType.daycare,
        rating: 4.4,
        reviewCount: 98,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats'],
        description: 'Safe and fun daycare environment for pets with supervised play and activities.',
        services: [
          ServiceOffering(name: 'Half Day Care', price: 600, duration: '4 hours'),
          ServiceOffering(name: 'Full Day Care', price: 1000, duration: '8 hours'),
          ServiceOffering(name: 'Socialization Training', price: 1200, duration: '2 hours'),
        ],
        professionals: [
          Professional(
            name: 'Ravi Kumar',
            title: 'Pet Supervisor',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.3,
          ),
        ],
      ),

      PetService(
        id: '11',
        name: 'Playful Pups Daycare',
        address: 'Jayanagar, Bangalore 560011',
        phone: '+91 98321 09876',
        email: 'play@playfulpupsdaycare.com',
        type: ServiceType.daycare,
        rating: 4.6,
        reviewCount: 124,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs'],
        description: 'Specialized dog daycare with breed-specific play groups and professional supervision.',
        services: [
          ServiceOffering(name: 'Small Dogs Daycare', price: 800, duration: '6 hours'),
          ServiceOffering(name: 'Large Dogs Daycare', price: 900, duration: '6 hours'),
          ServiceOffering(name: 'Puppy Socialization', price: 700, duration: '4 hours'),
          ServiceOffering(name: 'Senior Dogs Care', price: 1100, duration: '6 hours'),
        ],
        professionals: [
          Professional(
            name: 'Deepak Joshi',
            title: 'Canine Behaviorist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.8,
          ),
          Professional(
            name: 'Nisha Patel',
            title: 'Dog Play Supervisor',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.5,
          ),
        ],
      ),

      PetService(
        id: '12',
        name: 'Happy Pets Daycare Center',
        address: 'RT Nagar, Bangalore 560032',
        phone: '+91 97418 65432',
        email: 'care@happypetsdaycare.com',
        type: ServiceType.daycare,
        rating: 4.3,
        reviewCount: 87,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats', 'Rabbits'],
        description: 'Multi-pet daycare facility with separate areas for different animals and interactive play sessions.',
        services: [
          ServiceOffering(name: 'Mixed Pet Care', price: 750, duration: '5 hours'),
          ServiceOffering(name: 'Indoor Activities', price: 650, duration: '4 hours'),
          ServiceOffering(name: 'Outdoor Play', price: 850, duration: '5 hours'),
          ServiceOffering(name: 'Lunch Included', price: 1200, duration: '8 hours'),
        ],
        professionals: [
          Professional(
            name: 'Sanjay Reddy',
            title: 'Daycare Manager',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.4,
          ),
          Professional(
            name: 'Preethi Kumari',
            title: 'Pet Activity Coordinator',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.2,
          ),
        ],
      ),

      PetService(
        id: '13',
        name: 'Elite Pet Training Academy',
        address: 'JP Nagar, Bangalore 560078',
        phone: '+91 98864 54321',
        email: 'training@elitepetacademy.com',
        type: ServiceType.training,
        rating: 4.9,
        reviewCount: 67,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs'],
        description: 'Professional dog training academy with certified trainers and proven methods.',
        services: [
          ServiceOffering(name: 'Basic Obedience', price: 3000, duration: '4 weeks'),
          ServiceOffering(name: 'Advanced Training', price: 5000, duration: '6 weeks'),
          ServiceOffering(name: 'Behavioral Correction', price: 4000, duration: '5 weeks'),
        ],
        professionals: [
          Professional(
            name: 'Captain Vikram',
            title: 'Certified Dog Trainer',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.9,
          ),
        ],
      ),

      PetService(
        id: '14',
        name: 'Smart Dogs Training Center',
        address: 'Rajajinagar, Bangalore 560010',
        phone: '+91 99008 77444',
        email: 'hello@smartdogstraining.com',
        type: ServiceType.training,
        rating: 4.7,
        reviewCount: 143,
        isOpen: true,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs'],
        description: 'Comprehensive dog training center offering puppy training to advanced behavioral modification.',
        services: [
          ServiceOffering(name: 'Puppy Training', price: 2500, duration: '3 weeks'),
          ServiceOffering(name: 'Aggression Management', price: 6000, duration: '8 weeks'),
          ServiceOffering(name: 'Leash Training', price: 1800, duration: '2 weeks'),
          ServiceOffering(name: 'Trick Training', price: 3500, duration: '5 weeks'),
        ],
        professionals: [
          Professional(
            name: 'Dr. Ashwin Kumar',
            title: 'Canine Psychologist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.8,
          ),
          Professional(
            name: 'Meghna Sinha',
            title: 'Professional Dog Trainer',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.6,
          ),
        ],
      ),

      PetService(
        id: '15',
        name: 'Obedient Paws Training School',
        address: 'Basavanagudi, Bangalore 560004',
        phone: '+91 98456 12378',
        email: 'train@obedientpaws.com',
        type: ServiceType.training,
        rating: 4.5,
        reviewCount: 89,
        isOpen: false,
        imageAsset: 'assets/images/pet_hospital.jpg',
        petTypesSupported: ['Dogs', 'Cats'],
        description: 'Specialized training school for both dogs and cats with positive reinforcement techniques.',
        services: [
          ServiceOffering(name: 'Dog Obedience', price: 2800, duration: '4 weeks'),
          ServiceOffering(name: 'Cat Behavior Training', price: 3200, duration: '5 weeks'),
          ServiceOffering(name: 'Potty Training', price: 1500, duration: '2 weeks'),
          ServiceOffering(name: 'Service Dog Training', price: 8000, duration: '12 weeks'),
        ],
        professionals: [
          Professional(
            name: 'Raghav Iyer',
            title: 'Animal Trainer',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.6,
          ),
          Professional(
            name: 'Sunita Desai',
            title: 'Feline Behavior Specialist',
            imageAsset: 'assets/images/doctor1.jpg',
            rating: 4.4,
          ),
        ],
      ),
    ];
  }

  static List<PetService> getFeaturedServices() {
    final allServices = getPetServices();
    return allServices.where((service) => service.rating >= 4.6).toList();
  }

  static List<PetService> getServicesByType(ServiceType type) {
    return getPetServices().where((service) => service.type == type).toList();
  }
}