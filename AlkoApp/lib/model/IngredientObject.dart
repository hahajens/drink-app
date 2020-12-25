class IngredientObject {
  String strIngredient1;
  bool checked;
  String pic;
  IngredientObject({this.strIngredient1, this.checked = false, this.pic});

  get getStrIngredient1 => this.strIngredient1;
  void setPic(String pic) {
    this.pic = pic;
    if (this.checked == null) {
      this.checked = false;
    }
  }

  get getCheck => checked;

  void setCheck(input) {
    this.checked = input;
  }

  IngredientObject.fromJson(Map<dynamic, dynamic> json) {
    strIngredient1 = json['strIngredient1'];
    checked = json['checked'];
    pic = json['pic'];
  }

  @override
  String toString() {
    return "${this.strIngredient1}, ${this.checked}, ${this.pic}";
  }
}
