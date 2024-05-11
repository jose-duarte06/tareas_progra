import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String figura = '';
  String mensaje = '';

  void dibujarFigura(String figura) {
    setState(() {
      this.figura = figura;
      switch (figura.toLowerCase()) {
        case 'triangulo':
          mensaje = '';
          break;
        case 'cuadrado':
          mensaje = '';
          break;
        default:
          mensaje = 'Figura no encontrada';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dibujar Figuras'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                figura = value;
              },
              decoration: InputDecoration(
                hintText: 'Escriba la figura que desea',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                dibujarFigura(figura);
              },
              child: Text('Aceptar'),
            ),
            SizedBox(height: 20),
            if (mensaje.isNotEmpty)
              Text(
                mensaje,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (figura.toLowerCase() == 'triángulo')
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: TrianguloPainter(),
                ),
              ),
            if (figura.toLowerCase() == 'cuadrado')
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }
}

class TrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
