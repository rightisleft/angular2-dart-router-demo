import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:angular2/src/reflection/reflection.dart' show reflector;
import 'package:angular2/src/reflection/reflection_capabilities.dart' show ReflectionCapabilities;


@Component(
    selector: 'home'
)
@View(
    template: '<home><h1>I am Home</h1><a router-link="child">Go Child</a><home>',
    directives: const [RouterOutlet, RouterLink]
)
class Home {}

//
//
//

@Component(
  selector: 'child'
)
@View(
    template: '<child><h1>I am Child</h1><a router-link="home">Go Home</a><child>',
    directives: const [RouterOutlet, RouterLink]
)
class Child {}

//
//
//

@Component(
  selector: 'index'
)
@View(
  template: '''
  <router-outlet></router-outlet>
            ''',
  directives: const [RouterOutlet, RouterLink]
)
class Index {
  Router router;

  Index(Router this.router) {
    router.config({ 'path': '/child', 'component': Child, 'alias': 'child'});
    router.config({ 'path': '/', 'component': Home, 'alias': 'home'});
  }
}

main() {
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  bootstrap(Index, routerInjectables);
}
