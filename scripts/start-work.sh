#!/bin/bash
# Marks a feature as active by renaming to .active.md

if [[ -z "$1" ]]; then
  echo "Usage: ./start-work.sh <feature-name>"
  echo "Example: ./start-work.sh keyboard-shortcuts"
  exit 1
fi

FEATURE_NAME=$1
SOURCE_FILE="dev/features/${FEATURE_NAME}.md"
TARGET_FILE="dev/features/${FEATURE_NAME}.active.md"

# Check if source exists
if [[ ! -f "$SOURCE_FILE" ]]; then
  echo "❌ Feature file not found: $SOURCE_FILE"
  echo ""
  echo "Available features:"
  ls dev/features/*.md 2>/dev/null | while read file; do
    basename "$file" .md
  done
  exit 1
fi

# Check if there's already an active file
if ls dev/features/*.active.md 1> /dev/null 2>&1; then
  EXISTING_ACTIVE=$(ls dev/features/*.active.md | head -1)
  echo "⚠️  Warning: Another feature is already active:"
  echo "   $(basename "$EXISTING_ACTIVE")"
  echo ""
  read -p "Switch to $FEATURE_NAME anyway? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
  fi

  # Deactivate existing
  EXISTING_BASE=$(basename "$EXISTING_ACTIVE" .active.md)
  mv "$EXISTING_ACTIVE" "dev/features/${EXISTING_BASE}.md"
  echo "✓ Deactivated: $EXISTING_BASE"
fi

# Activate new feature
mv "$SOURCE_FILE" "$TARGET_FILE"
echo "✅ Activated: $FEATURE_NAME"
echo ""
echo "Ready to work! Claude will read dev/features/${FEATURE_NAME}.active.md"
