import 'package:flutter/material.dart';
import 'package:image_viewer_ca/model/photo.dart';
import 'package:image_viewer_ca/ui/widget/photo_card.dart';
import 'package:image_viewer_ca/data/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController textController;

  List<Photo> photos = [];

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    if (textController.text.toString().trim().isNotEmpty) {
                      final String query =
                          textController.text.toString().trim();

                      PixabayApi.photoCardFetch(query).then((value) {
                        setState(() {
                          photos = value;
                        });
                      });
                    }
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ),

          //grid area
          Expanded(
            child: GridView.builder(
              itemCount: photos.length,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
              itemBuilder: (context, index) => PhotoCard(
                photo: photos[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
