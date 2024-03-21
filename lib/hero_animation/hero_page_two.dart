import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HeroPageTwo extends StatefulWidget {
  final String animationTag;
  final String image;
  const HeroPageTwo(
      {super.key, required this.animationTag, required this.image});

  @override
  State<HeroPageTwo> createState() => _HeroPageTwoState();
}

class _HeroPageTwoState extends State<HeroPageTwo> {
  ScrollController? _scrollController;
  bool? _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible!) {
          setState(() {
            _isVisible = false;
          });
        }
      } else if (_scrollController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible!) {
          setState(() {
            _isVisible = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: widget.animationTag,
        transitionOnUserGestures: true,
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                // stretch: true,
                surfaceTintColor: Colors.white,
                pinned: true,
                // floating: true,
                expandedHeight: MediaQuery.sizeOf(context).width * .7,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/${widget.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.transparent,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Treehouse in Tandi, India',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                title: Text('Second Section'),
              ),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 500))
            ],
          ),
          bottomNavigationBar: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: _isVisible! ? 56 : 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: MaterialButton(
                  color: Colors.amber,
                  onPressed: () {},
                  child: const Text('Book'),
                ),
              )),
        ),
      ),
    );
  }
}
