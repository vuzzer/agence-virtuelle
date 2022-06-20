import 'package:agency/models/custom_icon.dart';
import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  final List<CustomIcon> _services = [
    CustomIcon(name: 'Identification', icon: Icons.person ),
    CustomIcon(name: 'Remplacement SIM',icon: Icons.sim_card),
    CustomIcon(name: 'Moov Shop', icon: Icons.badge), //information commerciales
    CustomIcon(name: 'Initiation de requêtes', icon: Icons.contact_support),
    CustomIcon(name: 'Moov money',
      icon: Icons.swap_horiz), //transert d'argent
    CustomIcon(name: 'Moov SIM',
       icon: Icons.production_quantity_limits), //vente aux enchères
  ];
  List<CustomIcon> get services => _services;
}
