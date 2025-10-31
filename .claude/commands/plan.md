# Plan a New Feature

Create a new feature file with requirements only. This is Phase 1 of 3.

## Your Task

1. **Get the feature name** (if not provided, ask for it)
2. **Gather requirements by asking clarifying questions:**
   - What problem does this solve?
   - What are the core requirements?
   - What's in scope vs out of scope?
   - Any constraints or considerations?
   - Ask 3-5 targeted questions to fully understand WHAT to build
3. **Create the feature file:** `dev/features/<feature-name>.md`
4. **Fill ONLY the requirements section** (NO technical details yet)

## Template to Use

```markdown
# <Feature Name>

**Goal:** [One sentence description]

**Priority:** [High/Medium/Low] | **Effort:** TBD | **Planned:** [Today's date]

## Requirements

### User wants:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

### Success criteria:
- [ ] [How do we know it's done?]
- [ ] [What does success look like?]

### Out of scope:
- [What we're NOT building in this version]

## Open Questions

- [ ] [Any remaining questions?]

---

**Next step:** Run `/tasks <feature-name>` to create technical breakdown and task list.
```

## Important Rules

❌ **DO NOT include:**
- Technical approach
- Implementation details
- Task breakdowns
- File names or code

✅ **DO include:**
- Clear requirements
- User needs
- Acceptance criteria
- Scope boundaries

## After Creating the File

Tell the user:
```
✅ Feature planned: <feature-name>

Requirements captured in dev/features/<feature-name>.md

Next step: Run /tasks <feature-name> to break down into technical tasks.
```

## Example

Good (requirements only):
```
## Requirements
- User can press Cmd+1/2/3 to navigate to main sections
- Works on both Mac (Cmd) and Windows (Ctrl)
- Shows toast notification when shortcut is used
```

Bad (too technical):
```
## Requirements
- Create useKeyboardShortcuts hook with useEffect ← NO!
- Add event listener in MainLayout component ← NO!
```

---

Remember: This is just requirements gathering. Technical planning comes in `/tasks`.
