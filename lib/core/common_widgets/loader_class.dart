
import 'package:divine_pooja/constants/constants.dart';

class LoaderClass extends StatefulWidget {
  final double height;
  const LoaderClass({super.key, required this.height});

  @override
  State<LoaderClass> createState() => _LoaderClassState();
}

class _LoaderClassState extends State<LoaderClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      color: mainColor.withOpacity(0.05),
      child: const Center(
        child: CircularProgressIndicator(
          color: mainColor,
        ),
      ),
    );
  }
}
