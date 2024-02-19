import 'dart:ui';

enum RepeatType { everyDay,everyWeek,everyMonth,everyYear }

extension RepeatTypeExtenstion on RepeatType {
  static Map names = {
    RepeatType.everyDay: '매일',
    RepeatType.everyWeek: '매주',
    RepeatType.everyMonth: '매달',
    RepeatType.everyYear: '매년',
  };

  static Map values = {
    RepeatType.everyDay: 'everyDay',
    RepeatType.everyWeek: 'everyWeek',
    RepeatType.everyMonth: 'everyMonth',
    RepeatType.everyYear: 'everyYear',
  };

  static Map types = {
    'everyDay': RepeatType.everyDay,
    'everyWeek': RepeatType.everyWeek,
    'everyMonth': RepeatType.everyMonth,
    'everyYear': RepeatType.everyYear,
  };

  String get name => names[this];
  String get value => values[this];
  String getTypes(String value) => types[value];
}

enum PauseColor { color1,color2,color3,color4,color5,color6,color7,color8,color9,color10,color11 }

extension PauseColorExtenstion on PauseColor {
  static Map names = {
    PauseColor.color1: 'color1',
    PauseColor.color2: 'color2',
    PauseColor.color3: 'color3',
    PauseColor.color4: 'color4',
    PauseColor.color5: 'color5',
    PauseColor.color6: 'color6',
    PauseColor.color7: 'color7',
    PauseColor.color8: 'color8',
    PauseColor.color9: 'color9',
    PauseColor.color10: 'color10',
    PauseColor.color11: 'color11',
  };

  static Map colors = {
    PauseColor.color1: const Color(0xFFEF626B),
    PauseColor.color2: const Color(0xFFFFA5A5),
    PauseColor.color3: const Color(0xFFFFA178),
    PauseColor.color4: const Color(0xFFF2CF82),
    PauseColor.color5: const Color(0xFF85C97E),
    PauseColor.color6: const Color(0xFF3BB683),
    PauseColor.color7: const Color(0xFF56A0F1),
    PauseColor.color8: const Color(0xFF6180E8),
    PauseColor.color9: const Color(0xFF4954BA),
    PauseColor.color10: const Color(0xFFA9A3FF),
    PauseColor.color11: const Color(0xFFFF9BC3),
  };

  static Map backgroundColors = {
    PauseColor.color1: const Color(0xFFFCE0E1),
    PauseColor.color2: const Color(0xFFFFEDED),
    PauseColor.color3: const Color(0xFFFFECE4),
    PauseColor.color4: const Color(0xFFFCF5E6),
    PauseColor.color5: const Color(0xFFE7F4E5),
    PauseColor.color6: const Color(0xFFD8F0E6),
    PauseColor.color7: const Color(0xFFDDECFC),
    PauseColor.color8: const Color(0xFFDFE6FA),
    PauseColor.color9: const Color(0xFFDBDDF1),
    PauseColor.color10: const Color(0xFFEEEDFF),
    PauseColor.color11: const Color(0xFFFFEBF3),
  };

  static Map values = {
    'color1': PauseColor.color1,
    'color2': PauseColor.color2,
    'color3': PauseColor.color3,
    'color4': PauseColor.color4,
    'color5': PauseColor.color5,
    'color6': PauseColor.color6,
    'color7': PauseColor.color7,
    'color8': PauseColor.color8,
    'color9': PauseColor.color9,
    'color10': PauseColor.color10,
    'color11': PauseColor.color11,
  };

  String get name => names[this];
  Color get color => colors[this];
  Color get backgroundColor => backgroundColors[this];
  static PauseColor getTypes(String value) => values[value];
}