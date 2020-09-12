//la fonction qui calcule la dose a administrer


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medica/controller/calcul_step2_controller.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/calculs.dart';
import 'package:medica/model/model_tableaux/d%C3%A9tails_med.dart';
import 'package:medica/model/model_tableaux/medicament.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


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
String Reliquat() {
  double volume = Volume_finale();
  int nbr_flcn = Nbr_flacon();
  double reliqat = 0;
  reliqat = (nbr_flcn * volume_flcn_jcombobox_selected) - volume;
  String rel = reliqat.toStringAsFixed(2);

  reliqat = double.parse(rel);
  return reliqat.toString();
}

//la fonction qui choisit la meilleure poche
int ChoisirPoche() {
  double cmax=c_max_jcombobox_selcted;
  double cmin =c_min_jcombobox_selcted;
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

//la fonction qui changé la qte disponible
void modifier_qte_disponible(int nbr_flacon,var context ){
  var dbmanager = new Dbmedica();
  int qteDisp =med_search.qte_disponible;
  int new_qte =qteDisp-nbr_flacon;
  int new_qte_consomm =qteDisp+nbr_flacon;
  if(new_qte<0){

    Alert(
        context: context,
        title: "ATTENTION",
        desc: "La quantité disponible est insuffisante")
        .show();
  }else{
    Medicament medUpdated = Medicament.fromMap({
      "nom": med_search.nom,
      "qte_disponible": new_qte,
      "volume_flacon": med_search.volume_flacon,
      "id_medicament": med_search.id_medicament,
    });
     dbmanager.modifierMed(medUpdated);
  }
}
//extrait la stabilite
String stabilite(String selected_curr,Detail_medicament medi_detail)
{
  int stabilite;
  if(selected_curr=='Flacon verre 4'){
    stabilite=  medi_detail.verre_4;
  }if(selected_curr=='Flacon verre 25'){
    stabilite=  medi_detail.verre_25;
  }
  if(selected_curr=='PVC 25'){
    stabilite=  medi_detail.PVC_25;
  }

  return stabilite.toString();
}
String etat_reliquat(String stabilite, String date_pre ,double prix,String reliqua,int qte_consomme,double prix_reli,int fkmedid)
{
  var dbmanager = new Dbmedica();
 /* bool exist;
  double prix_tot;
 // var dbmanager = new Dbmedica();
  Detail_medicament med_obj;*/
  int stab =int.parse(stabilite);
  String etat;
  DateTime parseDt = DateTime.parse(date_pre);
//la  date d 'ajourdhui
  var newFormat = DateFormat("yyyy-MM-dd HH:mm");
  String time_now = newFormat.format(DateTime.now());
  //changer au tye date
  DateTime time_noww = DateTime.parse(time_now);
  //ajouter stabilite a date preparation
  print('$stab');
  parseDt.subtract(Duration(days:parseDt.day, hours:parseDt.hour, minutes:parseDt.minute));
  //ajouter a lancienne heure stabilite
  var newDate = new DateTime(parseDt.year, parseDt.month,parseDt.day,parseDt.hour+stab,parseDt.minute);
  //tester
print(newDate.hour);
  if(newDate.isAfter(time_noww)){
    etat=' non périmée';
    couleur =Colors.tealAccent.shade100;
    return etat;
  }else{
    etat=' périmée';
   // med_obj = dbmanager.getMedDetail(6) as Detail_medicament;
  // int  prix_mg =med_obj.prix;
  // print('prix $prix_mg');
  // prix_totale=prix_mg*qte1;
     print('prix $prix');
/*if(posi<debut_journee.length) {
  exist = prix_reli.containsKey(nom_med);
  if (exist == true) {
    prix_tot = prix + prix_reli[nom_med];
    prix_reli.update(nom_med, (value) => prix_tot);
  }
  else {
    prix_reli[nom_med] = prix;
  }
}else{
  prix_reli.clear();
}*/
    Calculs calpdated = Calculs.fromMap({
      "reliquat": reliqua,
      "qte_consomme": qte_consomme,
      "stabilite": stabilite,
      "prix_reliquat": prix_reli,
      "etat": 'perime',
      "FKDatePre": date_pre,
      "FKmedId2":fkmedid,

    });
    dbmanager.modifierCalcul(calpdated);
    couleur =Colors.red.shade100;
    return etat;
  }
}
