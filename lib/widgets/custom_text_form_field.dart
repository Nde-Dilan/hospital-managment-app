import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:hospital_managment_app/styles/palette.dart';

class CustomTextFormField extends StatefulWidget {
  bool obscureText;
  final String errorMessage;
  final String hintText;

  final IconData? icon;
  final IconData? prefixIcon;
  CustomTextFormField(
      {super.key,
      this.prefixIcon,
      required this.icon,
      required this.obscureText,
      required this.errorMessage,
      required this.hintText});
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  static final _log = Logger('custom_text_form_field.dart');

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return TextFormField(
      textAlign: TextAlign.left,
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: palette.violet,
        ),
        suffixIcon: InkWell(
            onTap: () {
              _log.info("Setting obscureText with ${!widget.obscureText}");
              setState(() {
                widget.obscureText = !widget.obscureText;

                _log.info("obscureText is now ${!widget.obscureText}");
              });
            },
            child: Icon(
              widget.icon,
              color: palette.violet,
            )),
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 14,
          
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
