import 'package:english_words/english_words.dart';
import 'package:favourite_word_app_provider_package/provider/favourite_provider.dart';
import 'package:favourite_word_app_provider_package/screens/favourites_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English words'),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavourite(word);
              },
              icon: provider.isExist(word)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    )
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => const FavouritesPage(),
          );
          Navigator.push(context, route);
        },
        label: const Text('Favourites'),
      ),
    );
  }
}
