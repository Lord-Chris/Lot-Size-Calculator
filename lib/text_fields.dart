import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final Widget? prefix;
  final bool readOnly;
  final bool expands;
  final int? minLines, maxLines, maxLength;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.number,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.prefix,
    this.initialValue,
    this.readOnly = false,
    this.expands = false,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
  })  : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Colors.blueGrey,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      maxLength: maxLength,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: suffix,
        prefixIcon: prefix,
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(0.2),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// class PhoneFieldView extends StatelessWidget {
//   final Key inputKey;
//   final String? label;
//   final String? hint;
//   final Widget? suffix;
//   final Widget? prefix;
//   final PhoneController controller;
//   final CountrySelectorNavigator selectorNavigator;
//   final bool withLabel;
//   final bool outlineBorder;
//   final bool shouldFormat;
//   final bool required;
//   final bool mobileOnly;

//   const PhoneFieldView({
//     Key? key,
//     this.label,
//     this.hint,
//     this.suffix,
//     this.prefix,
//     required this.inputKey,
//     required this.controller,
//     required this.selectorNavigator,
//     required this.withLabel,
//     required this.outlineBorder,
//     required this.shouldFormat,
//     required this.required,
//     required this.mobileOnly,
//   }) : super(key: key);

//   // PhoneNumberInputValidator? _getValidator() {
//   //   List<PhoneNumberInputValidator> validators = [];
//   //   if (required) {
//   //     validators.add(PhoneValidator.required());
//   //   }
//   //   if (mobileOnly) {
//   //     validators.add(PhoneValidator.validMobile());
//   //   } else {
//   //     validators.add(PhoneValidator.valid());
//   //   }
//   //   return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return AutofillGroup(
//       child: PhoneFormField(
//         key: inputKey,
//         controller: controller,
//      //   shouldFormat: shouldFormat,
//         autofocus: true,
//      //   autofillHints: const [AutofillHints.telephoneNumber],
//         selectorNavigator: selectorNavigator,
//         defaultCountry: 'NGN',
//         decoration: InputDecoration(
//           hintText: hint,
//           labelText: label,
//           suffixIcon: suffix,
//           prefixIcon: prefix,
//           filled: true,
//           fillColor: AppColors.scaffoldBg,
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               color: AppColors.grey.withOpacity(0.2),
//               width: 2,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               color: AppColors.grey.withOpacity(0.2),
//               width: 2,
//             ),
//           ),
//           labelStyle: const TextStyle(
//             color: AppColors.grey,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//   //           ),
//           hintStyle: const TextStyle(
//             color: AppColors.grey,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//   //           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(
//               color: AppColors.blue,
//               width: 2,
//             ),
//           ),
//         ),
//         enabled: true,
//         showFlagInInput: true,
//        // validator: _getValidator(),
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//       //  cursorColor: Theme.of(context).colorScheme.primary,
//         // ignore: avoid_print
//         onSaved: (p) => print('saved $p'),
//         // ignore: avoid_print
//         onChanged: (p) => print('changed $p'),
//       ),
//     );
//   }
// }
