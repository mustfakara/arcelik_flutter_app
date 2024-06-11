import 'package:flutter/material.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class MainPage extends StatefulWidget {
  final ValueNotifier<bool> isScrolledNotifier;

  const MainPage({super.key, required this.isScrolledNotifier});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  late Timer _timer;

  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });

    _scrollController.addListener(() {
      widget.isScrolledNotifier.value = _scrollController.position.pixels > 1;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadImages() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      final List<String> paths = manifestMap.keys.where((String key) => key.contains('assets/slides/')).toList();

      setState(() {
        _images = paths;
      });
    } catch (error) {
      print('Error loading images: $error');
      // Handle error gracefully, e.g., show a placeholder image.
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: _buildPageView(),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item ${index + 1}'),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 45, 34),
                image: DecorationImage(
                  image: AssetImage(_images[index]),
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 80.0,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _images.length,
              effect: ScrollingDotsEffect(
                dotHeight: 6.0,
                dotWidth: 6.0,
                spacing: 20.0,
                dotColor: Colors.white.withOpacity(0.5),
                activeDotColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
