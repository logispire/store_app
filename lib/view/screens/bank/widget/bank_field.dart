import 'package:sixam_mart_store/util/dimensions.dart';
import 'package:sixam_mart_store/util/styles.dart';
import 'package:flutter/material.dart';

class BankField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputAction inputAction;
  final TextCapitalization capitalization;

  const BankField(
      {Key? key,
      this.hintText = '',
      this.controller,
      this.focusNode,
      this.nextFocus,
      this.inputAction = TextInputAction.next,
      this.capitalization = TextCapitalization.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        hintText,
        style: robotoBold.copyWith(
            fontSize: Dimensions.paddingSizeDefault,
            color: Theme.of(context).primaryColor),
      ),
      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
      TextField(
        controller: controller,
        focusNode: focusNode,
        style: robotoRegular,
        textInputAction: inputAction,
        cursorColor: Theme.of(context).primaryColor,
        textCapitalization: capitalization,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          hintStyle: robotoRegular.copyWith(color: Theme.of(context).hintColor),
        ),
      ),
      const SizedBox(height: Dimensions.paddingSizeDefault),
    ]);
  }
}
