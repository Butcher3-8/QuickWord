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

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'QuickWord ile birden fazla dilde quiz çözerek bilginizi düzenli '
              'olarak sınayabilir, kelime dağarcığınızı sistemli ve kalıcı '
              'biçimde geliştirebilirsiniz.',
              style: theme.textTheme.titleMedium?.copyWith(height: 1.45),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mevcut Quiz Dilleri',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      Chip(label: Text('English')),
                      Chip(label: Text('Deutsch')),
                      Chip(label: Text('Français')),
                      Chip(label: Text('Español')),
                      Chip(label: Text('Italiano')),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: null,
              icon: const Icon(Icons.dark_mode_rounded),
              label: const Text('Koyu Mod / Açık Mod'),
            ),
          ],
        ),
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
