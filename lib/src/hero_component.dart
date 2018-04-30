import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart' as paths;

@Component (
  selector: 'my-hero',
  templateUrl: 'hero_component.html',
  directives: [coreDirectives, formDirectives]
)
class HeroComponent implements OnActivate {
  final HeroService _heroService;
  final Location _location;

  Hero hero;

  HeroComponent(this._heroService, this._location);

  @override
  Future<void> onActivate(_, RouterState current) async {
    final id = paths.getId(current.parameters);
    if (id != null)
      hero = await (_heroService.get(id));
  }

  void goBack() => _location.back();
}