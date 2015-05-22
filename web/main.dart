import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:angular2/src/reflection/reflection.dart' show reflector;
import 'package:angular2/src/reflection/reflection_capabilities.dart' show ReflectionCapabilities;


@Component(
    selector: 's-home'
)
@View(
    template: '<h1>I am Home</h1><a router-link="child">Go Child</a>',
    directives: const [RouterLink]
)
class Home {
  Home(){
    print('home init');
  }
}

//
//
//

@Component(
  selector: 's-child'
)
@View(
    template: '<h1>I am Child</h1><a router-link="home">Go Home</a>',
    directives: const [RouterLink]
)
class Child {
  Child() {
    print('child init');
  }
}

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
  directives: const [RouterOutlet]
)
class Index {
  Router router;

  Index(Router this.router) {
    router.config([
      { 'path': '/child', 'component': Child, 'as': 'child'},
      { 'path': '/', 'component': Home, 'as': 'home'}
    ]);
  }
}

main() {
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  bootstrap(Index, routerInjectables);
}
