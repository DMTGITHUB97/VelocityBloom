import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'image_const.dart';

getAppBar(appBarText,
    {leading,
      leadingWidth,
      action,
      elevation,
      backgroundColor,
      foregroundColor,
      titleSpacing,
      bool automaticallyImplyLeading = false,
      bool centerTitle = false}) {
  return AppBar(
    title: appBarText,
    leading: leading,
    leadingWidth: leadingWidth,
    actions: action,
    automaticallyImplyLeading: automaticallyImplyLeading,
    elevation: elevation,
    backgroundColor: backgroundColor,
    centerTitle: centerTitle,
    foregroundColor: foregroundColor,
    titleSpacing: titleSpacing,
  );
}

getTextFormFiled(
    {controller,
      initialValue,
      bool obscureText = false,
      border,
      onSaved,
      validator,
      labelText,
      hintText,
      icon,
      boxConstraints,
      prefix,
      prefixIcon,
      prefixIconColor,
      prefixStyle,
      prefixText,
      suffix,
      suffixIcon,
      suffixIconColor,
      suffixStyle,
      suffixText,
      padding,
      error,
      errorBorder,
      errorMaxLines,
      errorStyle,
      errorText,
      enableBorder,
      disableBorder,
      bool isDense = false,
      bool enable = true}) {
  return TextFormField(
    controller: controller,
    initialValue: initialValue,
    obscureText: obscureText,
    onSaved: onSaved,
    validator: validator,
    decoration: InputDecoration(
      border: border,
      label: labelText,
      hintText: hintText,
      icon: icon,
      isDense: isDense,
      constraints: boxConstraints,
      enabled: enable,
      enabledBorder: enableBorder,
      disabledBorder: disableBorder,
      prefix: prefix,
      prefixIcon: prefixIcon,
      prefixIconColor: prefixIconColor,
      prefixStyle: prefixStyle,
      prefixText: prefixText,
      suffix: suffix,
      suffixIcon: suffixIcon,
      suffixIconColor: suffixIconColor,
      suffixStyle: suffixStyle,
      suffixText: suffixText,
      contentPadding: padding,
      error: error,
      errorBorder: errorBorder,
      errorMaxLines: errorMaxLines,
      errorStyle: errorStyle,
      errorText: errorText,
    ),
  );
}

getListTile({leading, title, subTitle,
  titleTextStyle,
  subTitleTextStyle,
  trailing,
  shape,
  selectedColor,
  selected,
  bool dense = false,
  listTypeStyle,
  padding,
  iconColor,
  textColor,
  titleAlignment,
  minVerticalPadding,
  minLeadingWidth,
  onTap}) {
  return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: trailing,
      shape: shape,
      selectedColor: selectedColor,
      selected: selected,
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subTitleTextStyle,
      dense: dense,
      contentPadding: padding,
      style: listTypeStyle,
      iconColor: iconColor,
      textColor: textColor,
      onTap: onTap,
      titleAlignment: titleAlignment,
      minVerticalPadding: minVerticalPadding,
      minLeadingWidth: minLeadingWidth);
}

getElevatedButtonWithIcon({onPressed, buttonText, icon, buttonStyle, textStyle}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: buttonStyle,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
          child: Icon(icon),
        ),
        Text(buttonText, style: textStyle),
      ],
    ),
  );
}

// CachedNetworkImage is a plugin
CachedNetworkImage getCachedNetworkImage(calculateHeight, calculateWidth)
{
  return CachedNetworkImage(
    fadeInCurve: Curves.easeIn,
    height: calculateHeight,
    width: calculateWidth,
    imageUrl: Images.googleImage,
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

ListTile getListTileWithTrailingIcon(context, title, subTitle, imageHeight,
    imageWidth)
{
  return ListTile(
    leading: getCachedNetworkImage(imageHeight, imageWidth),
    title: title,
    subtitle: subTitle,
    trailing: const Icon(Icons.more_vert),
  );
}

ElevatedButton getGoogleSignInAndSignUpButton(onPressed, btnText, textStyle,
    imageHeight, imageWidth)
{
  return ElevatedButton(onPressed: onPressed,
    style: ButtonStyle(shape: MaterialStateProperty.all
      (RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        backgroundColor: MaterialStateProperty.all(Colors.brown),
        foregroundColor: MaterialStateProperty.all(Colors.white)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image
              .asset(Images.googleImage, height: imageHeight, width: imageWidth,),
        ), Text
          (btnText, style:
        textStyle,)],),);
}

getSnakeBar(BuildContext context, content){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: content
    ),
  );
}