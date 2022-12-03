import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_app/ul/login_page.dart';
import 'cubit/app_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ), //themeData
      home: MultiBlocProvider(providers: [
        // registro
        BlocProvider(create: (context) => AppCubit()),
        //  BlocProvider(create: (context) => SingInCubit()),
        //  BlocProvider(create: (context) => MakeOrderCubit()),
      ], child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Delivery"),
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (BuildContext context, state) {
            if (!state.isLoading) {
              return LoginPage();
            } else if (state.isLoading) {
              //return const Center(child: CircularProgressIndicador());
            } else if (state.isUserLoggedIn) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bienvenido ${state.loginResponseDto!.firstName}"),
                    ElevatedButton(
                        //boton
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).logout();
                        },
                        child: const Text("Logout")) //ElevatedButton
                  ],
                ), //Column
              ); //Center
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ) // This trailing comma makes auto-formatting nicer for build methods.
        ); //Scaffold
  }
}
