import 'package:go_router/go_router.dart';
import 'package:gym_project/modules/home/pages/homeapp_screen.dart';

final GoRoute homeRoutes = GoRoute(
    path: '/',
    name: 'home',
    builder: (
      context,
      state,
    ) =>
        const HomeappScreen());
