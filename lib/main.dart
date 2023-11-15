import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_exchange/presentation/LoadState.dart';
import 'package:gweiland_exchange/presentation/bloc/CryptoBloc.dart';
import 'package:gweiland_exchange/presentation/bloc/CryptoEvent.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.locator<CryptoBloc>())],
      child: BlocBuilder<CryptoBloc, LoadState>(builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: GestureDetector(
            onTap: () {
              context.read<CryptoBloc>().add(const FetchNextCryptosList());
              print("Tapped!!!");
            },
            child: const Text('Flutter Demo Home Page'),
          ),
        );
      }),
    );
  }
}
