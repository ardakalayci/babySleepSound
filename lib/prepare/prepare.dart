import 'package:babysleep/model/sounds.dart';
import 'package:babysleep/utils/animals_data.dart';
import 'package:babysleep/utils/home_tools_data.dart';
import 'package:babysleep/utils/nature.dart';

List<Sound> homeHazirla() {
  List<Sound> sounds = [];

  for (int i = 0; i < HomeTools.SES_NAME.length; i++) {
    Sound eklenecekSound = Sound(
      HomeTools.SES_NAME[i],
      HomeTools.SES_ICON_PATH[i],
      HomeTools.SES_PATH[i],

    );
    sounds.add(eklenecekSound);
  }

  return sounds;
}

List<Sound> animalsHazirla() {
  List<Sound> animals = [];

  for (int i = 0; i < Animals.SES_NAME.length; i++) {
    Sound eklenecekSound = Sound(
      Animals.SES_NAME[i],
      Animals.SES_ICON_PATH[i],
      Animals.SES_PATH[i],

    );
    animals.add(eklenecekSound);
  }

  return animals;
}
List<Sound> natureHazirla() {
  List<Sound> nature = [];

  for (int i = 0; i < Nature.SES_NAME.length; i++) {
    Sound eklenecekSound = Sound(
      Nature.SES_NAME[i],
      Nature.SES_ICON_PATH[i],
      Nature.SES_PATH[i],

    );
    nature.add(eklenecekSound);
  }

  return nature;
}