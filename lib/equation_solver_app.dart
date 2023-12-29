import 'package:flutter/material.dart';
import 'equation_solver_screen.dart'; // Changez cette ligne

class EquationSolverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIVOT DE GAUSS DU PR KISAME ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EquationSolverScreen(),
    );
  }
}
