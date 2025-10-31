# Finish and Archive Feature

Mark a feature as complete and move it to the done/ folder. Use this when all tasks are finished.

## Your Task

1. **Verify the feature is complete:**
   - Read `dev/features/<feature-name>.active.md`
   - Check that all tasks are marked `[x]`
   - Verify code is working (tests pass, builds successfully)

2. **If tasks are incomplete:**
   - Tell user: "Feature still has X incomplete tasks. Continue working or mark them done?"
   - Show which tasks are incomplete
   - Don't archive until user confirms

3. **Complete the documentation:**
   - Add completion date if not present
   - Add final session summary
   - Note total duration if tracked
   - Document any key decisions or learnings

4. **Archive the feature:**
   - Move to `dev/done/YYYY-MM-<feature-name>.md`
   - Remove `.active` from filename

## Completion Documentation

Before archiving, ensure the file has:

```markdown
**Completed:** [Date]
**Duration:** [Total time across all sessions]
**Pull Request:** #[number] (if applicable)

## What We Built

[Summary of what was implemented]

## Key Decisions

[Important technical decisions made during implementation]

## What Went Well

[Successes, good patterns used]

## What We'd Do Differently

[Lessons learned, improvements for next time]

## Related Files

**Created:**
- src/path/to/NewFile.tsx
- src/path/to/NewFile.test.tsx

**Modified:**
- src/path/to/ExistingFile.tsx

## Follow-up Tasks

[Any future enhancements or related work]
```

## Archiving Process

1. **Ensure all tasks are checked:**
   ```markdown
   ## Tasks
   - [x] All tasks should be checked
   - [x] Before archiving
   - [x] Otherwise ask user first
   ```

2. **Move the file:**
   ```
   mv dev/features/keyboard-shortcuts.active.md dev/done/2025-01-keyboard-shortcuts.md
   ```

3. **Celebrate!** Tell the user:
   ```
   ✅ Feature complete: keyboard-shortcuts

   Archived to: dev/done/2025-01-keyboard-shortcuts.md

   Summary:
   - 7 tasks completed
   - 2 sessions
   - ~3 hours total
   - 2 files created, 1 modified

   Great work! 🎉

   What's next?
   - Run /status to see other ready features
   - Run /plan <new-feature> to start something new
   ```

## Quality Check Before Archiving

Ask these questions:
- [ ] All tasks marked as complete?
- [ ] Tests passing?
- [ ] TypeScript compiling?
- [ ] Feature works as specified?
- [ ] Documentation updated (README, etc.)?
- [ ] Code committed to git?

If any are "no", remind the user to finish those before archiving.

## Example

```
User: /finish keyboard-shortcuts

You:
Checking completion status...

✓ All 7 tasks complete
✓ Tests passing
✓ TypeScript compiling
✓ Documentation updated

Ready to archive!

[Moves file to dev/done/2025-01-keyboard-shortcuts.md]

✅ Feature archived: keyboard-shortcuts

What was built:
- useKeyboardShortcuts hook with platform detection
- Integration into MainLayout
- Toast notifications on shortcut use
- Comprehensive tests

Duration: 2 sessions (~3 hours)
Files: 2 created, 1 modified

Excellent work! What would you like to work on next?
```

## If Tasks Are Incomplete

```
User: /finish keyboard-shortcuts

You:
⚠️  Not ready to finish yet

Incomplete tasks (2 remaining):
- [ ] Test in browser on Windows
- [ ] Update README with shortcuts

Would you like to:
1. Continue working to finish these tasks
2. Mark them as done anyway (not recommended)
3. Move them to a follow-up task

Which would you prefer?
```

## After Archiving

Suggest next steps:
```
What's next?

Options:
1. /status - See what else is ready
2. /start auth-improvements - High priority, ready to go
3. /plan <new-feature> - Start something new
4. Take a break! ☕
```

---

Use this command when all work is complete and you're ready to move on.
