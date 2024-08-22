import 'package:go_router/go_router.dart';
import 'package:gym_project/modules/clients_accounts/routes/clients_routes.dart';
import 'package:gym_project/modules/home/home_routes.dart';

final GoRouter routes = GoRouter(routes: [
  homeRoutes,
  clientRoute,
]);
