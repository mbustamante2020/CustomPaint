import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercise 4 − CustomPaint'),
          centerTitle: true,
        ),
        body: CustomPaint(
          size: Size(300, 600),
          painter: MyPainter(),
          child: Container(height: 600),
          foregroundPainter: Circle(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var center =
        Offset(size.width / 2, size.height / 2); // punto medio en el canvas

    // se dibuja un rectangulo
    paint.color = Colors.blue; // color de la figura
    var rect = Rect.fromLTWH(0, 0, size.width,
        size.height); // Se crea un rectangulo del mismo tamaño del canvas
    canvas.drawRect(rect, paint); // se dibuja el rectangulo

    //se dibuja una linea horizontal en la mital del canvas
    paint.color = Colors.black; // color de la figura
    paint.strokeWidth = 5; // ancho de la linea
    Offset startingPoint = Offset(0, size.height / 2); // punto de inicio
    Offset endingPoint = Offset(size.width, size.height / 2); //punto final
    canvas.drawLine(startingPoint, endingPoint, paint); // se dibuja la linea

    //se dibuja un circulo
    paint.color = Colors.red; // color de la figura
    canvas.drawCircle(center, 80.0, paint); // se dibuja el circulo de radio 80
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white; // color de la figura
    paint.strokeWidth = 5; // ancho de la linea
    paint.style = PaintingStyle.stroke; // dibujar la circunferencia

    var path = Path(); // Este objeto permite dibujar una ruta personalizada
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 40,
    )); // dibuja un ovalo de igual altura y anchura
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
