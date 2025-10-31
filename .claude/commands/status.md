# Show Project Status

Display all features and their current states. Use this to see what's being worked on and what's available.

## Your Task

1. **Scan the dev/features/ folder** for all markdown files
2. **Categorize by file extension:**
   - `.active.md` - Currently working on
   - `.blocked.md` - Blocked/waiting
   - `.backlog.md` - Rough ideas
   - `.md` - Ready to start (planned with tasks)
3. **Check dev/done/** for completed features
4. **Display a formatted summary**

## Output Format

```
📊 Project Status
═══════════════════════════════════════

⏺  ACTIVE WORK (1)
─────────────────────────────────────
keyboard-shortcuts
  Status: Session 2, 5/7 tasks complete
  Last updated: 2 hours ago

○  READY TO START (2)
─────────────────────────────────────
auth-improvements
  Priority: High | Effort: 4 hours
  8 tasks defined

bulk-campaign-edit
  Priority: Medium | Effort: 8 hours
  10 tasks defined

🚫 BLOCKED (0)
─────────────────────────────────────
(none)

◔  BACKLOG (1)
─────────────────────────────────────
export-to-csv
  Priority: Low | Rough idea

✓  COMPLETED (3)
─────────────────────────────────────
Recent completions:
  - add-member-modal (Jan 14)
  - user-profiles (Jan 12)
  - initial-setup (Jan 10)

═══════════════════════════════════════
Summary: 2 ready | 1 active | 0 blocked | 1 backlog | 3 done
```

## For Active Work

If there's active work, show more detail:
- How many tasks are complete vs total
- Last session date
- Any blockers noted

## Helpful Suggestions

Based on status, suggest next steps:

**If no active work:**
```
💡 No active work. Ready to start something?

Suggestions:
- /start auth-improvements (high priority, ready to go)
- /plan <new-feature> (start something new)
```

**If active work exists:**
```
💡 Currently working on: keyboard-shortcuts

- Continue work: Just keep going, I'll update the .active.md file
- Switch features: /start <other-feature>
- Finish current: /finish keyboard-shortcuts (when done)
```

**If multiple planned features:**
```
💡 You have 3 features ready to start.

Need help prioritizing? I can help you decide which to tackle first based on:
- Dependencies between features
- Effort estimates
- Priority levels
```

## Reading Task Progress

When showing active work, read the file to count:
- Total tasks: Count all `- [ ]` and `- [x]`
- Complete: Count `- [x]`
- Show as "X/Y tasks complete"

## Example Interaction

```
User: /status

You:
📊 Project Status

⏺  ACTIVE: keyboard-shortcuts (5/7 tasks)
○  READY: auth-improvements, bulk-campaign-edit
◔  BACKLOG: export-to-csv
✓  DONE: 3 features

💡 Almost done with keyboard-shortcuts!
   2 tasks remaining. Want to finish it?
```

---

Use this command when:
- Starting a new session (to see what's in progress)
- Deciding what to work on next
- Getting project overview
