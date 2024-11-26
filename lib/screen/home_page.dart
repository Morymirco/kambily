
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> carouselImages = [
    'assets/Just-stay-at-home.png',
    'assets/3.png',
    'assets/1.png',
  ];

  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 4,
        // shadowColor: Colors.grey.withOpacity(0.3),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Action du menu hamburger
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.webp',
          height: 80,
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, 
                  color: Colors.black,
                ),
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
                    color: Colors.teal,
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
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentCarouselIndex = index;
                      });
                    },
                  ),
                  items: carouselImages.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            image,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                // Indicateurs de position
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselImages.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal.withOpacity(
                            _currentCarouselIndex == entry.key ? 0.9 : 0.4,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            
            // Section Qualité
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(Icons.shopping_bag_outlined, 
                    color: Colors.teal,
                    size: 40,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Meilleure Qualité',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Nous offrons des produits de qualité supérieure pour une expérience d\'achat en toute confiance.',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Compte à rebours et message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Text(
                      '00 : 00 : 00 : 00',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Achetez maintenant et profitez de l\'offre !',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Section Livraison Gratuite avec Voir Plus
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_shipping_outlined,
                        color: Colors.teal,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Livraison Gratuite',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Action Voir Plus
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Voir Plus',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.teal),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Ajout du Divider
            const Divider(
              color: Colors.black,
              thickness: 2,
              height: 2,
              indent: 20,
              endIndent: 20,
            ),

            // Section Produits
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.50,
                    children: [
                      // Premiers 4 produits en grille
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
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Produit large en bas
                  ProductCardWide(
                    image: 'assets/robe_velours.png',
                    title: 'Robe moulante à fines brides en velours',
                    price: '75,000GNF',
                    onFavorite: () {},
                    onView: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Barre de navigation du bas
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 28),
            label: 'ACCUEIL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 28),
            label: 'BOUTIQUE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 28),
            label: 'CATÉGORIES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic, size: 28),
            label: 'CONTACT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin, size: 28),
            label: 'COMPTE',
          ),
        ],
        selectedItemColor: Colors.teal,
        iconSize: 28,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final VoidCallback onFavorite;
  final VoidCallback onView;
  final bool showAddToCart;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.onFavorite,
    required this.onView,
    this.showAddToCart = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: onFavorite,
                        color: Colors.teal,
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                        iconSize: 20,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: onView,
                        color: Colors.teal,
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                        iconSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.inventory_2_outlined,
                      color: Colors.teal,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'In Stock',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                if (showAddToCart) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text(
                        'Ajouter au panier',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// D'abord, ajoutons le nouveau widget ProductCardWide
class ProductCardWide extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final VoidCallback onFavorite;
  final VoidCallback onView;

  const ProductCardWide({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.onFavorite,
    required this.onView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Section Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  image,
                  height:350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: onFavorite,
                        color: Colors.teal,
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                        iconSize: 20,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: onView,
                        color: Colors.teal,
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                        iconSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Section Contenu
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.inventory_2_outlined,
                      color: Colors.teal,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'In Stock',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Ajouter au panier',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
