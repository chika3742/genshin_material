#!/usr/bin/env bash

if [[ "$CONFIGURATION" == "Release-"* ]]; then
    gsinfo_plist_path="$TARGET_BUILD_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH/GoogleService-Info.plist"
    firebase_app_id=$(/usr/libexec/PlistBuddy -c "Print :GOOGLE_APP_ID" "$gsinfo_plist_path")
    upload_symbols="${BUILD_DIR%/Build/*}/SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/upload-symbols"
    if [ ! -x "$upload_symbols" ]; then
        upload_symbols="$SRCROOT/../build/ios/SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/upload-symbols"
    fi
    $upload_symbols --build-phase --validate -ai "$firebase_app_id" -- "$DWARF_DSYM_FOLDER_PATH/App.framework.dSYM"
    $upload_symbols --build-phase -ai "$firebase_app_id" -- "$DWARF_DSYM_FOLDER_PATH/App.framework.dSYM"
fi
