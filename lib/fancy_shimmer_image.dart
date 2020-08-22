library fancy_shimmer_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'defaults.dart';
import 'widgets/widgets.dart';

///Widget that uses chached network image and Shimmer widgets to create
///beautiful widgets that are cached and have nice Shimmer effect
class FancyShimmerImage extends StatelessWidget {
  FancyShimmerImage({
    @required this.imageUrl,
    this.boxFit = BoxFit.fill,
    this.width = 300,
    this.height = 300,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
    this.errorWidget,
    this.color,
    this.colorBlendMode,
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeIn,
    this.alignment = Alignment.center,
    this.filterQuality = FilterQuality.low,
    this.imageBuilder,
    this.progressIndicatorBuilder,
  });

  final String imageUrl;
  final double width;
  final double height;
  final ShimmerDirection shimmerDirection;
  final Duration shimmerDuration;
  final BoxFit boxFit;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Color shimmerBackColor;
  final Widget errorWidget;
  final Color color;
  final AlignmentGeometry alignment;
  final BlendMode colorBlendMode;
  final ImageWidgetBuilder imageBuilder;
  final Duration fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final ProgressIndicatorBuilder progressIndicatorBuilder;
  final FilterQuality filterQuality;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
      width: width,
      height: height,
      color: color,
      alignment: alignment,
      colorBlendMode: colorBlendMode,
      imageBuilder: imageBuilder,
      fadeInCurve: fadeInCurve,
      fadeInDuration: fadeInDuration,
      fadeOutCurve: fadeOutCurve,
      fadeOutDuration: fadeOutDuration,
      progressIndicatorBuilder: progressIndicatorBuilder,
      filterQuality: filterQuality,
      placeholder: (context, url) => ImageShimmerWidget(
        width: width,
        height: height,
        shimmerDirection: shimmerDirection,
        shimmerDuration: shimmerDuration,
        baseColor: shimmerBaseColor ?? defaultShimmerBaseColor,
        highlightColor: shimmerHighlightColor ?? defaultShimmerHighlightColor,
        backColor: shimmerBackColor ?? defaultShimmerBackColor,
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          DefaultErrorWidget(
            width: width,
            height: height,
          ),
    );
  }
}
