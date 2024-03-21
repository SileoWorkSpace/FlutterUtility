import 'package:flutter/material.dart';
import 'package:flutterutility/hero_animation/hero_page_two.dart';

class HeroPageOne extends StatefulWidget {
  const HeroPageOne({super.key});

  @override
  State<HeroPageOne> createState() => _HeroPageOneState();
}

class _HeroPageOneState extends State<HeroPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const HeroPageTwo(
                          animationTag: 'Animation',
                          image: 'karsten-winegeart-sStahKEhT9w-unsplash-2.jpg',
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.decelerate;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HeroPageTwo(
                  //               animationTag: 'Animation',
                  //               image:
                  //                   'karsten-winegeart-sStahKEhT9w-unsplash-2.jpg',
                  //             )));
                },
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'Animation',
                  child: Container(
                    margin: const EdgeInsets.all(18),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width * .85,
                            child: Image.asset(
                              "assets/images/karsten-winegeart-sStahKEhT9w-unsplash-2.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Material(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Shimla, India',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Profesional Host',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '11-16 Apr',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '₹136',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'night',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HeroPageTwo(
                                animationTag: 'Animation2',
                                image: 'andrea-davis-k8WL83m48XY-unsplash.jpg',
                              )));
                },
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'Animation2',
                  child: Container(
                    margin: const EdgeInsets.all(18),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width * .85,
                            child: Image.asset(
                              "assets/images/andrea-davis-k8WL83m48XY-unsplash.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Material(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Shimla, India',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Profesional Host',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '11-16 Apr',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '₹136',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'night',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
