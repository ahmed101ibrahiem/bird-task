import 'package:bird_task/view/screens/login_screens.dart';
import 'package:bird_task/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator.dart' as di;
import 'core/utils/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LoginCubit>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Task',
        home:  LoginScreen(),
      ),
    );
  }
}
