import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _currentImageIndex = 0;
  
  final List<String> _companyImages = [
    'assets/equipe.jpg',
    'assets/equipe2.webp',
    'assets/equipe3.jpg',
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'À propos de nous',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section bannière
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/equipe.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/logo.webp',
                    height: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notre Histoire
                  const Text(
                    'Qui sommes nous?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF048B9A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Chez Kambily, notre passion réside dans la création d'une expérience de shopping en ligne exceptionnelle, où le style, la qualité et le service se rencontrent pour vous offrir une satisfaction totale. Nous sommes bien plus qu'une simple plateforme e-commerce, nous sommes une équipe passionnée, dédiée à offrir la meilleure expérience d'achat possible à nos clients. Rejoignez la communauté Kambily et découvrez une nouvelle façon de faire du shopping en ligne. Nous sommes impatients de vous servir ! ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Notre Mission
                  const Text(
                    'Notre Mission',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF048B9A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Chez Kambily, notre mission est de redéfinir votre expérience d'achat en ligne. Nous croyons que le shopping en ligne devrait être facile, efficace et agréable. C'est pourquoi nous nous engageons à vous offrir une plateforme e-commerce qui non seulement répond à vos besoins, mais les dépasse. Nous nous engageons à offrir des prix compétitifs et une garantie d'ajustement, assurant que vous obtenez toujours la meilleure valeur pour votre argent.\n\nMais notre mission ne s'arrête pas là. Nous nous soucions profondément de nos clients et nous nous engageons à offrir un service client exceptionnel.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),
                  
                  // Carousel d'images
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            viewportFraction: 1.0,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentImageIndex = index;
                              });
                            },
                          ),
                          items: _companyImages.map((image) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        // Indicateurs de position
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _companyImages.asMap().entries.map((entry) {
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFF048B9A).withOpacity(
                                    _currentImageIndex == entry.key ? 0.9 : 0.4,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Nos Valeurs
                  const Text(
                    'Nos Valeurs',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF048B9A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildValueItem(
                    Icons.verified_user_outlined,
                    'Qualité',
                    'Nous nous engageons à offrir des produits de haute qualité.',
                  ),
                  const SizedBox(height: 16),
                  _buildValueItem(
                    Icons.support_agent_outlined,
                    'Service Client',
                    'Une équipe dédiée à votre satisfaction 7j/7.',
                  ),
                  const SizedBox(height: 16),
                  _buildValueItem(
                    Icons.local_shipping_outlined,
                    'Livraison Rapide',
                    'Livraison gratuite pour toute commande supérieure à 350.000 GNF.',
                  ),

                  const SizedBox(height: 32),

                  // Contactez-nous
                  const Text(
                    'Contactez-nous',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF048B9A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    Icons.phone_outlined,
                    '624-22-85-55',
                    'Disponible de 8h à 20h',
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    Icons.email_outlined,
                    'contact@kambily.com',
                    'Réponse sous 24h',
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    Icons.location_on_outlined,
                    'Conakry, Guinée',
                    'Madina, Commune de Matam',
                  ),

                  const SizedBox(height: 32),

                  // Suivez-nous
                  const Text(
                    'Suivez-nous',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF048B9A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton('assets/icons/facebook.svg', () {}),
                      const SizedBox(width: 20),
                      _buildSocialButton('assets/icons/instagram.svg', () {}),
                      const SizedBox(width: 20),
                      _buildSocialButton('assets/icons/tiktok.svg', () {}),
                      const SizedBox(width: 20),
                      _buildSocialButton('assets/icons/whatsapp.svg', () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueItem(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF048B9A).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF048B9A),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String subtitle) {
    return Row(
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
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(String iconPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
} 