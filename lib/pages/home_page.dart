import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notas/routes/routes.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home page"),
            ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(DetailRoute());
                  // AutoRouter.of(context).pushNamed("/detail");
                },
                child: Text("Detail page"))
          ],
        ),
      ),
    );
  }
}
