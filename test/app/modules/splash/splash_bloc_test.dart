import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:teste_slyde/app/modules/splash/splash_bloc.dart';
import 'package:teste_slyde/app/modules/splash/splash_module.dart';

void main() {
  initModule(SplashModule());
  SplashBloc bloc;

  setUp(() {
    bloc = SplashModule.to.bloc<SplashBloc>();
  });

  group('SplashBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<SplashBloc>());
    });
  });
}
