//la fonction qui calcule la dose a administrer

import 'package:medica/controller/calcul_step2_controller.dart';

import '../main.dart';
import 'calcul_step1_controller.dart';

/*double Dose_a_administrer({double surface, double posologie}) {
  double dose;
  dose = surface * posologie;
  return dose;
}*/
double Dose_a_administrer() {
  double doose;
  double surface = double.parse(surface_coporelle_ctrl.text);
  double posologie = double.parse(posologie_ctrl.text);

  if (surface_coporelle_ctrl.text.isEmpty || posologie_ctrl.text.isEmpty) {
    surface = 0;
    posologie = 0;
  }
  double dose = 0.0;
  dose = surface * posologie;
  //for rounded the value to 0.00
  String dos = dose.toStringAsFixed(2);

  doose = double.parse(dos);
//
  return doose;
}

//la fonction qui calcule la volume finale
double Volume_finale() {
  double dose = Dose_a_administrer();
  double ci = ci_jcombobox_selected;
  double volume = 0.0;
  volume = (dose / ci);
  print(' volumr $volume');
  print(' dose $dose');
  print(' ci $ci');
  String vol = volume.toStringAsFixed(2);

  double volum = double.parse(vol);

  return volum;
}

//la fonction qui calcule le nombre des flacons
int Nbr_flacon() {
  double volume_flacon=volume_flcn_jcombobox_selected;
  double volume = Volume_finale();

  int nbr_flcn = 0;
  nbr_flcn = (volume / volume_flacon).round();
  if ((nbr_flcn * volume_flacon) - volume >= 0) {
    return nbr_flcn;
  } else {
    nbr_flcn + 1;
    return nbr_flcn;
  }
}

//la fonction qui calcule reliquats
double Reliquat() {
  double volume = Volume_finale();
  int nbr_flcn = Nbr_flacon();
  double reliqat = 0;
  reliqat = (nbr_flcn * volume_flcn_jcombobox_selected) - volume;
  String rel = reliqat.toStringAsFixed(2);

  reliqat = double.parse(rel);
  return reliqat;
}

//la fonction qui choisit la meilleure poche
int ChoisirPoche({double cmax, double cmin}) {
  double dose = Dose_a_administrer();
  double poche_min = dose / cmin;
  double poche_max = dose / cmax;
  if (poche_min <= 250) return 250;
  return 500;
}

//la fonction qui calcule le prix des reliquats pirimées
double Prix_reliquat_pirimi({double prix, double dose}) {
  double res;
  res = (prix * dose);
  return res;
}
