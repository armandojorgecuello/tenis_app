import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_tennis/ui/utils/colors.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key, required this.imageList});
  final List<String> imageList;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carrusel de imágenes
        SizedBox(
          height: 269.h,
          width: MediaQuery.sizeOf(context).width,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(widget.imageList[index], fit: BoxFit.cover),
              );
            },
          ),
        ),

        // Botón de regreso
        Positioned(
          top: 50.h,
          left: 20.h,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.greenAppbar,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 40.h,
            height: 40.h,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Positioned(
          top: 50.h,
          right: 20.h,
          child: SizedBox(
            width: 40.h,
            height: 40.h,
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imageList.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 12.h,
                height: 12.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentPage == index
                          ? AppColor.greenDot
                          : AppColor.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
