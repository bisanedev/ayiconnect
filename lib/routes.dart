import 'package:auto_route/auto_route.dart';
import 'screens/steps/step_register.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/",name:"StepRegister",page: StepRegisterScreen , initial: true),   
  ],
)
class $AppRouter {}