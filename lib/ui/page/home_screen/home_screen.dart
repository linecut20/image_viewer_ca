import 'package:flutter/material.dart';
import 'package:image_viewer_ca/data/photo_provider.dart';
import 'package:image_viewer_ca/model/photo.dart';
import 'package:image_viewer_ca/ui/widget/photo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController textController;

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
    final homeScreenViewModel = PhotoProvider.of(context).homeScreenViewModel;

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
                      homeScreenViewModel.fetch(textController.text.toString());
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
          StreamBuilder<List<Photo>>(
              stream: homeScreenViewModel.photoStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                final photos = snapshot.data!;

                return Expanded(
                  child: GridView.builder(
                    itemCount: photos.length,
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemBuilder: (context, index) => PhotoCard(
                      photo: photos[index],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
