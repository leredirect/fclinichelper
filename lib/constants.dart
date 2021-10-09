import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:fclinic_helper/models/baseElement.dart';
import 'package:fclinic_helper/models/baseList.dart';
import 'package:flutter/material.dart';

final Decimal JAICHKO = Decimal.parse("2");
final Decimal ARINA_CONSTANT = Decimal.parse("0.52");
const double JEJ = 7;

BaseElement baseElement0 =
    new BaseElement(0, "Приём акушер-гинеколога", 45.00, "", false);
BaseElement baseElement1 =
    new BaseElement(1, "Приём акушер-гинеколога(детский)", 45.00, "", false);
BaseElement baseElement2 =
    new BaseElement(2, "Приём по бесплодию", 150.00, "", false);
BaseElement baseElement3 =
    new BaseElement(3, "Приём беременной", 90.00, "", false);
BaseElement baseElement4 =
    new BaseElement(4, "УЗИ гинекологическое", 36.00, "", false);
BaseElement baseElement5 =
    new BaseElement(5, "УЗИ определения беременности", 38.00, "", false);
BaseElement baseElement6 =
    new BaseElement(6, "УЗИ молочных желез", 38.00, "", false);
BaseElement baseElement7 =
    new BaseElement(7, "Кольпоскопия расширенная", 33.00, "", false);
BaseElement baseElement8 = new BaseElement(8, "Биопсия", 24.00, "", false);
BaseElement baseElement9 =
    new BaseElement(9, "Фолликулометрия", 18.00, "", false);
BaseElement baseElement10 =
    new BaseElement(10, "Комплекс LOVE IS", 100.00, "", false);
BaseElement baseElement11 =
    new BaseElement(11, "Комплекс VIP", 350.00, "", false);
BaseElement baseElement12 = new BaseElement(12, "РВК", 135.00, "", false);
BaseElement baseElement13 = new BaseElement(13, "ЭХОГСК", 296.00, "", false);
BaseElement baseElement14 = new BaseElement(14, "ИГХ", 330.00, "", false);
BaseElement baseElement15 =
    new BaseElement(15, "Сосков цервикального канала", 38.00, "", false);
BaseElement baseElement16 =
    new BaseElement(16, "1 кусочек биопсийного материала", 6.37, "", false);
BaseElement baseElement17 = new BaseElement(
    17, "Удаление внутриматочного средства контрацепции", 55.00, "", false);
BaseElement baseElement18 =
    new BaseElement(18, "Slivki (Приём + консультация)", 22.00, "", false);
BaseElement baseElement19 = new BaseElement(
    19, "Slivki #1 (Приём + консультация+ УЗИ ОМТ)", 49.00, "", false);
BaseElement baseElement20 = new BaseElement(
    20, "Slivki #2 (Приём + консультация+ кольпоскопия)", 49.00, "", false);
BaseElement baseElement21 = new BaseElement(
    21,
    "Slivki #3 (Приём + консультация+ УЗИ ОМТ+ кольпоскопия)",
    65.00,
    "",
    false);

BaseElement baseElement22 =
    new BaseElement(0, "Информационные услуги", JEJ, "", false);
BaseElement baseElement23 =
    new BaseElement(1, "Соскоб цервикального канала", 44.73, "", false);
BaseElement baseElement24 =
    new BaseElement(2, "Мазок на флору", 8.17, "(5107)", false);
BaseElement baseElement25 = new BaseElement(
    3, "Онкоцитология гинекологич. мазков", 11.89, "(7001)", false);
BaseElement baseElement26 = new BaseElement(
    4, "Онкоцитология пунктам молочной железы", 12.37, "", false);
BaseElement baseElement27 =
    new BaseElement(5, "Онкоцитология в/м спирали", 9.94, "", false);
BaseElement baseElement28 = new BaseElement(
    6, "ПАП-тест на основе жидкостной цитологии", 44.28, "", false);
BaseElement baseElement29 =
    new BaseElement(7, "Фемофлор-скрин", 71.82, "(3058)", false);
BaseElement baseElement30 =
    new BaseElement(8, "Фемофлор-скрин 16", 99.18, "(3057)", false);
BaseElement baseElement31 =
    new BaseElement(9, "Маркеры пролиферации  p16 и Ki-67", 119.39, "", false);
BaseElement baseElement32 = new BaseElement(
    10,
    "Пап-тест на основе жидкостной цитологии ПЦР, ВПЧ,ВКР",
    98.26,
    "(74040)",
    false);
