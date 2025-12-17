#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'user', or 'delivery'."
  exit 1
fi

case $1 in
  user)
    flutterfire config \ --project=shiphub-dd08d \ --out=lib/firebase_options_user.dart \ --ios-bundle-id=com.shiphub.app \ --ios-out=ios/flavors/user/GoogleService-Info.plist \ --android-package-name=com.shiphub.app \ --android-out=android/app/src/user/google-services.json
    ;;
  delivery)
flutterfire config \ --project=shiphub-dd08d \ --out=lib/firebase_options_delivery.dart \ --ios-bundle-id=com.shiphub.delivery \ --ios-out=ios/flavors/delivery/GoogleService-Info.plist \ --android-package-name=com.shiphub.delivery \ --android-out=android/app/src/delivery/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'user', or 'delivery'."
    exit 1
    ;;
esac