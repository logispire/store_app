import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart_store/util/dimensions.dart';
import 'package:sixam_mart_store/util/styles.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Function iconPressed;
  final Function? onSubmit;
  final Function? onChanged;

  const SearchField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.suffixIcon,
      required this.iconPressed,
      this.onSubmit,
      this.suffixWidget,
      this.onChanged})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO:OLD
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //         color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
      //         spreadRadius: 1,
      //         blurRadius: 5)
      //   ],
      // ),
      child: TextField(
        controller: widget.controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeSmall,
              color: Theme.of(context).disabledColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: Theme.of(context).primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: Theme.of(context).primaryColor),
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          isDense: true,
          suffixIcon: IconButton(
            onPressed: widget.iconPressed as void Function()?,
            icon: widget.suffixWidget ?? Icon(widget.suffixIcon),
          ),
        ),
        onSubmitted: widget.onSubmit as void Function(String)?,
        onChanged: widget.onChanged as void Function(String)?,
      ),
    );
  }
}
