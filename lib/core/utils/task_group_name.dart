extension TaskGroupName on int {
  String get groupName {
    switch (this) {
      case 4257:
        return 'Общие задачи';

      case 318193:
      case 317651:
      case 317963:
      case 318131:
        return 'Разработка';

      case 318020:
        return 'Сайт / Дизайн';

      case 318139:
      case 318192:
      case 318019:
      case 317898:
        return 'HR';

      case 317739:
        return 'Аналитика';

      case 317836:
        return 'Планирование';

      case 318482:
        return 'Тест';

      case 317653:
        return 'Бизнес';

      case 318200:
        return 'Финансы';

      case 318194:
        return 'Автоматизация';

      case 318155:
        return 'События';

      case 4255:
        return 'Корень';

      case 317719:
        return 'Завершено';

      default:
        return 'Без названия';
    }
  }
}