BaseElement baseElement33 = new BaseElement(
    11,
    "Пап-тест на основе жидкостной цитологии ПЦР, ВПЧ,ВКР с маркерами p16 и Ki-67",
    164.21,
    "(94042)",
    false);
BaseElement baseElement34 = new BaseElement(12, "Забор ПЦР", 3.70, "", false);
BaseElement baseElement35 = new BaseElement(
    13, "ПЦР. Вирус простого герпеса 1/2 типа", 14.85, "", false);
BaseElement baseElement36 =
    new BaseElement(14, "ПЦР. Вирус паппиломы человека", 34.16, "", false);
BaseElement baseElement37 =
    new BaseElement(15, "ПЦР. Папилломавирус тип 16", 16.07, "", false);
BaseElement baseElement38 =
    new BaseElement(16, "ПЦР. Папилломавирус тип 18", 16.07, "", false);
BaseElement baseElement39 =
    new BaseElement(17, "ПЦР. Вирус папиломы (квант-21)", 77.70, "", false);
BaseElement baseElement40 =
    new BaseElement(18, "ПЦР. Гарднерелла вагиналис", 14.53, "", false);
BaseElement baseElement41 =
    new BaseElement(19, "ПЦР. Mycoplasma hominis", 15.96, "", false);
BaseElement baseElement42 =
    new BaseElement(20, "ПЦР. Mycoplasma genitalium", 14.66, "", false);
BaseElement baseElement43 =
    new BaseElement(21, "ПЦР. Нейсерия говорит", 16.85, "", false);
BaseElement baseElement44 =
    new BaseElement(22, "ПЦР. Trihomonas vaginalis", 14.72, "", false);
BaseElement baseElement52 =
    new BaseElement(30, "Ureplasma species", 15.16, "", false);
BaseElement baseElement45 =
    new BaseElement(23, "ПЦР. Chlamydia trachomatis", 14.40, "", false);
BaseElement baseElement46 = new BaseElement(
    24, "ПЦР. Trihomonas vaginalis,  гормональный", 18.24, "", false);
BaseElement baseElement47 = new BaseElement(
    25, "ПЦР. Chlamydia trachomatis/ Mycoplasma genitalium", 14.66, "", false);
BaseElement baseElement48 =
    new BaseElement(26, "ПЦР. Цитомегаловирус", 14.08, "", false);
BaseElement baseElement49 = new BaseElement(
    27,
    "ПЦР.Chlamydia trachomatis/ Mycoplasma genitalium/ Ureplasma spp",
    21.20,
    "",
    false);
BaseElement baseElement50 = new BaseElement(
    28, "Бак. посев на чувствительность к а/б", 30.24, "", false);
BaseElement baseElement51 = new BaseElement(29,
    "M. hominis/ Ureplasma spp (соскоб, полуколич, посев)", 24.34, "", false);

List<BaseElement> servicesBase = [
  baseElement0,
  baseElement1,
  baseElement2,
  baseElement3,
  baseElement4,
  baseElement5,
  baseElement6,
  baseElement7,
  baseElement8,
  baseElement9,
  baseElement10,
  baseElement11,
  baseElement12,
  baseElement13,
  baseElement14,
  baseElement15,
  baseElement16,
  baseElement17,
  baseElement18,
  baseElement19,
  baseElement20,
  baseElement21,
];

List<BaseElement> analysisBase = [
  baseElement22,
  baseElement23,
  baseElement24,
  baseElement25,
  baseElement26,
  baseElement27,
  baseElement28,
  baseElement29,
  baseElement30,
  baseElement31,
  baseElement32,
  baseElement33,
  baseElement34,
  baseElement35,
  baseElement36,
  baseElement37,
  baseElement38,
  baseElement39,
  baseElement40,
  baseElement41,
  baseElement42,
  baseElement43,
  baseElement44,
  baseElement45,
  baseElement46,
  baseElement47,
  baseElement48,
  baseElement49,
  baseElement50,
  baseElement51
];

BaseList baseServices = new BaseList("Услуги", servicesBase);
BaseList baseAnalysis = new BaseList("Анализы", analysisBase);

Map<int, Color> color = {
  50: Color(0xFFE7E2EC),
  100: Color(0xFFC2B7D0),
  200: Color(0xFF9A88B1),
  300: Color(0xFF725891),
  400: Color(0xFF53347A),
  500: Color(0xFF351062),
  600: Color(0xFF300E5A),
  700: Color(0xFF280C50),
  800: Color(0xFF220946),
  900: Color(0xFF160534),
};

MaterialColor primaryColorM = new MaterialColor(0xFF351062, color);
Color primaryColor = Color(0xFF351062);
