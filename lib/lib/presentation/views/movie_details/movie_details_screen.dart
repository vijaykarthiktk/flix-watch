import 'package:cached_network_image/cached_network_image.dart';
import 'package:flixwatch/core/utils/tmdb_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/movie_details_model.dart';
import '../../viewmodels/movie_details_view_model.dart';

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
    Future.microtask(
          () => context.read<MovieDetailsViewModel>().loadMovieDetails(widget.movieId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Consumer<MovieDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.state == MovieDetailsState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.error),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.retry(widget.movieId),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final MovieDetailsModel? movieDetails = viewModel.movieDetails;
          if (movieDetails == null) {
            return const Center(child: Text('No details available'));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie backdrop
                  MoviePoster(movieDetails: movieDetails),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Summary',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(movieDetails.overview),
                        const SizedBox(height: 16),
                        // Add more details as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.movieDetails,
  });

  final MovieDetailsModel movieDetails;

  String _runtimeToString(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;
    return '${hours}h ${minutes}m';
  }
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Container(
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.topCenter,
              image: CachedNetworkImageProvider(
                movieDetails.fullPosterPath,
              ),
            )
          ),
        ),
        // Gradient
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  colorScheme.surface.withOpacity(1),
                  colorScheme.surface.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        // Movie details
        Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie poster
                Row(
                  children: [
                    SvgPicture.asset('assets/logo/IMDb.svg', height: 16),
                    const SizedBox(width: 4),
                    Text(
                      movieDetails.formattedRating,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Text(
                  '${movieDetails.title} ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '${movieDetails.releaseDate.substring(0, 4)} · ${_runtimeToString(movieDetails.runtime)}  · ${movieDetails.genres.map((genre) => TMDBConstants.movieGenres[genre.id]).join(', ')}',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )
        ),
        Positioned(
          top: 50,
          left: 16,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colorScheme.onSurface,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        // Favorite button
        Positioned(
          top: 50,
          right: 16,
          child: IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
            // TODO: Add to favorites function
            },
          ),
        ),
      ],
    );
  }
}