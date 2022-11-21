import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final String? Function(String?)? validator;
  final Function(String)? onSaved;
  final Function(String)? onChanged;
  final bool digitsOnly;
  final bool isDisabled;
  final bool isAmount;
  final bool readOnly;
  final bool expands;
  final bool isEnabled;
  final int? maxLines, maxLength, minLines;
  final Widget? suffix;
  final Widget? leading;
  final bool isPassword;
  final double? width, height, radius;
  final TextCapitalization textCapitalization;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.labelText,
      this.hintText,
      this.initialValue,
      this.borderColor,
      this.fillColor,
      this.hintColor,
      this.keyboardType,
      this.focusNode,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.readOnly = false,
      this.digitsOnly = false,
      this.isDisabled = false,
      this.isAmount = false,
      this.isEnabled = true,
      this.maxLines,
      this.maxLength,
      this.suffix,
      this.leading,
      this.radius,
      this.isPassword = false,
      this.expands = false,
      this.width,
      this.height,
      this.minLines,
      this.textCapitalization = TextCapitalization.sentences})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscured;
  @override
  void initState() {
    super.initState();
    if (widget.isPassword) {
      obscured = true;
    } else {
      obscured = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: widget.width ?? MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
          maxHeight: widget.height ?? 180,
          maxWidth: widget.width ?? MediaQuery.of(context).size.width,
          minWidth: 55,
          minHeight: 50),
      decoration: BoxDecoration(
          color: widget.fillColor ??
              Theme.of(context).highlightColor.withOpacity(.05),
          borderRadius: BorderRadius.circular(widget.radius ?? 6),
          border: widget.borderColor == null
              ? null
              : Border.all(color: (widget.borderColor)!)),
      child: Row(
        children: [
          widget.leading ?? const SizedBox(),
          widget.leading != null ? const SizedBox(width: 6) : const SizedBox(),
          Expanded(
            child: TextFormField(
              readOnly: widget.readOnly,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: widget.textCapitalization,
              initialValue: widget.initialValue,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              focusNode: widget.focusNode,
              controller: widget.controller,
              expands: widget.expands,
              onChanged: widget.onChanged,
              enabled: widget.isEnabled,
              maxLines: widget.isPassword ? 1 : widget.maxLines,
              minLines: widget.minLines,
              maxLength: widget.maxLength,
              obscureText: obscured,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: widget.isAmount
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : widget.keyboardType,
              style: TextStyle(
                color: const Color(0xFF121212).withOpacity(.8),
                fontSize: 13,
              ),
              inputFormatters: !widget.digitsOnly
                  ? null
                  : [FilteringTextInputFormatter.allow(RegExp(r'\d'))],
              decoration: InputDecoration(
                isDense: true,
                counterText: "",
                labelText: widget.labelText,
                labelStyle: TextStyle(
                    color: Theme.of(context).highlightColor.withOpacity(.3),
                    fontSize: 13,
                    fontWeight: FontWeight.w300),
                floatingLabelStyle: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF7F7F7F),
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            obscured = !obscured;
                          });
                        },
                        child: Icon(
                          obscured ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFF121212),
                        ),
                      )
                    : widget.suffix,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
