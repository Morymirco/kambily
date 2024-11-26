import 'package:flutter/material.dart';
import '../screen/home_page.dart';  // Pour utiliser ProductCard

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Boutique',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Action de recherche
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                onPressed: () {
                  // Action du panier
                },
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Color(0xFF048B9A),
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Filtres et tri
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.filter_list, color: Colors.grey[600]),
                          const SizedBox(width: 8),
                          Text(
                            'Filtrer',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.sort, color: Colors.grey[600]),
                          const SizedBox(width: 8),
                          Text(
                            'Trier',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Grille de produits
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.48,
                children: [
                  ProductCard(
                    image: 'assets/pyjama.png',
                    title: 'Ensemble De Pyjama Short & Top À Fines Brides Imprimé Cœur',
                    price: '65,000GNF',
                    onFavorite: () {},
                    onView: () {},
                    showAddToCart: true,
                  ),
                  ProductCard(
                    image: 'assets/tshirt.png',
                    title: 'T-shirt graphique Floral et Slogan pour hommes',
                    price: '100,000GNF',
                    onFavorite: () {},
                    onView: () {},
                    showAddToCart: true,
                  ),
                  ProductCard(
                    image: 'assets/houston_tshirt.png',
                    title: 'Manfinity Sporsity Homme T-shirt graphique rayé et lettre',
                    price: '100,000GNF',
                    onFavorite: () {},
                    onView: () {},
                    showAddToCart: true,
                  ),
                  ProductCard(
                    image: 'assets/bodysuit.png',
                    title: 'Solid V Bra Bodysuit',
                    price: '85,000GNF',
                    onFavorite: () {},
                    onView: () {},
                    showAddToCart: true,
                  ),
                  ProductCard(
                    image: 'assets/robe_velours.png',
                    title: 'Robe moulante à fines brides en velours',
                    price: '75,000GNF',
                    onFavorite: () {},
                    onView: () {},
                    showAddToCart: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 