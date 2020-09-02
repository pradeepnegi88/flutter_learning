class Course {
  int _id, _hours;
  String _name, _content;
  Course(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._content = obj["content"];
    this._hours = obj["hours"];
  }

  Course.fromMap(Map<String, dynamic> data) {
    this._id = data["id"];
    this._name = data["name"];
    this._content = data["content"];
    this._hours = data["hours"];
  }

  Map<String, dynamic> toMap() =>
      {'id': _id, 'name': _name, 'content': _content, 'hours': _hours};
  int get id => _id;
  int get hours => _hours;
  String get content => _content;
  String get name => _name;
}
