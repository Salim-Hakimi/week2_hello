#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK was not found. Install Flutter and add it to PATH first."
  echo "Then run: flutter doctor"
  exit 1
fi

# Generate Android/Web platform folders if this source package was extracted
# without the generated platform scaffolding.
if [[ ! -d android || ! -d web ]]; then
  flutter create --project-name week2_hello --platforms=android,web .
fi

flutter pub get

echo
echo "Available Flutter devices:"
flutter devices

echo
echo "Starting the app on the available/default device..."
flutter run
