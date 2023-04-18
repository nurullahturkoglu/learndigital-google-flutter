import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

SnackBar snackBarTemplate(String name, ContentType type) {
  return SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: type == ContentType.success ? 'Successful!' : 'Opss!',
      message: type == ContentType.success
          ? 'Congrulations! Successful $name.'
          : 'Something went wrong in $name',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: type,
    ),
  );
}

void showSnackBar(BuildContext context, String message, ContentType type) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: type == ContentType.success ? 'Successful!' : 'Opss!',
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: type,
      ),
    ),
  );
}
