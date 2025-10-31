#!/bin/bash
# Creates a new feature file from template

if [[ -z "$1" ]]; then
  echo "Usage: ./new-feature.sh <feature-name>"
  echo "Example: ./new-feature.sh keyboard-shortcuts"
  exit 1
fi

FEATURE_NAME=$1
FILE_PATH="dev/features/${FEATURE_NAME}.md"

if [[ -f "$FILE_PATH" ]]; then
  echo "❌ Feature file already exists: $FILE_PATH"
  exit 1
fi

# Create from template
cat > "$FILE_PATH" <<EOF
# ${FEATURE_NAME}

**Goal:** [One sentence description of what this feature does]

**Priority:** Medium | **Effort:** TBD | **Planned:** $(date +"%b %d, %Y")

## Plan

- [ ] First step
- [ ] Second step
- [ ] Third step

## Context

### Current State
[What exists now?]

### Desired State
[What should exist after this feature?]

### Why This Feature?
[What problem does it solve? What value does it add?]

## Technical Approach

[How will you implement this? Any key decisions?]

## Open Questions

- [ ] Question 1?
- [ ] Question 2?

## Related Files
- [List key files that will be created/modified]

## Dependencies
[Any blockers? Does something else need to be done first?]

## For Next Session
[Leave notes for picking up this work later]

---

**Status:** Ready to start when prioritized.
EOF

echo "✅ Created: $FILE_PATH"
echo ""
echo "Next steps:"
echo "  1. Edit the file and fill in the details"
echo "  2. When ready to start: ./scripts/start-work.sh $FEATURE_NAME"
