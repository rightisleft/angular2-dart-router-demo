import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

@Component(
   selector: 'd'
  )
@View(
  template: '''
  <h1>Water {{name}}!</h1>
  <a href='#' router-link='Home'>Home</a>
  ''',
  directives: const [RouteConfig, RouterLink]
)
class HomeComp {
    String name;
    Router router;

    HomeComp(Router router) {
      this.name = "Jack";
      this.router = router;
    }

    void go() {
      print('go');
      router.navigate('/');
    }
}
