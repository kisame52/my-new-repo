import 'package:flutter/material.dart';

class EquationSolverScreen extends StatefulWidget {
  @override
  _EquationSolverScreenState createState() => _EquationSolverScreenState();
}

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

  //--------------------

  Widget buildTextField(TextEditingController controller, String labelText) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      // Espacement de 2% de la largeur de l'écran
      child: Container(
        width: screenWidth * 0.2, // 20% de la largeur de l'écran
        height: screenHeight * 0.1, // 10% de la hauteur de l'écran
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: 5,
          textAlign: TextAlign.center,
          // Centrer le texte saisi horizontalement
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.all(10.0),
            // Ajout d'un espacement entre le texte saisi et la bordure
            isDense: true,
            // Réduire la hauteur du champ de saisie pour centrer le texte saisi verticalement
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0.2), // Augmenter l'épaisseur de la bordure de 0.2
            ),
            counterText: "", // Supprimer le compteur de caractères
          ),
        ),
      ),
    );
  }

  //-------------------------------
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight =
        screenWidth * 0.2; // Augmentation de la hauteur de l'élément parent
    return Scaffold(
      appBar: AppBar(
        title: Text('PIVOT DE GAUSS DU PR KISAME'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
            screenWidth * 0.02), // Espacement de 2% de la largeur de l'écran
        child: Column(
          children: [
            Container(
              height: containerHeight,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(a1Controller, 'a1'))),
                  Text('X'),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(b1Controller, 'b1'))),
                  Text('Y'),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(c1Controller, 'c1'))),
                  Text('Z ='),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(d1Controller, 'd1'))),
                ],
              ),
            ),
            SizedBox(
                height: screenWidth *
                    0.02), // Espacement de 2% de la largeur de l'écran
            Container(
              height: containerHeight,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(a2Controller, 'a2'))),
                  Text('X '),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(b2Controller, 'b2'))),
                  Text('Y '),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(c2Controller, 'c2'))),
                  Text('Z ='),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(d2Controller, 'd2'))),
                ],
              ),
            ),
            SizedBox(
                height: screenWidth *
                    0.02), // Espacement de 2% de la largeur de l'écran
            Container(
              height: containerHeight,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(a3Controller, 'a3'))),
                  Text('X'),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(b3Controller, 'b3'))),
                  Text('Y'),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(c3Controller, 'c3'))),
                  Text('Z ='),
                  Expanded(
                      child: Container(
                          height: containerHeight,
                          child: buildTextField(d3Controller, 'd3'))),
                ],
              ),
            ),
            SizedBox(
                height: screenWidth *
                    0.02), // Espacement de 2% de la largeur de l'écran
            ElevatedButton(
              onPressed: solveEquations,
              child: Text('RESOUDRE'),
            ),
            SizedBox(
                height: screenWidth *
                    0.02), // Espacement de 2% de la largeur de l'écran
            Text('Solution:'),
            SizedBox(
                height: screenWidth *
                    0.01), // Espacement de 1% de la largeur de l'écran
            Text('x = $x'),
            Text('y = $y'),
            Text('z = $z'),
          ],
        ),
      ),
    );
  }
}
