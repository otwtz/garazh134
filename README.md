# Сайт-визитка Автосервиса

Современный адаптивный сайт-визитка для автосервиса, разработанный на Flutter Web.

## Возможности

✅ **Адаптивный дизайн** - корректно отображается на всех устройствах (десктоп, планшет, мобильный)
✅ **Современный UI** - красивый градиентный дизайн с Material Design 3
✅ **Секции сайта:**
- Шапка с навигацией
- Hero-секция с призывом к действию
- Информация о сервисе
- Услуги (6 основных услуг)
- Галерея фотографий
- Контакты с кликабельными ссылками
- Футер с социальными сетями

✅ **Контакты:**
- Telegram
- WhatsApp
- Email
- Телефон

## Запуск проекта

### Для разработки (с hot reload)

```bash
flutter run -d chrome
```

### Сборка для продакшена

```bash
flutter build web --release
```

Собранный сайт будет находиться в папке `build/web/`

## Настройка контактов

Откройте файл `lib/main.dart` и найдите методы `_buildContactCards()` и `_buildContactsSection()`.

Замените следующие данные на свои:

### Telegram
```dart
_buildContactCard(
  FontAwesomeIcons.telegram,
  'Telegram',
  '@autoservice',  // <- Ваш Telegram username
  'https://t.me/autoservice',  // <- Ваша ссылка
  const Color(0xFF0088cc),
),
```

### WhatsApp
```dart
_buildContactCard(
  FontAwesomeIcons.whatsapp,
  'WhatsApp',
  '+7 (999) 123-45-67',  // <- Ваш номер
  'https://wa.me/79991234567',  // <- Номер в международном формате без +
  const Color(0xFF25D366),
),
```

### Email
```dart
_buildContactCard(
  Icons.email,
  'Email',
  'info@autoservice.ru',  // <- Ваш email
  'mailto:info@autoservice.ru',  // <- Ваш email
  const Color(0xFFD93025),
),
```

### Телефон
```dart
_buildContactCard(
  Icons.phone,
  'Телефон',
  '+7 (999) 123-45-67',  // <- Ваш номер
  'tel:+79991234567',  // <- Номер в международном формате без пробелов
  const Color(0xFF1A237E),
),
```

### Адрес и режим работы

Найдите метод `_buildContactsSection()` и измените:

```dart
Text(
  'г. Москва, ул. Примерная, д. 123',  // <- Ваш адрес
  ...
),

Text(
  'Пн-Пт: 9:00 - 19:00\nСб-Вс: 10:00 - 17:00',  // <- Ваш режим работы
  ...
),
```

## Добавление фотографий

1. Поместите ваши фотографии в папку `assets/images/`
2. Назовите их, например: `photo1.jpg`, `photo2.jpg`, и т.д.
3. Откройте `lib/main.dart` и найдите метод `_buildGalleryPlaceholder()`
4. Замените его на:

```dart
Widget _buildGalleryItem(String imagePath) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}
```

5. В методе `_buildGallerySection()` измените:

```dart
GridView.builder(
  ...
  itemCount: 6,  // <- Количество ваших фото
  itemBuilder: (context, index) => _buildGalleryItem('assets/images/photo${index + 1}.jpg'),
),
```

## Изменение названия и описания

В методе `_buildLogo()`:

```dart
Text(
  'АВТОСЕРВИС',  // <- Название вашего сервиса
  ...
),
Text(
  'Профессиональный ремонт',  // <- Подзаголовок
  ...
),
```

В методе `_buildHeroSection()`:

```dart
Text(
  'Качественный ремонт\nвашего автомобиля',  // <- Главный заголовок
  ...
),
Text(
  'Профессиональное обслуживание и диагностика\nвсех марок автомобилей',  // <- Описание
  ...
),
```

## Изменение услуг

Найдите метод `_buildServiceCards()` и измените список услуг по вашему усмотрению:

```dart
_buildServiceCard(
  Icons.car_repair,  // <- Иконка
  'Диагностика',  // <- Название услуги
  'Комплексная диагностика всех систем автомобиля',  // <- Описание
),
```

## Цветовая схема

Основные цвета можно изменить в начале файла `lib/main.dart`:

```dart
primaryColor: const Color(0xFF1A237E),  // <- Основной цвет (темно-синий)
```

Цвет кнопок в методе `_buildHeroSection()`:

```dart
backgroundColor: Colors.orange,  // <- Цвет кнопки призыва к действию
```

## Деплой

### На Firebase Hosting

1. Установите Firebase CLI
2. Выполните `firebase init hosting`
3. Укажите папку `build/web` как public directory
4. Выполните `firebase deploy`

### На GitHub Pages

1. Соберите проект: `flutter build web --release --base-href "/имя-репозитория/"`
2. Скопируйте содержимое `build/web/` в ветку `gh-pages`
3. Включите GitHub Pages в настройках репозитория

### На Netlify / Vercel

1. Соберите проект: `flutter build web --release`
2. Загрузите содержимое папки `build/web/` на платформу

## Технологии

- **Flutter** 3.8.0+
- **Google Fonts** - красивые шрифты
- **Font Awesome Flutter** - иконки для соцсетей
- **URL Launcher** - открытие ссылок, звонки, email
- **Material Design 3** - современный дизайн

## Поддержка

При возникновении вопросов обращайтесь к документации Flutter:
- [Flutter Web](https://docs.flutter.dev/platform-integration/web)
- [Building for the Web](https://docs.flutter.dev/deployment/web)

---

**Примечание:** Это базовая версия сайта-визитки. Вы можете дополнительно добавить:
- Форму обратной связи
- Интеграцию с Google Maps для отображения местоположения
- Калькулятор стоимости услуг
- Систему онлайн-записи
- Отзывы клиентов
