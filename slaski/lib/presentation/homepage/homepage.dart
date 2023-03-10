
import 'package:flutter/material.dart';
import '../../backgroundimage.dart';
import '../../layout/layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String email});

  @override
  Widget build(BuildContext context) {
   
    return BackgroundImageWidget(
        image: Layout.isMobile(context)
            ? const AssetImage('images/chair.jpeg')
            : const AssetImage('images/pine.jpeg'),
        child:  Scaffold(
           backgroundColor: Colors.transparent,
          appBar:Layout.isMobile(context)?
          AppBar(
            backgroundColor: Colors.white,
          title: 
           const Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20, right: 30),
              child: Align(alignment: Alignment.topLeft,
                child: Image(
                    width: 100,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                    height: 30,
                    image: AssetImage('images/ing.png')),
              ),
            ),
          elevation: 10,)
          :null,
           
            body: const Layout()
           
                ));
  }
}

OutlineInputBorder myfocusborder() {
  return   const OutlineInputBorder(
    
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        style:BorderStyle.solid,
        color: Colors.deepOrangeAccent,
        width: 3,
      ));
}


