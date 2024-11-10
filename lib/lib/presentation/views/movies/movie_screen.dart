import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../domain/entities/movie.dart';
import '../../viewmodels/movie_view_model.dart';
import '../movie_details/movie_details_screen.dart';
import 'widgets/movie_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<MovieViewModel>().loadMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MovieViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: viewModel.movies.length,
            itemBuilder: (context, index) {
              final Movie movie = viewModel.movies[index];
              return MovieCard(
                movie: movie,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsView(movieId: movie.id.toString()),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
