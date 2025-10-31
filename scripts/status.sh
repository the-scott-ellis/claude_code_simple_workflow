#!/bin/bash
# Shows status of all work in the project

echo "📊 Project Status"
echo "═════════════════════════════════════"
echo ""

# Check if dev folder exists
if [[ ! -d "dev/features" ]]; then
  echo "⚠️  No dev/features folder found."
  echo "Run: .claude-workflow/scripts/init.sh"
  exit 1
fi

# Active work
echo "⏺  ACTIVE WORK"
echo "─────────────────────────────────────"
ACTIVE_COUNT=0
if ls dev/features/*.active.md 1> /dev/null 2>&1; then
  for file in dev/features/*.active.md; do
    basename "$file" .active.md
    ACTIVE_COUNT=$((ACTIVE_COUNT + 1))
  done
else
  echo "  (none)"
fi

if [[ $ACTIVE_COUNT -gt 1 ]]; then
  echo ""
  echo "⚠️  WARNING: Multiple active files found!"
  echo "   Only one file should be .active.md at a time."
fi

echo ""

# Ready/Planned work
echo "○  READY TO START"
echo "─────────────────────────────────────"
READY_COUNT=0
if ls dev/features/*.md 1> /dev/null 2>&1; then
  for file in dev/features/*.md; do
    # Skip active and backlog files
    if [[ ! "$file" =~ \.active\.md$ ]] && [[ ! "$file" =~ \.backlog\.md$ ]] && [[ ! "$file" =~ \.blocked\.md$ ]]; then
      basename "$file" .md
      READY_COUNT=$((READY_COUNT + 1))
    fi
  done
fi

if [[ $READY_COUNT -eq 0 ]]; then
  echo "  (none)"
fi

echo ""

# Blocked work
echo "🚫 BLOCKED"
echo "─────────────────────────────────────"
BLOCKED_COUNT=0
if ls dev/features/*.blocked.md 1> /dev/null 2>&1; then
  for file in dev/features/*.blocked.md; do
    basename "$file" .blocked.md
    BLOCKED_COUNT=$((BLOCKED_COUNT + 1))
  done
else
  echo "  (none)"
fi

echo ""

# Backlog
echo "◔  BACKLOG"
echo "─────────────────────────────────────"
BACKLOG_COUNT=0
if ls dev/features/*.backlog.md 1> /dev/null 2>&1; then
  for file in dev/features/*.backlog.md; do
    basename "$file" .backlog.md
    BACKLOG_COUNT=$((BACKLOG_COUNT + 1))
  done
else
  echo "  (none)"
fi

echo ""

# Completed
echo "✓  COMPLETED"
echo "─────────────────────────────────────"
DONE_COUNT=0
if ls dev/done/*.md 1> /dev/null 2>&1; then
  DONE_COUNT=$(ls -1 dev/done/*.md 2>/dev/null | wc -l | xargs)
  echo "  $DONE_COUNT features completed"
  echo ""
  echo "  Recent completions:"
  ls -t dev/done/*.md 2>/dev/null | head -5 | while read file; do
    echo "    - $(basename "$file" .md)"
  done
else
  echo "  (none)"
fi

echo ""
echo "═════════════════════════════════════"
echo "Summary: $READY_COUNT ready | $ACTIVE_COUNT active | $BLOCKED_COUNT blocked | $BACKLOG_COUNT backlog | $DONE_COUNT done"
echo ""
