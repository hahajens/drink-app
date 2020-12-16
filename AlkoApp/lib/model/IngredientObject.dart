class IngredientObject {
  String strIngredient1;
  bool checked;
  IngredientObject({this.strIngredient1, this.checked = false});

  @override
  String toString() {
    return "${this.strIngredient1}, ${this.checked}";
  }
}
