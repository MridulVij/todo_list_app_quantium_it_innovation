class PriorityPicker {
  //
  int _value = 0;

  int get value => _value;

  set prioritySetter(int value) {
    _value = value;
    print(''' New Value $value Already Selected $_value''');
  }
}
