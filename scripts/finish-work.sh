#!/bin/bash
# Moves completed feature to done/ folder

if [[ -z "$1" ]]; then
  echo "Usage: ./finish-work.sh <feature-name>"
  echo "Example: ./finish-work.sh keyboard-shortcuts"
  exit 1
fi

FEATURE_NAME=$1
SOURCE_FILE="dev/features/${FEATURE_NAME}.active.md"
TIMESTAMP=$(date +"%Y-%m")
TARGET_FILE="dev/done/${TIMESTAMP}-${FEATURE_NAME}.md"

# Check if source exists
if [[ ! -f "$SOURCE_FILE" ]]; then
  echo "❌ Active feature file not found: $SOURCE_FILE"
  echo ""
  echo "Current active work:"
  ls dev/features/*.active.md 2>/dev/null | while read file; do
    basename "$file" .active.md
  done
  exit 1
fi

echo "📦 Archiving completed feature..."

# Move to done/
mv "$SOURCE_FILE" "$TARGET_FILE"

# Update the file to add completion date if not already there
if ! grep -q "**Completed:**" "$TARGET_FILE"; then
  # Add completion date after the title
  sed -i.bak "1a\\
\\
**Completed:** $(date +"%B %d, %Y")
" "$TARGET_FILE" && rm "${TARGET_FILE}.bak"
fi

echo "✅ Completed: $FEATURE_NAME"
echo "   Archived to: $TARGET_FILE"
echo ""
echo "Great work! 🎉"
