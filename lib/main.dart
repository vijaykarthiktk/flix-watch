import 'package:flixwatch/data/repositories/people/cast_repository.dart';
import 'package:flixwatch/lib/presentation/viewmodels/cast_view_model.dart';

import 'core/network/api_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/themes/app_theme.dart';
import 'data/repositories/movie_repository.dart';
import 'data/services/movie_service.dart';
import 'lib/presentation/viewmodels/movie_details_view_model.dart';
import 'lib/presentation/viewmodels/movie_view_model.dart';
import 'lib/presentation/views/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ApiClient()),
        ProxyProvider<ApiClient, MovieService>(
          update: (_, apiClient, __) => MovieService(apiClient),
        ),
        ProxyProvider<MovieService, MovieRepository>(
          update: (_, movieService, __) => MovieRepository(movieService),
        ),
        ChangeNotifierProxyProvider<MovieRepository, MovieViewModel>(
          create: (context) => MovieViewModel(context.read<MovieRepository>()),
          update: (_, repository, viewModel) =>
          viewModel ?? MovieViewModel(repository),
        ),
        ChangeNotifierProxyProvider<MovieRepository, MovieDetailsViewModel>(
          create: (context) => MovieDetailsViewModel(context.read<MovieRepository>()),
          update: (_, repository, viewModel) =>
          viewModel ?? MovieDetailsViewModel(repository),
        ),
        ChangeNotifierProxyProvider<CastRepositoryImpl, CastViewModel>(
          create: (context) => CastViewModel(context.read<CastRepositoryImpl>()),
          update: (_, repository, viewModel) =>
          viewModel ?? CastViewModel(repository),
        ),
      ],
      child: MaterialApp(
        title: 'FlixWatch',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
