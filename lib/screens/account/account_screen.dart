import 'package:flutter/material.dart';
import 'package:kambily/screens/account/help_support_screen.dart';
import 'package:kambily/screens/account/notifications_screen.dart';
import 'package:kambily/screens/login_screen.dart';

import 'delivery_address_screen.dart';
import 'order_history_screen.dart';
import 'personal_info_screen.dart';
import 'wishlist_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingItem(
              Icons.person_outline,
              'Informations personnelles',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalInfoScreen(),
                  ),
                );
              },
            ),
            _buildSettingItem(
              Icons.location_on_outlined,
              'Adresses de livraison',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryAddressScreen(),
                  ),
                );
              },
            ),
            _buildSettingItem(
              Icons.favorite_outline,
              'Liste de souhaits',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WishlistScreen(),
                  ),
                );
              },
            ),
            _buildSettingItem(
              Icons.history,
              'Historique des commandes',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderHistoryScreen(),
                  ),
                );
              },
            ),
            _buildSettingItem(
              Icons.notifications_outlined,
              'Notifications',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
            _buildSettingItem(
              Icons.help_outline,
              'Aide & Support',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpSupportScreen(),
                  ),
                );
              },
            ),
            _buildSettingItem(
              Icons.logout,
              'Déconnexion',
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Déconnexion'),
                      content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Annuler',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Ferme le dialogue
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'Déconnexion',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, {Function()? onTap, Color? textColor}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      textColor: textColor,
    );
  }
} 