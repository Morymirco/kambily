import 'package:flutter/material.dart';
import 'package:kambily/screens/auth_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      image: 'assets/tshirt.png',
      title: 'Bienvenue sur Kambily',
      description: 'Découvrez notre sélection de vêtements tendance pour hommes et femmes.',
      color: const Color(0xFFFFE5E5),
    ),
    OnboardingContent(
      image: 'assets/tshirt.png',
      title: 'Livraison Gratuite',
      description: 'Profitez de la livraison gratuite pour toute commande supérieure à 350.000 GNF.',
      color: const Color(0xFFE5F6FF),
    ),
    OnboardingContent(
      image: 'assets/tshirt.png',
      title: 'Paiement Sécurisé',
      description: 'Effectuez vos achats en toute sécurité avec nos options de paiement variées.',
      color: const Color(0xFFE5FFE7),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _contents.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Fond avec ClipPath
                  ClipPath(
                    clipper: OnboardingClipper(),
                    child: Container(
                      color: _contents[index].color,
                      height: MediaQuery.of(context).size.height * 0.7,
                    ),
                  ),
                  // Contenu
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        // Image avec effet d'ombre
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              _contents[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          _contents[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF048B9A),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _contents[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          // Indicateurs et bouton en bas
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Indicateurs de page
                Row(
                  children: List.generate(
                    _contents.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 8),
                      height: 10,
                      width: _currentPage == index ? 25 : 10,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xFF048B9A)
                            : const Color(0xFF048B9A).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                // Bouton Suivant/Commencer
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _contents.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF048B9A),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _currentPage == _contents.length - 1 ? 'Commencer' : 'Suivant',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

class OnboardingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OnboardingContent {
  final String image;
  final String title;
  final String description;
  final Color color;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.color,
  });
} 