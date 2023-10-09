import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomToastMessage extends StatefulWidget {
  String message;
  bool? error;
  CustomToastMessage({super.key,required this.message,this.error});

  @override
  State<CustomToastMessage> createState() => _CustomToastMessageState();
}

class _CustomToastMessageState extends State<CustomToastMessage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(elevation: 10,borderRadius: BorderRadius.circular(15),
        child: Container(width: MediaQuery.of(context).size.width-100,
          decoration: BoxDecoration(
            color: Colors.white,
            // color: widget.error==null?CustomTheme.theamColor:Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(
                widget.error==null?Icons.check_circle:Icons.warning,size: 30,color:  widget.error==null?Color.fromARGB(255, 3, 84, 6):Color.fromARGB(255, 194, 21, 8),
                // color: Colors.white,
              ),
              SizedBox(width: 10),
              SizedBox(width: MediaQuery.of(context).size.width/2.1,
                child:  Text(
                    overflow: TextOverflow.clip,  
                    widget.message,
                    style: TextStyle(
                      // color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                
              ),
              ],),
              Icon(Icons.close),
            ],
          ),
        ),
      ),
    );
  }
}
