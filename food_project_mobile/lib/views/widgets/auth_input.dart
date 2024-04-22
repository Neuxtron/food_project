import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final bool multiline;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const AuthInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.multiline = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            widget.label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 5),
          child: Stack(
            children: [
              TextField(
                controller: widget.controller,
                keyboardType: widget.multiline
                    ? TextInputType.multiline
                    : widget.keyboardType,
                obscureText: widget.isPassword && !_showPassword,
                minLines: widget.multiline ? 3 : 1,
                maxLines: widget.multiline ? null : 1,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  filled: true,
                  isCollapsed: true,
                  hintStyle: const TextStyle(color: Color(0xFFC8BDBD)),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  fillColor: const Color(0xFFFCEFEF),
                  enabledBorder:
                      widget.multiline ? buildMultilineBorder() : buildBorder(),
                  focusedBorder:
                      widget.multiline ? buildMultilineBorder() : buildBorder(),
                ),
              ),
              widget.isPassword
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() => _showPassword = !_showPassword);
                        },
                        color: Colors.black,
                        icon: _showPassword
                            ? const Icon(Icons.visibility_off_rounded)
                            : const Icon(Icons.visibility_rounded),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  InputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(999),
      borderSide: BorderSide.none,
    );
  }

  InputBorder buildMultilineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
