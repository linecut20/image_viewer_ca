import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_viewer_ca/page/home_screen_page/home_screen_view_model.dart';
import 'package:image_viewer_ca/ui/widget/photo_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController textController;
  late final StreamSubscription eventStreamSubscription;

  @override
  void initState() {
    textController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final read = context.read<HomeScreenViewModel>();
      eventStreamSubscription = read.eventStream.listen((event) {
        final snackBar = SnackBar(content: Text(event));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    eventStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenViewModelWatch = context.watch<HomeScreenViewModel>();
    final homeScreenViewModelRead = context.read<HomeScreenViewModel>();

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
                      homeScreenViewModelRead
                          .fetch(textController.text.toString());
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
          homeScreenViewModelRead.isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: GridView.builder(
                    itemCount: homeScreenViewModelWatch.photos.length,
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemBuilder: (context, index) => PhotoCard(
                      photo: homeScreenViewModelWatch.photos[index],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
