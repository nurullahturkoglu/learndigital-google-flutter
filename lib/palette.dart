import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pallete {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
  Color fontColor = Colors.grey.shade400;

  Widget facebookSvgIcon = Padding(
    padding: const EdgeInsets.all(8.0),
    child: SvgPicture.asset(
      'assets/svgs/f_logo.svg',
      colorFilter: const ColorFilter.mode(
        Pallete.whiteColor,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'A red up arrow',
      height: 20,
    ),
  );

  Widget googleSvgIcon = Padding(
    padding: const EdgeInsets.all(8.0),
    child: SvgPicture.asset(
      'assets/svgs/g_logo.svg',
      colorFilter: const ColorFilter.mode(
        Pallete.whiteColor,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'A red up arrow',
      height: 20,
    ),
  );

  final snackBarSuccess = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Successful!',
      message: 'Congrulations! Successful register.',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
    ),
  );
}
