import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder_hsse/domain/entities/cat.dart';
import 'package:cat_tinder_hsse/presentation/screens/detail_screen.dart';

class CatCard extends StatefulWidget {
  final Cat cat;
  final void Function(bool like) onSwipe;

  const CatCard({super.key, required this.cat, required this.onSwipe});

  @override
  State<CatCard> createState() => _CatCardState();
}

class _CatCardState extends State<CatCard> {
  double _drag = 0, _startX = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onPanStart: (d) => _startX = d.localPosition.dx,
        onPanUpdate:
            (d) => setState(() => _drag = d.localPosition.dx - _startX),
        onPanEnd: (d) {
          final w = MediaQuery.of(context).size.width;
          final swipe =
              _drag.abs() > w * .2 ||
              d.velocity.pixelsPerSecond.dx.abs() > w * .5;
          if (swipe) widget.onSwipe(_drag > 0);
          setState(() => _drag = 0);
        },
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailScreen(cat: widget.cat)),
            ),
        child: Transform.translate(
          offset: Offset(_drag, 0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CachedNetworkImage(
                    imageUrl: widget.cat.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder:
                        (_, __) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (_, __, ___) =>
                            const Icon(Icons.error_outline, size: 60),
                  ),
                ),
              ),
              Positioned(
                bottom: 18,
                left: 18,
                right: 18,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.cat.breedName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
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
