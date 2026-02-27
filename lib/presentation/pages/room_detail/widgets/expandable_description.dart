import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/pages/room_detail/widgets/button_room_detail_widget.dart';

class ExpandableDescription extends StatefulWidget {
  final String text;

  const ExpandableDescription({super.key, required this.text});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.topLeft,
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Text(
            widget.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              height: 1.5,
            ),
          ),
          secondChild: Text(
            widget.text,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ButtonRoomDetailWidget(
          text: isExpanded ? "Show less" : "Read more",
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
      ],
    );
  }
}
