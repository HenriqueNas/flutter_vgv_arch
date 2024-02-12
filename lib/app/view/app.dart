import 'package:flutter/material.dart';
import 'package:flutter_vgv_arch/app/app.dart';

import 'package:flutter_vgv_arch/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: appRoutes,
      initialRoute: Routes.home,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(Routes.login),
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.register),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
