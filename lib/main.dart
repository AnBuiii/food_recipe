import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: ScreenA(),
    // );
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

@RoutePage()
class ScreenA extends HookConsumerWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoRouter.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Screen A"),
            ElevatedButton(
              onPressed: () {
                router.pushNamed("/b");
              },
              child: const Text("to Screen B"),
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class ScreenB extends HookConsumerWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hm = AutoRouter.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text("Screen B"),
            ElevatedButton(
                onPressed: () {
                  hm.pop();
                },
                child: Text("back to screen A"))
          ],
        ),
      ),
    );
  }
}