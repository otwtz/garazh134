#!/bin/bash
echo "1. Downloading Flutter SDK..."
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.22.1-stable.tar.xz -o flutter.tar.xz

echo "2. Extracting..."
tar -xf flutter.tar.xz

echo "3. Adding Flutter to PATH for the current session..."
export PATH="$PATH:$(pwd)/flutter/bin"

echo "4. Setting PATH in a persistent way for Vercel..."
echo "export PATH=\"\$PATH:$(pwd)/flutter/bin\"" >> $BASH_ENV

echo "5. Enabling Flutter web..."
./flutter/bin/flutter config --enable-web

echo "6. Installation complete. Flutter version:"
./flutter/bin/flutter --version