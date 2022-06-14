import 'package:flutter/material.dart';

class StarChallenge extends StatelessWidget {
  const StarChallenge({
    Key? key,
    this.margin,
    required this.icon,
    required this.title,
    required this.infoText,
    this.onInfoTap,
    required this.progress,
  }) : super(key: key);
  final EdgeInsetsGeometry? margin;
  final Widget icon;
  final String title;
  final String infoText;
  final void Function()? onInfoTap;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff352565),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: LinearProgressIndicator(
              minHeight: 6,
              value: progress,
              color: const Color(0xff9270FB),
              backgroundColor: const Color(0xff9270FB).withOpacity(0.4),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          icon,
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: onInfoTap,
            child: Text(
              infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xffDF64B8), fontSize: 12, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
