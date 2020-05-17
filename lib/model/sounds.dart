class Sound {

  String _sesName;
  String _sesIconPath;
  String _sesPath;


  Sound(this._sesName, this._sesIconPath, this._sesPath,);

  String get sesName  => _sesName;

  set sesName(String value) {
    _sesName = value;
  }

  String get sesIconPath  => _sesIconPath;

  // ignore: unnecessary_getters_setters
  set sesIconPath(String value) {
    _sesIconPath = value;
  }

  String get sesPath => _sesPath;

  set sesPath(String value) {
    _sesPath = value;
  }






}