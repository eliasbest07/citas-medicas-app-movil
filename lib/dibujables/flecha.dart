
//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.6891891891891891).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class Fecha extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(size.width*1.182432,size.height*8.602941);
    path_0.cubicTo(size.width*1.182432,size.height*8.588235,size.width*1.533784,size.height*7.843137,size.width*1.962838,size.height*6.941176);
    path_0.cubicTo(size.width*2.391892,size.height*6.039216,size.width*2.746622,size.height*5.294118,size.width*2.750000,size.height*5.279412);
    path_0.cubicTo(size.width*2.750000,size.height*5.264706,size.width*2.398649,size.height*4.514706,size.width*1.969595,size.height*3.607843);
    path_0.cubicTo(size.width*1.537162,size.height*2.700980,size.width*1.182432,size.height*1.950980,size.width*1.182432,size.height*1.936275);
    path_0.cubicTo(size.width*1.182432,size.height*1.921569,size.width*1.726351,size.height*1.916667,size.width*2.388514,size.height*1.921569);
    path_0.lineTo(size.width*3.591216,size.height*1.936275);
    path_0.lineTo(size.width*4.722973,size.height);
    path_0.cubicTo(size.width*5.158784,size.height,size.width*5.510135,size.height,size.width*5.510135,size.height);
    path_0.cubicTo(size.width*5.510135,size.height,size.width*5.158784,size.height,size.width*4.722973,size.height);
    path_0.lineTo(size.width*3.935811,size.height);
    path_0.lineTo(size.width*2.733108,size.height);
    path_0.cubicTo(size.width*2.070946,size.height,size.width*1.527027,size.height,size.width*1.527027,size.height);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
    path_1.moveTo(size.width*4.391892,size.height*8.607843);
    path_1.cubicTo(size.width*4.391892,size.height*8.593137,size.width*4.746622,size.height*7.838235,size.width*5.182432,size.height*6.931373);
    path_1.lineTo(size.width*5.976351,size.height*5.274510);
    path_1.lineTo(size.width*5.682432,size.height*4.656863);
    path_1.cubicTo(size.width*5.523649,size.height*4.318627,size.width*5.168919,size.height*3.573529,size.width*4.891892,size.height*3.004902);
    path_1.cubicTo(size.width*4.618243,size.height*2.431373,size.width*4.391892,size.height*1.950980,size.width*4.391892,size.height*1.936275);
    path_1.cubicTo(size.width*4.391892,size.height*1.921569,size.width*4.587838,size.height*1.911765,size.width*4.824324,size.height*1.911765);
    path_1.lineTo(size.width*5.256757,size.height*1.911765);
    path_1.lineTo(size.width*5.621622,size.height);
    path_1.cubicTo(size.width*5.760135,size.height,size.width*6.094595,size.height,size.width*6.364865,size.height);
    path_1.cubicTo(size.width*6.638514,size.height,size.width*6.885135,size.height,size.width*6.915541,size.height);
    path_1.lineTo(size.width*6.972973,size.height);
    path_1.lineTo(size.width*6.442568,size.height);
    path_1.cubicTo(size.width*6.148649,size.height,size.width*7.385135,size.height,size.width*7.597973,size.height);
    path_1.lineTo(size.width*7.331081,size.height);
    path_1.lineTo(size.width*6.895270,size.height);
    path_1.cubicTo(size.width*6.658784,size.height,size.width*6.462838,size.height,size.width*6.462838,size.height);
    path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_1,paint_1_fill);

Path path_2 = Path();
    path_2.moveTo(size.width*6.091216,size.height*8.553922);
    path_2.cubicTo(size.width*6.104730,size.height*8.514706,size.width*6.456081,size.height*7.764706,size.width*6.875000,size.height*6.892157);
    path_2.cubicTo(size.width*7.293919,size.height*6.014706,size.width*7.635135,size.height*5.284314,size.width*7.635135,size.height*5.269608);
    path_2.cubicTo(size.width*7.635135,size.height*5.254902,size.width*7.293919,size.height*4.524510,size.width*6.875000,size.height*3.651961);
    path_2.cubicTo(size.width*6.456081,size.height*2.774510,size.width*6.104730,size.height*2.024510,size.width*6.091216,size.height*1.985294);
    path_2.cubicTo(size.width*6.074324,size.height*1.916667,size.width*6.131757,size.height*1.911765,size.width*6.506757,size.height*1.921569);
    path_2.lineTo(size.width*6.942568,size.height*1.936275);
    path_2.lineTo(size.width*7.726351,size.height*3.578431);
    path_2.cubicTo(size.width*8.158784,size.height*4.480392,size.width*8.510135,size.height*5.245098,size.width*8.510135,size.height*5.269608);
    path_2.cubicTo(size.width*8.510135,size.height*5.299020,size.width*8.158784,size.height*6.058824,size.width*7.726351,size.height*6.960784);
    path_2.lineTo(size.width*6.942568,size.height*8.602941);
    path_2.lineTo(size.width*6.506757,size.height*8.617647);
    path_2.cubicTo(size.width*6.128378,size.height*8.627451,size.width*6.074324,size.height*8.622549,size.width*6.091216,size.height*8.553922);
    path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_2,paint_2_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}