import 'package:flutter/material.dart';

class CustomAuthTextfield extends StatefulWidget {
  const CustomAuthTextfield(
      {super.key,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.password = false,
      this.keyboardTyp});
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType? keyboardTyp;
  final bool password;

  @override
  State<CustomAuthTextfield> createState() => _CustomAuthTextfieldState();
}

class _CustomAuthTextfieldState extends State<CustomAuthTextfield> {
  bool showPAssword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardTyp,
        obscureText: widget.password && !showPAssword,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(249, 250, 252, 1),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          //   prefixIconConstraints: BoxConstraints(maxWidth: 30, maxHeight: 30),
          suffixIcon: widget.password == true
              ? IconButton.filled(
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                  icon: Icon(
                    showPAssword == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showPAssword = !showPAssword;
                    setState(() {});
                  },
                )
              : widget.suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
