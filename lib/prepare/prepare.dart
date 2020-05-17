import 'package:babysleep/model/sounds.dart';
import 'package:babysleep/utils/white_noise.dart';
import 'package:babysleep/utils/cars.dart';
import 'package:babysleep/utils/home_tools_data.dart';
import 'package:babysleep/utils/nature.dart';
import 'package:babysleep/utils/ninnis.dart';

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

List<Sound> whitesHazirla() {
  List<Sound> whites = [];

  for (int i = 0; i < Whites.SES_NAME.length; i++) {
    Sound eklenecekSound = Sound(
      Whites.SES_NAME[i],
      Whites.SES_ICON_PATH[i],
      Whites.SES_PATH[i],
    );
    whites.add(eklenecekSound);
  }

  return whites;
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

List<Sound> carsHazirla() {
  List<Sound> cars = [];

  for (int i = 0; i < Cars.SES_NAME.length; i++) {
    Sound eklenecekSound = Sound(
      Cars.SES_NAME[i],
      Cars.SES_ICON_PATH[i],
      Cars.SES_PATH[i],
    );
    cars.add(eklenecekSound);
  }
  return cars;
}

List<Sound> ninnisHazirla() {
  List<Sound> ninnis = [];

  for (int i = 0; i < Ninni.SES_NAME.length; i++) {
    Sound eklenecekSound = Sound(
      Ninni.SES_NAME[i],
      Ninni.SES_ICON_PATH[i],
      Ninni.SES_PATH[i],
    );
    ninnis.add(eklenecekSound);
  }

  return ninnis;
}
