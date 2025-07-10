#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', or 'sa'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \ --project=gold-dev-a8477 \ --out=lib/firebase_options_dev.dart \ --ios-bundle-id=com.asaar.gold.dev \ --ios-out=ios/flavors/dev/GoogleService-Info.plist \ --android-package-name=com.asaar.gold.dev \ --android-out=android/app/src/dev/google-services.json
    ;;
  stg)
flutterfire config \ --project=gold-sa-8364b \ --out=lib/firebase_options_sa.dart \ --ios-bundle-id=com.asaar.gold.sa \ --ios-out=ios/flavors/sa/GoogleService-Info.plist \ --android-package-name=com.asaar.gold.sa \ --android-out=android/app/src/sa/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', or 'sa'."
    exit 1
    ;;
esac