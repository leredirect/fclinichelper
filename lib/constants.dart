import 'package:fclinick_helper/models/baseElement.dart';
import 'package:fclinick_helper/models/baseList.dart';

const double ARINA_CONSTANT = 0.52;
const double JEJ = 7;
//text

BaseElement baseElement0 = new BaseElement(0, "Услуга 1", 5, false);
BaseElement baseElement1 = new BaseElement(1, "Услуга 2", 10, false);
BaseElement baseElement2 = new BaseElement(2, "Услуга 3", 15, false);
BaseElement baseElement3 = new BaseElement(3, "Услуга 4", 20, false);



BaseElement baseElement4 = new BaseElement(0, "БЕЗ СТРАХОВКИ", 7, false);
BaseElement baseElement5 = new BaseElement(1, "Анализ 2", 30, false);
BaseElement baseElement6 = new BaseElement(2, "Анализ 3", 35, false);
BaseElement baseElement7 = new BaseElement(3, "Анализ 4", 40, false);



List<BaseElement> servicesBase = [
  baseElement0, baseElement1, baseElement2, baseElement3,
];

List<BaseElement> analysisBase = [
  baseElement4, baseElement5, baseElement6, baseElement7
];


BaseList baseServices = new BaseList("Услуги", servicesBase, false);
BaseList baseAnalysis = new BaseList("Анализы", analysisBase, false);