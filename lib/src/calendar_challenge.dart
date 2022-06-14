import 'package:flutter/material.dart';

class CalendarChallenge extends StatefulWidget {
  CalendarChallenge({
    Key? key,
    this.calendarChallengeMargin,
    this.title,
    this.subTitle,
    this.progress = 0,
  }) : super(key: key);

  final EdgeInsetsGeometry? calendarChallengeMargin;
  final String? title;
  final String? subTitle;
  final double progress;

  @override
  State<CalendarChallenge> createState() => _CalendarChallengeState();
}

class _CalendarChallengeState extends State<CalendarChallenge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.calendarChallengeMargin ?? const EdgeInsets.symmetric(horizontal: 16),
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
              widget.title ?? '',
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
              value: widget.progress,
              color: const Color(0xff9270FB),
              backgroundColor: const Color(0xff9270FB).withOpacity(0.4),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.subTitle ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
