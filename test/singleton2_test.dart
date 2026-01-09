void main() {
  //
}

class FirebaseFiresotre {
  static FirebaseFiresotre? _instance;

  FirebaseFiresotre._();

  factory FirebaseFiresotre.instance() {
    if (_instance == null) {
      _instance = FirebaseFiresotre._();
    }
    return _instance!;
  }
}
