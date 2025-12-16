import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const AutoServiceWebsite());
}

class AutoServiceWebsite extends StatelessWidget {
  const AutoServiceWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Автосервис - Профессиональный ремонт автомобилей',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1A237E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey headerKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey galleryKey = GlobalKey();
  final GlobalKey contactsKey = GlobalKey();
  bool _isGalleryExpanded = false;

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            _buildHeader(context),
            
            // Hero Section
            _buildHeroSection(context),
            
            // About Section
            _buildAboutSection(context),
            
            // Services Section
            Container(
              key: servicesKey,
              child: _buildServicesSection(context),
            ),
            
            // Gallery Section
            Container(
              key: galleryKey,
              child: _buildGallerySection(context),
            ),
            
            // Contacts Section
            Container(
              key: contactsKey,
              child: _buildContactsSection(context),
            ),
            
            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: isDesktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLogo(context),
                  _buildNavigation(context),
                ],
              )
            : Column(
                children: [
                  _buildLogo(context),
                  const SizedBox(height: 16),
                  _buildNavigationMobile(context),
                ],
              ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.build_circle,
          color: Color(0xFF1A237E),
          size: 40,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'АВТОСЕРВИС',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            Text(
              'Профессиональный ремонт',
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigation(BuildContext context) {
    return Row(
      children: [
        _buildNavButton('Услуги', () => scrollToSection(servicesKey)),
        const SizedBox(width: 24),
        _buildNavButton('Галерея', () => scrollToSection(galleryKey)),
        const SizedBox(width: 24),
        _buildNavButton('Контакты', () => scrollToSection(contactsKey)),
      ],
    );
  }

  Widget _buildNavigationMobile(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        _buildNavButton('Услуги', () => scrollToSection(servicesKey)),
        _buildNavButton('Галерея', () => scrollToSection(galleryKey)),
        _buildNavButton('Контакты', () => scrollToSection(contactsKey)),
      ],
    );
  }

  Widget _buildNavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF1A237E),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1A237E),
            const Color(0xFF283593),
            const Color(0xFF3949AB),
          ],
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(
          vertical: isDesktop ? 100 : 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Качественный ремонт\nвашего автомобиля',
              style: GoogleFonts.montserrat(
                fontSize: isDesktop ? 48 : 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Профессиональное обслуживание и диагностика\nвсех марок автомобилей',
              style: GoogleFonts.roboto(
                fontSize: isDesktop ? 20 : 16,
                color: Colors.white.withOpacity(0.9),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => scrollToSection(contactsKey),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40 : 30,
                  vertical: isDesktop ? 20 : 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Связаться с нами',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(
          vertical: isDesktop ? 80 : 60,
        ),
        child: Column(
          children: [
            Text(
              'О нашем сервисе',
              style: GoogleFonts.montserrat(
                fontSize: isDesktop ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Мы предоставляем полный спектр услуг по ремонту и обслуживанию автомобилей. '
              'Наши специалисты имеют многолетний опыт работы и используют только качественные '
              'запчасти и современное оборудование.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: isDesktop ? 18 : 16,
                color: Colors.grey[700],
                height: 1.6,
              ),
            ),
            const SizedBox(height: 60),
            isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeature(Icons.verified, 'Гарантия качества', 'На все виды работ'),
                      _buildFeature(Icons.speed, 'Быстро', 'Оперативное выполнение'),
                      _buildFeature(Icons.attach_money, 'Доступно', 'Честные цены'),
                    ],
                  )
                : Column(
                    children: [
                      _buildFeature(Icons.verified, 'Гарантия качества', 'На все виды работ'),
                      const SizedBox(height: 32),
                      _buildFeature(Icons.speed, 'Быстро', 'Оперативное выполнение'),
                      const SizedBox(height: 32),
                      _buildFeature(Icons.attach_money, 'Доступно', 'Честные цены'),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A237E).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 48,
            color: const Color(0xFF1A237E),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A237E),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(
          vertical: isDesktop ? 80 : 60,
        ),
        child: Column(
          children: [
            Text(
              'Наши услуги',
              style: GoogleFonts.montserrat(
                fontSize: isDesktop ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 60),
            isDesktop
                ? GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 1.2,
                    children: _buildServiceCards(),
                  )
                : Column(
                    children: _buildServiceCards()
                        .map((card) => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: card,
                            ))
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildServiceCards() {
    return [
      _buildServiceCard(
        Icons.car_repair,
        'Диагностика',
        'Комплексная диагностика всех систем автомобиля',
      ),
      _buildServiceCard(
        Icons.settings,
        'Ремонт двигателя',
        'Капитальный и текущий ремонт двигателя',
      ),
      _buildServiceCard(
        Icons.oil_barrel,
        'Замена масла',
        'Замена масла и фильтров',
      ),
      _buildServiceCard(
        Icons.tire_repair,
        'Ремонт КПП и АКПП',
        '',
      ),
      _buildServiceCard(
        Icons.tire_repair,
        'Ремонт рулевых реек',
        '',
      ),
      _buildServiceCard(
        Icons.car_crash,
        'Кузовной ремонт',
        'Рихтовка и покраска кузова',
      ),
      _buildServiceCard(
        Icons.electric_bolt,
        'Электрика',
        'Ремонт электрооборудования',
      ),
    ];
  }

  Widget _buildServiceCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: const Color(0xFF1A237E),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGallerySection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Список всех изображений из assets/images
    final imagePaths = [
      'assets/images/photo_2025-12-02 07.10.35.jpeg',
      'assets/images/photo_2025-12-02 07.10.38.jpeg',
      'assets/images/photo_2025-12-02 07.10.39.jpeg',
      'assets/images/photo_2025-12-02 07.10.40.jpeg',
      'assets/images/photo_2025-12-02 07.10.41.jpeg',
      'assets/images/photo_2025-12-02 07.10.42.jpeg',
      'assets/images/photo_2025-12-02 07.10.43.jpeg',
      'assets/images/photo_2025-12-02 07.10.44.jpeg',
      'assets/images/photo_2025-12-02 07.10.45.jpeg',
      'assets/images/photo_2025-12-02 07.10.46.jpeg',
      'assets/images/photo_2025-12-02 07.10.47.jpeg',
      'assets/images/photo_2025-12-02 07.10.48.jpeg',
      'assets/images/photo_2025-12-02 07.10.49.jpeg',
      'assets/images/photo_2025-12-02 07.10.50 (1).jpeg',
      'assets/images/photo_2025-12-02 07.10.50.jpeg',
      'assets/images/photo_2025-12-02 07.10.51.jpeg',
    ];
    
    // Определяем количество колонок в зависимости от размера экрана
    final crossAxisCount = isDesktop ? 3 : (screenWidth > 600 ? 2 : 1);
    // Количество фотографий в первой строке
    final firstRowCount = crossAxisCount;
    // Количество фотографий для отображения
    final visibleCount = _isGalleryExpanded ? imagePaths.length : firstRowCount;
    
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(
          vertical: isDesktop ? 80 : 60,
        ),
        child: Column(
          children: [
            Text(
              'Галерея',
              style: GoogleFonts.montserrat(
                fontSize: isDesktop ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Наши работы и оборудование',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 60),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.0,
              ),
              itemCount: visibleCount,
              itemBuilder: (context, index) => _buildGalleryImage(imagePaths[index], context),
            ),
            // Divider для раскрытия/скрытия галереи
            if (imagePaths.length > firstRowCount)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isGalleryExpanded = !_isGalleryExpanded;
                  });
                  // Плавно прокручиваем к галерее после переключения
                  Future.delayed(const Duration(milliseconds: 100), () {
                    scrollToSection(galleryKey);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                        indent: 50,
                        endIndent: 50,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isGalleryExpanded ? 'Скрыть фотографии' : 'Показать все фотографии',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1A237E),
                            ),
                          ),
                          const SizedBox(width: 8),
                          AnimatedRotation(
                            duration: const Duration(milliseconds: 300),
                            turns: _isGalleryExpanded ? 0.5 : 0,
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFF1A237E),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryImage(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Можно добавить просмотр изображения в полном размере
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.error, color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContactsSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    // URL для карт
    final yandexMapsUrl = 'https://yandex.ru/maps/?text=${Uri.encodeComponent('Волгоград, Проспект Ленина, д. 69а')}';
    final twoGisUrl = 'https://2gis.ru/volgograd/search/Проспект%20Ленина%2069а';
    
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(
          vertical: isDesktop ? 80 : 60,
        ),
        child: Column(
          children: [
            Text(
              'Контакты',
              style: GoogleFonts.montserrat(
                fontSize: isDesktop ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Свяжитесь с нами удобным способом',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 60),
            isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildContactCards(),
                  )
                : Column(
                    children: _buildContactCards()
                        .map((card) => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: SizedBox(
                                width: double.infinity,
                                child: card,
                              ),
                            ))
                        .toList(),
                  ),
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFF1A237E),
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Адрес сервиса',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A237E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'г. Волгоград, Проспект Ленина, д. 69а',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                  isDesktop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildMapButton(
                              '2ГИС',
                              Icons.map,
                              twoGisUrl,
                              const Color(0xFF00A1FF),
                            ),
                            const SizedBox(width: 16),
                            _buildMapButton(
                              'Яндекс Карты',
                              Icons.map_outlined,
                              yandexMapsUrl,
                              const Color(0xFFFF0000),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _buildMapButton(
                              '2ГИС',
                              Icons.map,
                              twoGisUrl,
                              const Color(0xFF00A1FF),
                            ),
                            const SizedBox(height: 12),
                            _buildMapButton(
                              'Яндекс Карты',
                              Icons.map_outlined,
                              yandexMapsUrl,
                              const Color(0xFFFF0000),
                            ),
                          ],
                        ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Color(0xFF1A237E),
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'График работы',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A237E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Пн-Вс: 9:00 - 18:00',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContactCards() {
    return [
      _buildContactCard(
        FontAwesomeIcons.telegram,
        'Telegram',
        '@autoservice',
        'https://t.me/autoservice',
        const Color(0xFF0088cc),
      ),
      _buildContactCard(
        FontAwesomeIcons.whatsapp,
        'WhatsApp',
        '+7 904 779-88-84',
        'https://wa.me/79991234567',
        const Color(0xFF25D366),
      ),
      _buildContactCard(
        Icons.email,
        'Email',
        'info@autoservice.ru',
        'mailto:info@autoservice.ru',
        const Color(0xFFD93025),
      ),
      _buildContactCard(
        Icons.phone,
        'Телефон',
        '+7 904 779-88-84',
        'tel:+79991234567',
        const Color(0xFF1A237E),
      ),
    ];
  }

  Widget _buildContactCard(IconData icon, String title, String value, String url, Color color) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32,
                color: color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Нажмите для связи',
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapButton(String text, IconData icon, String url, Color color) {
    return SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        onPressed: () => _launchURL(url),
        icon: Icon(icon, size: 18),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A237E),
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            '© 2025 Автосервис. Все права защищены.',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _launchURL('tel:+79047798884'),
                icon: const Icon(Icons.phone, color: Colors.white),
              ),
              IconButton(
                onPressed: () => _launchURL('https://t.me/autoservice'),
                icon: const FaIcon(FontAwesomeIcons.telegram, color: Colors.white),
              ),
              IconButton(
                onPressed: () => _launchURL('https://wa.me/79047798884'),
                icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
              ),
              IconButton(
                onPressed: () => _launchURL('mailto:info@autoservice.ru'),
                icon: const Icon(Icons.email, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Не удалось открыть $url'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
