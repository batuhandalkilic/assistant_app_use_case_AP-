import 'package:flutter/cupertino.dart';

abstract class BaseModel<T extends StatefulWidget> extends State<T> {
  // Doğru değil fakat kullanışlı
  EdgeInsetsGeometry get allPadding => const EdgeInsets.all(8);
  EdgeInsetsGeometry get allPadding2x => const EdgeInsets.all(16);
  EdgeInsetsGeometry get allPadding3x => const EdgeInsets.all(24);
  EdgeInsetsGeometry get verticalPadding => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsetsGeometry get verticalPadding2x => const EdgeInsets.symmetric(vertical: 16);
  EdgeInsetsGeometry get verticaPadding3x => const EdgeInsets.symmetric(vertical: 24);
}
