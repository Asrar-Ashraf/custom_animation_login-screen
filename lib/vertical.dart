import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animation/diffrent_shape.dart';
import 'package:flutter_staggered_animation/star.dart';

class Vertical extends StatefulWidget {
  const Vertical({super.key});

  @override
  State<Vertical> createState() => _VerticalState();
}

class _VerticalState extends State<Vertical> with TickerProviderStateMixin {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _emails = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FocusNode username = FocusNode();
  final FocusNode email = FocusNode();
  final FocusNode password = FocusNode();
  final FocusNode login = FocusNode();
  late AnimationController _controller;
  late AnimationController _circles;
  late AnimationController _StaggerdController;
  late Animation<Alignment> top;
  late Animation<Alignment> diamond;
  late Animation<Alignment> circle;
  late Animation<Alignment> circle1;
  late Animation<Alignment> circle2;
  late Animation<Alignment> circle3;

  late Animation<double> angle;
  late Animation<double> opacity;
  late Animation<double> cir;

  void removefiled() {
    if (_password.text.isNotEmpty ||
        _emails.text.isNotEmpty ||
        _username.text.isNotEmpty) {
      setState(() {
        _password.text = "";
        _username.text = "";
        _emails.text = "";
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("text filed already empty")));
    }
  }

  void logins() {
    if (_password.text.isEmpty &&
        _emails.text.isEmpty &&
        _username.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("first fill all textfiled")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "username: ${_username.text} , password: ${_password.text}  is successfully",
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _circles = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.forward();
    _controller.repeat(reverse: true);
    _circles.forward();
    _circles.repeat(reverse: true);
    opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _StaggerdController = AnimationController(
      vsync: this,
      duration: Duration(minutes: 1),
    );
    _StaggerdController.forward();
    _StaggerdController.repeat();

    top =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.centerRight,
              end: Alignment.bottomCenter,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
            weight: 3,
          ),
        ]).animate(
          CurvedAnimation(parent: _StaggerdController, curve: Curves.linear),
        );
    diamond =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.center,
              end: Alignment.centerLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.centerRight,
              end: Alignment.center,
            ),
            weight: 3,
          ),
        ]).animate(
          CurvedAnimation(parent: _StaggerdController, curve: Curves.linear),
        );

    circle =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.centerRight,
              end: Alignment.topRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            ),
            weight: 3,
          ),
        ]).animate(
          CurvedAnimation(parent: _StaggerdController, curve: Curves.linear),
        );
    circle1 =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.centerRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.topRight,
            ),
            weight: 3,
          ),
        ]).animate(
          CurvedAnimation(parent: _StaggerdController, curve: Curves.linear),
        );

    circle2 =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomLeft,
              end: Alignment.center,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.center,
              end: Alignment.topLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            weight: 3,
          ),
        ]).animate(
          CurvedAnimation(parent: _StaggerdController, curve: Curves.linear),
        );

    circle3 =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topLeft,
              end: Alignment.center,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.center,
              end: Alignment.topRight,
            ),
            weight: 3,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
            weight: 3,
          ),
        ]).animate(
          CurvedAnimation(parent: _StaggerdController, curve: Curves.linear),
        );
    angle = Tween(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _StaggerdController,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    cir = Tween(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _circles, curve: Curves.easeInCubic));
  }

  @override
  void dispose() {
    _StaggerdController.dispose();
    _controller.dispose();
    _circles.dispose();
    _username.dispose();
    _emails.dispose();
    _password.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
    login.dispose();
    super.dispose();
  }

  int rand = 255;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    final size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 51, 50),
      body: Stack(
        children: [
          // small star
          //1
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.13, height * 0.27),
              child: Star(),
            ),
          ),
          //2
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.83, height * 0.1),
              child: Star(),
            ),
          ),
          //3
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.63, height * 0.08),
              child: Star(),
            ),
          ),
          //4
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.3, height * 0.09),
              child: Star(),
            ),
          ),

          //5
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.13, height * 0.1),
              child: Star(),
            ),
          ),
          //6
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.5, height * 0.5),
              child: Star(),
            ),
          ),
          //7
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(offset: Offset(80, 20), child: Star()),
          ),
          //8
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.8, height * 0.7),
              child: Star(),
            ),
          ),

          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.4, height * 0.6),
              child: Star(),
            ),
          ),
          //9
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.8, height * 0.4),
              child: Star(),
            ),
          ),
          //3
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.55, height * 0.8),
              child: Star(),
            ),
          ),
          //4
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(offset: Offset(150, 650), child: Star()),
          ),

          //5
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.9, height * 0.9),
              child: Star(),
            ),
          ),
          //6
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.3, height * 0.96),
              child: Star(),
            ),
          ),
          //7
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.88, height * 0.57),
              child: Star(),
            ),
          ),
          //8
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.7, height * 0.3),
              child: Star(),
            ),
          ),
          FadeTransition(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(width * 0.14, height * 0.76),
              child: Star(),
            ),
          ),
          //end star

          //first start
          AlignTransition(
            alignment: top,
            child: Transform.translate(
              offset: Offset(50, 170),
              child: SizedBox(
                height: size.shortestSide * 0.8,
                width: size.shortestSide * 0.6,
                child: ClipPath(
                  clipper: DiffrentShape(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.white,
                          const Color.fromARGB(255, 3, 40, 253),
                          Colors.orange,
                          Colors.cyan,
                          const Color.fromARGB(255, 82, 0, 235),
                          Colors.purpleAccent,
                        ],
                      ),
                      border: Border.all(color: Colors.white, width: 10),
                    ),
                  ),
                ),
              ),
            ),
          ),

          AlignTransition(
            alignment: diamond,
            child: RotationTransition(
              turns: angle,
              child: SizedBox(
                height: size.shortestSide * 0.35,
                width: size.shortestSide * 0.35,
                child: ClipPath(
                  clipper: DiamondClipper(),
                  child: Card(
                    elevation: 140,
                    shadowColor: Colors.grey,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.white,
                            const Color.fromARGB(255, 3, 40, 253),
                            Colors.orange,
                            Colors.cyan,
                            const Color.fromARGB(255, 82, 0, 235),
                            Colors.purpleAccent,
                          ],
                        ),

                        border: Border.all(color: Colors.white, width: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AlignTransition(
            alignment: circle,
            child: FadeTransition(
              opacity: cir,
              child: CustomPaint(
                painter: StokeCirclePainter(),
                size: Size(width * 0.3, height * 0.3),
              ),
            ),
          ),
          AlignTransition(
            alignment: circle1,
            child: FadeTransition(
              opacity: cir,
              child: CustomPaint(
                painter: StokeCirclePainter(),
                size: Size(width * 0.3, height * 0.3),
              ),
            ),
          ),
          AlignTransition(
            alignment: circle2,
            child: FadeTransition(
              opacity: cir,
              child: CustomPaint(
                painter: StokeCirclePainter(),
                size: Size(width * 0.3, height * 0.3),
              ),
            ),
          ),
          AlignTransition(
            alignment: circle3,
            child: FadeTransition(
              opacity: cir,
              child: CustomPaint(
                painter: StokeCirclePainter(),
                size: Size(width * 0.3, height * 0.3),
              ),
            ),
          ),
          Center(
            child: Container(
              height: height * 0.5,
              width: width * 0.8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white38, Colors.black38, Colors.white38],
                ),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: _username,
                      autofocus: true,
                      focusNode: username,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(email);
                      },
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                        constraints: BoxConstraints(
                          minWidth: width * 0.2,
                          maxWidth: width * 0.6,
                        ),

                        label: Text("Username"),
                        labelStyle: TextStyle(color: Colors.white),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 2, 17, 226),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: _emails,
                      focusNode: email,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(password);
                      },
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.message, color: Colors.white),
                        constraints: BoxConstraints(
                          minWidth: width * 0.2,
                          maxWidth: width * 0.6,
                        ),

                        label: Text("Email"),
                        labelStyle: TextStyle(color: Colors.white),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 2, 17, 226),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: _password,
                      focusNode: password,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(login);
                      },
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password, color: Colors.white),
                        constraints: BoxConstraints(
                          minWidth: width * 0.2,
                          maxWidth: width * 0.6,
                        ),

                        label: Text("Password"),
                        labelStyle: TextStyle(color: Colors.white),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 2, 17, 226),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: removefiled,
                          child: Text("Cancle"),
                        ),
                        ElevatedButton(onPressed: logins, child: Text("Login")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
