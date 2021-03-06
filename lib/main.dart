import 'package:bloggy/data/constants/colors.dart';
import 'package:bloggy/data/constants/theme.dart';
import 'package:bloggy/data/routes/routes.dart';
import 'package:bloggy/views/view_auth.dart';
import 'package:bloggy/views/view_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';
import 'views/view_validation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ViewAuth()),
      ChangeNotifierProvider(create: (_) => ViewValidation()),
      ChangeNotifierProvider(create: (_) => ViewHome()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.textPrimary,
            ),
      ),
      initialRoute: AppRoutes.loading,
      routes: {
        AppRoutes.loading: (context) => const LoadingScreen(),
        AppRoutes.auth: (context) => const AuthScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.addPost: (context) => const AddPostScreen(),
        AppRoutes.post: (context) => const PostDetails(),
        AppRoutes.edit: (context) => const EditPostScreen(),
      },
    );
  }
}
