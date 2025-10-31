# Start Feature Implementation

Begin working on a feature by marking it as active and executing the tasks. This is Phase 3 of 3.

## Your Task

1. **Verify the feature has tasks:**
   - Check that `dev/features/<feature-name>.md` exists
   - Verify it has a Technical Approach and Tasks section
   - If missing, tell user to run `/tasks <feature-name>` first

2. **Check for existing active work:**
   - Look for any `*.active.md` files in `dev/features/`
   - If found, ask user if they want to switch (pause current work)

3. **Mark as active:**
   - Rename `dev/features/<feature-name>.md` → `dev/features/<feature-name>.active.md`

4. **Add Session History section** (if not already present):
   ```markdown
   ## Session History

   ### [Today's date] - Session 1
   **Started:** [Time]

   [Update this section as you work with progress notes]
   ```

5. **Begin implementation:**
   - Work through tasks in order
   - Check off boxes as you complete them: `- [x]`
   - Add notes to Session History as you progress
   - Create files, write code, run tests
   - Update the feature file in real-time

## Important Rules

✅ **As you work:**
- Check off tasks immediately when done
- Add session notes for significant decisions
- Note any blockers or issues encountered
- Update effort estimates if needed

✅ **Code quality:**
- Follow project standards (see CLAUDE.md)
- Write tests as you go (or after, per project preference)
- Run linters and type-checker
- Ensure accessibility requirements met

❌ **Don't:**
- Skip tasks without documenting why
- Work on multiple features at once
- Forget to update the feature file
- Leave broken code uncommitted

## Updating the Feature File

As you work, update the Session History:

```markdown
## Session History

### Jan 16, 2025 - Session 1
**Duration:** ~45 minutes

Progress:
- [x] Created useKeyboardShortcuts hook
- [x] Added platform detection (Mac vs Windows)
- [x] Wrote unit tests, all passing ✓

Decisions:
- Used navigator.platform for OS detection
- Chose meta key (Cmd) for Mac, ctrl for Windows
- Added preventDefault() to avoid browser conflicts

Next:
- Need to integrate into MainLayout
- Then test in browser

### Jan 16, 2025 - Session 2 (Current)
**In progress...**

- Starting MainLayout integration
```

## When You Finish

**If all tasks are complete:**
Tell the user:
```
✅ Feature complete: <feature-name>

All tasks checked off. Ready to archive?
Run /finish <feature-name> to mark as complete.
```

**If session ends mid-work:**
Update with "For Next Session":
```markdown
## For Next Session

**What's done:**
- Hook is complete and tested
- Located at src/hooks/useKeyboardShortcuts.ts

**What's next:**
- Import into MainLayout.tsx (line 12)
- Wire up with navigate() from react-router
- Test in browser (Cmd+1 should go to /dashboard)

**Blockers:** None
```

## Example Work Session

```
User: /start keyboard-shortcuts

You:
✅ Starting work on keyboard-shortcuts

Marked as active: dev/features/keyboard-shortcuts.active.md

Tasks to complete: 7
- [ ] Create useKeyboardShortcuts hook
- [ ] Add platform detection
- [ ] Write unit tests
- [ ] Integrate into MainLayout
- [ ] Add toast notifications
- [ ] Test in browser
- [ ] Update README

Beginning implementation...

[You work through tasks, checking them off, updating the file]

Task 1/7: Creating useKeyboardShortcuts hook...
✓ Created src/hooks/useKeyboardShortcuts.ts

Task 2/7: Adding platform detection...
✓ Added Mac/Windows detection using navigator.platform

[Continue until done or session ends]
```

## Quality Checklist

Before marking a feature as complete, verify:
- [ ] All tasks checked off
- [ ] Tests written and passing
- [ ] TypeScript compiles without errors
- [ ] Linter passes
- [ ] Feature works as specified in requirements
- [ ] Accessibility requirements met
- [ ] Documentation updated

---

Remember: Update the feature file as you work. It's your progress tracker and session memory.
