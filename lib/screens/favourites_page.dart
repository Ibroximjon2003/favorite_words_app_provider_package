import 'package:favourite_word_app_provider_package/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final words = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body:  ListView.builder(
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
    );
  }
}
