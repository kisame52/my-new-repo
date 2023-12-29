import 'package:hochigaki/equation_solver_app.dart';
import 'package:hochigaki/equation_solver_screen.dart';
import 'package:hochigaki/equation_solver_state.dart';
import 'package:hochigaki/main.dart';
import 'package:flutter/material.dart';

class _EquationSolverScreenState extends State<EquationSolverScreen> {
  TextEditingController a1Controller = TextEditingController();
  TextEditingController b1Controller = TextEditingController();
  TextEditingController c1Controller = TextEditingController();
  TextEditingController d1Controller = TextEditingController();
  TextEditingController a2Controller = TextEditingController();
  TextEditingController b2Controller = TextEditingController();
  TextEditingController c2Controller = TextEditingController();
  TextEditingController d2Controller = TextEditingController();
  TextEditingController a3Controller = TextEditingController();
  TextEditingController b3Controller = TextEditingController();
  TextEditingController c3Controller = TextEditingController();
  TextEditingController d3Controller = TextEditingController();

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  void solveEquations() {
    double a1 = double.parse(a1Controller.text);
    double b1 = double.parse(b1Controller.text);
    double c1 = double.parse(c1Controller.text);
    double r1 = double.parse(d1Controller.text);
    double a2 = double.parse(a2Controller.text);
    double b2 = double.parse(b2Controller.text);
    double c2 = double.parse(c2Controller.text);
    double r2 = double.parse(d2Controller.text);
    double a3 = double.parse(a3Controller.text);
    double b3 = double.parse(b3Controller.text);
    double c3 = double.parse(c3Controller.text);
    double r3 = double.parse(d3Controller.text);

    double xm1 = a1 * a2;
    double ym1 = b1 * a2;
    double zm1 = c1 * a2;
    double rm1 = r1 * a2;

    double vxm1 = xm1 * -1;
    double vym1 = ym1 * -1;
    double vzm1 = zm1 * -1;
    double vr1 = rm1 * -1;

    double xm2 = a2 * a1;
    double ym2 = b2 * a1;
    double zm2 = c2 * a1;
    double rm2 = r2 * a1;

    double vxm2 = xm2;
    double vym2 = ym2;
    double vzm2 = zm2;
    double vr2 = rm2;

    double s1y = vym1 + vym2;
    double s1z = vzm1 + vzm2;
    double sd1 = vr1 + vr2;

    double xm3 = a1 * a3;
    double ym3 = b1 * a3;
    double zm3 = c1 * a3;
    double rm3 = r1 * a3;

    double vxm3 = xm3 * -1;
    double vym3 = ym3 * -1;
    double vzm3 = zm3 * -1;
    double vr3 = rm3 * -1;

    double xm4 = a3 * a1;
    double ym4 = b3 * a1;
    double zm4 = c3 * a1;
    double rm4 = r3 * a1;

    double vxm4 = xm4;
    double vym4 = ym4;
    double vzm4 = zm4;
    double vr4 = rm4;

    double s3y = vym3 + vym4;
    double s3z = vzm3 + vzm4;
    double sd2 = vr3 + vr4;

    double yy = s1y * s3y;
    double zz = s1z * s3y;
    double dd = sd1 * s3y;

    double vyy1 = yy * -1;
    double vzz1 = zz * -1;
    double vdd1 = dd * -1;

    double yy2 = s1y * s3y;
    double zz2 = s3z * s1y;
    double dd2 = sd2 * s1y;

    double vyy2 = yy2;
    double vzz2 = zz2;
    double vdd2 = dd2;

    double sommez = vzz1 + vzz2;
    double sommed = vdd1 + vdd2;

    double zt = sommed / sommez;

    double N = s3z * zt;
    double T = N * -1;
    double P = T + sd2;
    double M = P / s3y;

    double yt = M;

    double C = b1 * yt;
    double CZ = c1 * zt;
    double CCA = C + CZ;
    double iCCA = CCA * -1;
    double BV = iCCA + r1;
    double XX = BV / a1;

    double xt = XX;

    setState(() {
      x = xt;
      y = yt;
      z = zt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PIVOT DE GAUSS DU PR KISAME '),
      ),
      body: Column(
        children: [
          Text('Enter les coefficients  :'),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: a1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'a1',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: b1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'b1',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: c1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'c1',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: d1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'd1',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: a2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'a2',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: b2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'b2',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: c2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'c2',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: d2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'd2',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: a3Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'a3',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: b3Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'b3',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: c3Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'c3',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: d3Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'd3',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: solveEquations,
            child: Text('RESOUDRE'),
          ),
          SizedBox(height: 16.0),
          Text('Solution:'),
          Text('x = $x'),
          Text('y = $y'),
          Text('z = $z'),
        ],
      ),
    );
  }
}
