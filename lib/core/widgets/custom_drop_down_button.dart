// import 'package:flutter/material.dart';

// class CustomDropDownButton extends StatelessWidget {
//   const CustomDropDownButton({
//     super.key,
//     required this.data,
//     this.onChanged,
//     required this.hintText,
//     this.validator,
//     required this.icon,
//     this.initialValue,
//   });
//   final List<String> data;
//   final void Function(String?)? onChanged;
//   final String hintText;
//   final String? Function(String?)? validator;
//   final IconData icon;
//   final String? initialValue;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         HeaderWidget(
//           icon: icon,
//           title: hintText,
//         ),
//         DropdownSearch<String>(
//           selectedItem: initialValue,
//           onChanged: onChanged,
//           validator: validator,
//           autoValidateMode: AutovalidateMode.onUserInteraction,
//           items: (filter, infiniteScrollProps) => data.toSet().toList(),
//           popupProps: PopupProps.menu(
//             fit: FlexFit.loose,
//             searchDelay: const Duration(milliseconds: 1),
//             containerBuilder: (context, popupWidget) => Theme(
//               data: Theme.of(context).copyWith(
//                 textTheme: const TextTheme(
//                   titleMedium: TextStyle(),
//                 ),
//               ),
//               child: popupWidget,
//             ),
//             menuProps: MenuProps(
//               borderRadius: BorderRadius.circular(15),
//               backgroundColor: AppColors.secondaryColor,
//             ),
//             constraints: const BoxConstraints(
//               maxHeight: 240,
//             ),
//             onDismissed: () {
//               FocusScope.of(context).unfocus();
//             },
//           ),
//           decoratorProps: DropDownDecoratorProps(
//             baseStyle: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: AppColors.secondaryColor,
//               hintText: hintText,
//               hintStyle: const TextStyle(
//                 color: AppColors.greyColor,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: AppColors.primaryColor),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: const BorderSide(color: AppColors.secondaryColor),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: AppColors.secondaryColor,
//                 ),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//           ),
//           suffixProps: const DropdownSuffixProps(
//             dropdownButtonProps: DropdownButtonProps(
//               color: AppColors.primaryColor,
//             ),
//             clearButtonProps: ClearButtonProps(
//               isVisible: true,
//               icon: Icon(
//                 Icons.clear,
//                 color: AppColors.redColor,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
