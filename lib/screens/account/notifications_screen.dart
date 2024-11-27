import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key('notification_$index'),
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: Colors.red.shade700,
                  ),
                ],
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // Action à effectuer lors de la suppression
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Notification supprimée'),
                  action: SnackBarAction(
                    label: 'Annuler',
                    onPressed: () {
                      // Action pour annuler la suppression
                    },
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[100]!,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icône avec fond coloré
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF048B9A).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _getNotificationIcon(index),
                        color: const Color(0xFF048B9A),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Contenu de la notification
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getNotificationTitle(index),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getNotificationDescription(index),
                            style: TextStyle(
                              color: Colors.grey[600],
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Il y a 2 heures',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getNotificationIcon(int index) {
    switch (index % 4) {
      case 0:
        return Icons.local_shipping_outlined;
      case 1:
        return Icons.shopping_bag_outlined;
      case 2:
        return Icons.discount_outlined;
      case 3:
        return Icons.notifications_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }

  String _getNotificationTitle(int index) {
    switch (index % 4) {
      case 0:
        return 'Commande expédiée';
      case 1:
        return 'Nouvelle commande';
      case 2:
        return 'Offre spéciale';
      case 3:
        return 'Mise à jour';
      default:
        return 'Notification';
    }
  }

  String _getNotificationDescription(int index) {
    switch (index % 4) {
      case 0:
        return 'Votre commande #1234 a été expédiée et sera livrée dans 2-3 jours.';
      case 1:
        return 'Votre commande #1234 a été confirmée et est en cours de traitement.';
      case 2:
        return 'Profitez de -20% sur toute la collection été avec le code SUMMER20.';
      case 3:
        return 'Notre application a été mise à jour avec de nouvelles fonctionnalités.';
      default:
        return 'Nouvelle notification';
    }
  }
} 