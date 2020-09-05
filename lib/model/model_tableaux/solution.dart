import 'package:flutter/material.dart';

class Solution {
  //les colones de table student
  int _id_solution;
  String _date_preparation;
  double _posologie;
  int _reduction;
  double _dose_administrer;
  double _volume_finale;
  //=====clé etrangers====
  int _FKmedId;
  int _FKpoche;
 int _FKpatientId;

  //un constructeur pour remplir le table
  Solution(
    this._date_preparation,
    this._posologie,
    this._reduction,
    this._dose_administrer,
    this._volume_finale,
    this._FKmedId,
    this._FKpoche,
   this._FKpatientId,
  );

  Solution.map(dynamic obj) {
    this._id_solution = obj['id_solution'];
    this._date_preparation = obj['date_preparation'];
    this._posologie = obj['posologie'];
    this._reduction = obj['reduction'];
    this._dose_administrer = obj['dose_administrer'];
    this._volume_finale = obj['volume_finale'];
    this._FKmedId = obj['FKmedId'];
    this._FKpoche = obj['FKpoche'];
    this._FKpatientId = obj['FKpatientId'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_solution => _id_solution;
  String get date_preparation => _date_preparation;
  double get posologie => _posologie;
  int get reduction => _reduction;
  double get dose_administrer => _dose_administrer;
  double get volume_finale => _volume_finale;
  int get FKmedId => _FKmedId;
  int get FKpoche => _FKpoche;
 int get FKpatientId => _FKpatientId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['date_preparation'] = _date_preparation;
    map['posologie'] = _posologie;
    map['reduction'] = _reduction;
    map['dose_administrer'] = _dose_administrer;
    map['volume_finale'] = _volume_finale;
    map['FKmedId'] = _FKmedId;
   map['FKpoche'] = _FKpoche;
  map['FKpatientId'] = _FKpatientId;
    if (id_solution != null) {
      map['id_solution'] = _id_solution;
    }

    return map;
  }

  Solution.fromMap(Map<String, dynamic> map) {
    this._id_solution = map['id_solution'];
    this._date_preparation = map['date_preparation'];
    this._posologie = map['posologie'];
    this._reduction = map['reduction'];
    this._dose_administrer = map['dose_administrer'];
    this._volume_finale = map['volume_finale'];
    this._FKmedId = map['FKmedId'];
    this._FKpoche = map['FKpoche'];
    this._FKpatientId = map['FKpatientId'];
  }
}
