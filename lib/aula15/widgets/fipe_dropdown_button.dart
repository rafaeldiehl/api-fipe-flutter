import 'package:flutter/material.dart';

class FipeDropdownButton extends StatelessWidget {
  const FipeDropdownButton({
    super.key,
    this.loading = false,
    this.value,
    required this.hint,
    required this.items,
    required this.onChangeFunc,
  });

  final bool loading;
  final String? value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChangeFunc;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const LinearProgressIndicator()
        : Container(
            decoration: BoxDecoration(border: Border.all()),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  hint: Text(hint),
                  isExpanded: true,
                  value: value,
                  icon: const Icon(Icons.arrow_downward),
                  items: items,
                  onChanged: onChangeFunc),
            ),
          );
  }
}

// .map(
// (v) => DropdownMenuItem(
//   value: v,
//   child: Text(v),
// ),
// )
// .toList(),
