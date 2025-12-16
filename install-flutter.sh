#!/bin/bash
echo "1. Downloading Flutter SDK..."
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.22.1-stable.tar.xz -o flutter.tar.xz

echo "2. Extracting..."
tar -xf flutter.tar.xz

echo "3. Setting up environment..."
# Добавляем Flutter в PATH двумя способами для надежности
export PATH="$PATH:$(pwd)/flutter/bin"
# Создаем файл для сохранения PATH между этапами сборки Vercel
echo "export PATH=\"\$PATH:$(pwd)/flutter/bin\"" > /tmp/flutter-path.sh
source /tmp/flutter-path.sh

echo "4. Configuring Git safe directory..."
# Решаем проблему dubious ownership
git config --global --add safe.directory $(pwd)/flutter

echo "5. Enabling Flutter web..."
$(pwd)/flutter/bin/flutter config --enable-web --no-analytics

echo "6. Installation complete."