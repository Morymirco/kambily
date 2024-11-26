import 'package:flutter/material.dart';

import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Mon Compte',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Section Profil
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5F5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF048B9A),
                          width: 2,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/profil.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mory koulibaly',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'mory.koulibaly@example.com',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Section Commandes
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mes Commandes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Voir tout',
                    style: TextStyle(
                      color: Color(0xFF048B9A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOrderStatus(Icons.payment, 'En attente'),
                  _buildOrderStatus(Icons.local_shipping_outlined, 'En cours'),
                  _buildOrderStatus(Icons.inventory_2_outlined, 'Livrée'),
                  _buildOrderStatus(Icons.star_outline, 'À évaluer'),
                ],
              ),
              const SizedBox(height: 30),

              // Section Paramètres
              Column(
                children: [
                  _buildSettingItem(
                    Icons.person_outline,
                    'Informations personnelles',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    Icons.location_on_outlined,
                    'Adresses de livraison',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    Icons.favorite_outline,
                    'Liste de souhaits',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    Icons.history,
                    'Historique des commandes',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    Icons.notifications_outlined,
                    'Notifications',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    Icons.help_outline,
                    'Aide & Support',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    Icons.logout,
                    'Déconnexion',
                    textColor: Colors.red,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderStatus(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF048B9A).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF048B9A),
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String text,
      {Color? textColor, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF048B9A),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
} 