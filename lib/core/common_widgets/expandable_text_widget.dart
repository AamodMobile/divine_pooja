

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/small_texts.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 1200 / 5.63;

  // i  love flutter laravel and golang 30
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallTexts(color: Colors.black, size: 10, text: firstHalf)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallTexts(height: 4.0, color: Colors.black, size: 10, text: hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf)),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Text(
                    hiddenText ? "Read Item description" : "Read less description",
                    style: TextStyle(
                      color: Color(0xFF2E65E7),
                      fontFamily: medium,
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
