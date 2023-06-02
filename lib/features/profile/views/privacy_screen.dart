import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../favorite/controllers/favorite_controller.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }

    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Clear cache'),
              onTap: () => _deleteCacheDir(),
            ),
            ListTile(title: const Text('Clear search history'), onTap: () {}),
            Consumer(
              builder: (context, ref, child) {
                final favoriteController =
                    ref.read(favoriteProvider).clearFavorite();
                return ListTile(
                  title: const Text('Clear favorite cocktails'),
                  onTap: () => favoriteController,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
