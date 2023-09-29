import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageFeedApp(),
    );
  }
}

class ImageFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? PortraitImageFeed()
              : LandscapeImageFeed();
        },
      ),
    );
  }
}

class PortraitImageFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Display at least 10 items
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            alignment: Alignment.center,
            child: Image.network(
              'https://picsum.photos/200/300.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class LandscapeImageFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Minimum 2 items in a row
      ),
      itemCount: 10, // Display at least 10 items
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
