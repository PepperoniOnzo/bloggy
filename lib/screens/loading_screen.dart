import 'package:bloggy/data/constants/configurations.dart';
import 'package:bloggy/data/services/firebase_service.dart';
import 'package:bloggy/widgets/loading_module/loading_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/routes/routes.dart';
import '../views/view_auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseService.initFirebaseServices().then((_) {
      context.read<ViewAuth>().checkAuth().then((user) {
        Future.delayed(AppConfig.loadingDuration).then((value) {
          if (user == null) {
            Navigator.pushReplacementNamed(context, AppRoutes.auth);
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoadingLogo());
  }
}
