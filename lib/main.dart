import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/screens/tabs_screen.dart';
import 'package:todo_app/services/app_router.dart';
import 'package:todo_app/services/app_theme.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue?AppThemes.appThemeData[AppTheme.darkTheme]:AppThemes.appThemeData[AppTheme.lightTheme],
            debugShowCheckedModeBanner: false,
            home: TabsScreen(),
            onGenerateRoute: appRouter.onGenerenerateRoute,
          );
        },
      ),
    );
  }
}
