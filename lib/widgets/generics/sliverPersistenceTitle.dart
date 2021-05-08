import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _maxHeaderExtent = 84.0;
const _minHeaderExtent = 60.0;
const _maxTitleSize = 35.0;
const _minTitleSize = 20.0;
const _maxBottomArrow = 16;
const _minBottomArrow = 0;
const _maxShadow = 8;
const _minShadow = 0;

class SliverPersistenceTitle extends SliverPersistentHeaderDelegate {
  final String title;
  final bool enableBackArrow;
  final VoidCallback onTap;
  final Color backgroundColor;

  SliverPersistenceTitle({
    @required this.title,
    this.enableBackArrow = false,
    this.onTap,
    this.backgroundColor,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    final titleSize =
        (_maxTitleSize * (1 - percent)).clamp(_minTitleSize, _maxTitleSize);
    final bottomArrow = (_maxBottomArrow * (1 - percent))
        .clamp(_minBottomArrow, _maxBottomArrow);
    final blurRadius = (_minShadow + percent) * _maxShadow;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: blurRadius,
                offset: Offset(0.0, 0.0))
          ],
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).backgroundColor, width: 0))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: GoogleFonts.getFont(fontApp,
                  textStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2.color,
                      fontSize: titleSize,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          (!enableBackArrow)
              ? Container()
              : Positioned(
                  bottom: bottomArrow,
                  child: BackArrow(
                    onPressed: onTap,
                  ),
                )
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
