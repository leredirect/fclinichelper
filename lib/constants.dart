import 'package:fclinick_helper/models/baseElement.dart';
import 'package:fclinick_helper/models/baseList.dart';

const double ARINA_CONSTANT = 0.52;
const double JEJ = 7;
//text

BaseElement baseElement0 = new BaseElement(0, "Приём акушер-гинеколога",45.00, false);
BaseElement baseElement1 = new BaseElement(1, "Приём акушер-гинеколога(детский)",  45.00, false);
BaseElement baseElement2 = new BaseElement(2, "Приём по бесплодию", 150.00, false);
BaseElement baseElement3 = new BaseElement(3, "Приём беременной", 90.00, false);
BaseElement baseElement4 = new BaseElement(4, "УЗИ гинекологическое", 36.00, false);
BaseElement baseElement5 = new BaseElement(5, "УЗИ определения беременности", 38.00, false);
BaseElement baseElement6 = new BaseElement(6, "УЗИ молочных желез", 38.00, false);
BaseElement baseElement7 = new BaseElement(7, "Кольпоскопия расширенная", 33.00, false);
BaseElement baseElement8 = new BaseElement(8, "Биопсия", 24.00, false);
BaseElement baseElement9 = new BaseElement(9, "Фолликулометрия", 18.00, false);
BaseElement baseElement10 = new BaseElement(10, "Комплекс LOVE IS", 100.00, false);
BaseElement baseElement11 = new BaseElement(11, "Комплекс VIP", 350.00, false);
BaseElement baseElement12 = new BaseElement(12, "РВК", 135.00, false);
BaseElement baseElement13 = new BaseElement(13, "ЭХОГСК", 296.00, false);
BaseElement baseElement14 = new BaseElement(14, "ИГХ", 330.00, false);
BaseElement baseElement15 = new BaseElement(15, "Сосков цервикального канала", 38.00, false);
BaseElement baseElement16 = new BaseElement(16, "1 кусочек биопсийного материала", 6.37, false);
BaseElement baseElement17 = new BaseElement(17, "Удаление внутриматочного средства контрацепции", 55.00, false);
BaseElement baseElement18 = new BaseElement(18, "Slivki (Приём + консультация)", 22.00, false);
BaseElement baseElement19 = new BaseElement(19, "Slivki #1 (Приём + консультация+ УЗИ ОМТ)", 49.00, false);
BaseElement baseElement20 = new BaseElement(20, "Slivki #2 (Приём + консультация+ кольпоскопия)", 49.00, false);
BaseElement baseElement21 = new BaseElement(21, "Slivki #3 (Приём + консультация+ УЗИ ОМТ+ кольпоскопия)", 65.00, false);

BaseElement baseElement22 = new BaseElement(0, "БЕЗ СТРАХОВКИ", 7, false);
BaseElement baseElement23 = new BaseElement(1, "Анализ 2", 30, false);
BaseElement baseElement24 = new BaseElement(2, "Анализ 3", 35, false);
BaseElement baseElement25 = new BaseElement(3, "Анализ 4", 40, false);

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
  baseElement4,
  baseElement5,
  baseElement6,
  baseElement7
];

BaseList baseServices = new BaseList("Услуги", servicesBase, false);
BaseList baseAnalysis = new BaseList("Анализы", analysisBase, false);
