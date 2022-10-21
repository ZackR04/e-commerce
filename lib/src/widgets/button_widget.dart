part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String caption;
  final bool isLoading;
  final double? width;
  final Function()? onPressed;

  const ButtonWidget(
      {super.key,
      required this.caption,
      this.isLoading = false,
      this.width,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.blue[600],
          elevation: 0.0,
        ),
        onPressed: (isLoading) ? null : onPressed,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: (isLoading)
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue[600]),
                  )
                : Text(
                    caption,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )),
      ),
    );
  }
}
