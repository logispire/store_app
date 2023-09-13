import 'package:sixam_mart_store/controller/splash_controller.dart';
import 'package:sixam_mart_store/util/dimensions.dart';
import 'package:sixam_mart_store/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final int maxLines;
  final bool isPassword;
  final Function? onTap;
  final Function? onChanged;
  final Function? onSubmit;
  final bool? isEnabled;
  final TextCapitalization capitalization;
  final Color? fillColor;
  final bool isAmount;
  final bool isNumber;
  final bool amountIcon;
  final bool title;
  final Function? onComplete;
  final bool readOnly;

  const MyTextField({
    Key? key,
    this.hintText = '',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.onTap,
    this.fillColor,
    this.isPassword = false,
    this.isAmount = false,
    this.isNumber = false,
    this.amountIcon = false,
    this.title = true,
    this.onComplete,
    this.readOnly = false,
  }) : super(key: key);

  @override
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.title
          ? Row(children: [
              Text(
                widget.hintText,
                style: robotoBold.copyWith(
                    fontSize: Dimensions.paddingSizeDefault,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: Dimensions.paddingSizeExtraSmall),
              widget.isEnabled!
                  ? const SizedBox()
                  : Text('(${'non_changeable'.tr})',
                      style: robotoRegular.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: Theme.of(context).colorScheme.error,
                      )),
            ])
          : const SizedBox(),
      SizedBox(height: widget.title ? Dimensions.paddingSizeExtraSmall : 0),
      Container(
        height: widget.maxLines != 5 ? 50 : 100,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          //TODO:OLD
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
          //       spreadRadius: 1,
          //       blurRadius: 5,
          //       offset: const Offset(0, 5))
          // ],
        ),
        child: TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          readOnly: widget.readOnly,
          style: robotoRegular,
          textInputAction: widget.nextFocus != null
              ? widget.inputAction
              : TextInputAction.done,
          keyboardType: widget.isAmount
              ? const TextInputType.numberWithOptions(decimal: true)
              : widget.isNumber
                  ? TextInputType.number
                  : widget.inputType,
          autofillHints: widget.inputType == TextInputType.name
              ? [AutofillHints.name]
              : widget.inputType == TextInputType.emailAddress
                  ? [AutofillHints.email]
                  : widget.inputType == TextInputType.phone
                      ? [AutofillHints.telephoneNumber]
                      : widget.inputType == TextInputType.streetAddress
                          ? [AutofillHints.fullStreetAddress]
                          : widget.inputType == TextInputType.url
                              ? [AutofillHints.url]
                              : widget.inputType ==
                                      TextInputType.visiblePassword
                                  ? [AutofillHints.password]
                                  : null,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          textAlignVertical: TextAlignVertical.center,
          autofocus: false,
          //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                ]
              : widget.isNumber
                  ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                  : widget.isAmount
                      ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
                      : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            isDense: true,
            filled: true,
            fillColor: widget.fillColor ?? Theme.of(context).cardColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 2,
                  color: Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 2,
                  color: Theme.of(context).primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 2,
                  color: Theme.of(context).primaryColor),
            ),
            hintStyle:
                robotoRegular.copyWith(color: Theme.of(context).hintColor),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: _toggle,
                  )
                : null,
            prefixIcon: widget.amountIcon
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSizeDefault,
                        horizontal: Dimensions.paddingSizeSmall),
                    child: Text(
                        Get.find<SplashController>()
                            .configModel!
                            .currencySymbol!,
                        style: robotoBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge)),
                  )
                : null,
          ),
          onTap: widget.onTap as void Function()?,
          onSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
          onChanged: widget.onChanged as void Function(String)?,
          onEditingComplete: widget.onComplete as void Function()?,
        ),
      ),
    ]);
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
