class ValidationContainer {
  String name = "";
  final String? error;

  bool checkError() {
    return error == null && name.isNotEmpty == true;
  }

  ValidationContainer(this.name, this.error);
}
