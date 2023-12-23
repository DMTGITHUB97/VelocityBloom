import 'package:flutter/material.dart';
import 'package:velocitybloom/utils/image_const.dart';

class SlideTransitionScreen extends StatefulWidget{
  const SlideTransitionScreen({key : Key}) : super(key: key);
  
  @override
  State<SlideTransitionScreen> createState() => _SlideTransitionScreenState();
}

class _SlideTransitionScreenState extends State<SlideTransitionScreen> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController = AnimationController
    (duration: const Duration(milliseconds: 1000), vsync: this,)..repeat
    (reverse:
  true);
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(parent: _animationController, curve: Curves
      .easeIn));

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return SlideTransition(
      position: offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(Images.toysBaby, width: MediaQuery.of(context).size
            .width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,),
      ),
    );
  }
}