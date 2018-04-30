import 'package:angular_router/angular_router.dart';

final heroes = new RoutePath(path: 'heroes');

const idParam = 'id';
final hero = new RoutePath(path: '${heroes.path}/:$idParam');

final dashboard = new RoutePath(path: 'dashboard');

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}