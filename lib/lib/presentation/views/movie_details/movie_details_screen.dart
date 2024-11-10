import 'package:flutter/material.dart';

class MovieDetailsView extends StatefulWidget {
  final String movieId;

  const MovieDetailsView({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: Center(child: Text("Soon"),),
    );
  }
}