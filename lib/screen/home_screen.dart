import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    _MainPage(),
    _WordPage(),
    _ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class _MainPage extends StatelessWidget {
  const _MainPage();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.school_rounded,
                    color: colors.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'QuickWord',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colors.tertiaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '7 Gun Seri',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.onTertiaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.dark_mode_rounded),
                label: const Text('Koyu Mod / Acik Mod'),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    colors.primaryContainer,
                    colors.secondaryContainer,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dil hedefinize keyifli bir yolculukla ulasin.',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colors.onPrimaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Birden fazla dilde quiz cozumleriyle bilginizi test edin '
                    've kelime dagarciginizi kalici bicimde gelistirin.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onPrimaryContainer.withValues(alpha: 0.82),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      value: 0.58,
                      minHeight: 7,
                      backgroundColor: colors.onPrimaryContainer.withValues(
                        alpha: 0.20,
                      ),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colors.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Gunluk hedef: 20 sorunun 12 tanesi tamamlandi',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: <Widget>[
                Expanded(
                  child: _InfoCard(
                    icon: Icons.auto_awesome_rounded,
                    title: 'Bugun Ogrenilen',
                    value: '18 Kelime',
                    color: colors.secondaryContainer,
                    textColor: colors.onSecondaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _InfoCard(
                    icon: Icons.fact_check_rounded,
                    title: 'Dogru Orani',
                    value: '%84',
                    color: colors.tertiaryContainer,
                    textColor: colors.onTertiaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Desteklenen Diller',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Quizleri su an asagidaki dillerde cozebilirsiniz.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const _LanguageItem(
                    flagPath: 'assets/flags/united-kingdom.png',
                    countryName: 'Birlesik Krallik',
                    languageName: 'English',
                  ),
                  const SizedBox(height: 10),
                  const _LanguageItem(
                    flagPath: 'assets/flags/germany.png',
                    countryName: 'Almanya',
                    languageName: 'Deutsch',
                  ),
                  const SizedBox(height: 10),
                  const _LanguageItem(
                    flagPath: 'assets/flags/france.png',
                    countryName: 'Fransa',
                    languageName: 'Francais',
                  ),
                  const SizedBox(height: 10),
                  const _LanguageItem(
                    flagPath: 'assets/flags/spain.png',
                    countryName: 'Ispanya',
                    languageName: 'Espanol',
                  ),
                  const SizedBox(height: 10),
                  const _LanguageItem(
                    flagPath: 'assets/flags/italia.png',
                    countryName: 'Italya',
                    languageName: 'Italiano',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    required this.textColor,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: textColor),
          const SizedBox(height: 10),
          Text(
            title,
            style: theme.textTheme.labelLarge?.copyWith(color: textColor),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  const _LanguageItem({
    required this.flagPath,
    required this.countryName,
    required this.languageName,
  });

  final String flagPath;
  final String countryName;
  final String languageName;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              flagPath,
              width: 34,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              countryName,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            languageName,
            style: theme.textTheme.labelLarge?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _WordPage extends StatelessWidget {
  const _WordPage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
