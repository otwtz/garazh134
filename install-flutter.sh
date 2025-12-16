#!/bin/bash
echo "Installing Flutter SDK..."

# 1. Скачиваем более новую версию Flutter
FLUTTER_VERSION="3.38.5"  # Или "stable" для самой свежей стабильной
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz -o flutter.tar.xz

# 2. Распаковываем
tar -xf flutter.tar.xz

# 3. Настраиваем PATH
export PATH="$PATH:$(pwd)/flutter/bin"
echo "export PATH=\"\$PATH:$(pwd)/flutter/bin\"" > /tmp/flutter-path.sh
chmod +x /tmp/flutter-path.sh

# 4. Git конфигурация
git config --global --add safe.directory $(pwd)/flutter
git config --global --add safe.directory /vercel/path0

# 5. Настраиваем Flutter
./flutter/bin/flutter config --enable-web --no-analytics --no-cli-animations

# 6. Проверяем версию
echo "Flutter version:"
./flutter/bin/flutter --version