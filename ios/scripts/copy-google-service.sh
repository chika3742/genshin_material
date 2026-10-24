#!/usr/bin/env bash

src="$SRCROOT/Runner/GoogleService-$FLAVOR-Info.plist"
if [ -f "$src" ]; then
    cp "$src" "$TARGET_BUILD_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH/GoogleService-Info.plist"
elif [ "$FLAVOR" = "prod" ]; then
    echo "error: $src not found"
    exit 1
fi
