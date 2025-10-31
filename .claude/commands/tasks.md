# Create Technical Task Breakdown

Read the feature plan and create a detailed technical breakdown with specific tasks. This is Phase 2 of 3.

## Your Task

1. **Read the feature file:** `dev/features/<feature-name>.md`
2. **Review the requirements** to understand what needs to be built
3. **Read CLAUDE.md** for project context (stack, patterns, standards)
4. **Design the technical approach:**
   - What components/hooks/functions are needed?
   - What files will be created/modified?
   - What's the implementation strategy?
5. **Break down into specific, actionable tasks**
6. **Add the technical sections** to the existing feature file

## Sections to Add

Add these sections to the existing feature file:

```markdown
## Technical Approach

### Architecture
[How will this be structured? What patterns will you use?]

### Key Components
- **Component/Hook/Function 1:** [What it does]
- **Component/Hook/Function 2:** [What it does]

### Dependencies
[Are there any blockers? Prerequisites? External libraries needed?]

## Tasks

### Setup
- [ ] [Any setup tasks?]

### Implementation
- [ ] [Specific task 1 - be detailed]
- [ ] [Specific task 2 - name exact files]
- [ ] [Specific task 3 - clear deliverable]

### Testing
- [ ] [Unit tests for component/hook]
- [ ] [Integration tests if needed]
- [ ] [Manual testing steps]

### Documentation
- [ ] [Update README if needed]
- [ ] [Add JSDoc comments]

**Estimated effort:** [X hours/days]

## Files to Create/Modify

**New files:**
- `src/path/to/NewComponent.tsx`
- `src/path/to/NewComponent.test.tsx`

**Modified files:**
- `src/path/to/ExistingFile.tsx` - Add new functionality
- `src/path/to/OtherFile.tsx` - Integrate new component

---

**Next step:** Run `/start <feature-name>` to begin implementation.
```

## Important Rules

✅ **Tasks should be:**
- Specific (not vague like "implement feature")
- Actionable (clear what to do)
- Testable (clear when it's done)
- Ordered logically (dependencies first)

❌ **Avoid:**
- Vague tasks like "build the thing"
- Tasks that are too large (break them down)
- Skipping testing tasks
- Missing file paths

## Good vs Bad Tasks

**Good tasks:**
```
- [ ] Create src/hooks/useKeyboardShortcuts.ts with event listener logic
- [ ] Add platform detection (Mac vs Windows) using navigator.platform
- [ ] Write unit tests in src/hooks/useKeyboardShortcuts.test.ts
- [ ] Import hook into src/components/MainLayout.tsx
- [ ] Test shortcuts work in Chrome on Mac
```

**Bad tasks:**
```
- [ ] Make keyboard shortcuts work ← Too vague
- [ ] Add code ← Not specific
- [ ] Testing ← What kind? Where?
```

## After Updating the File

Tell the user:
```
✅ Technical breakdown complete: <feature-name>

Added to dev/features/<feature-name>.md:
- Technical approach with [X] components/hooks
- [Y] tasks broken down and ready
- Estimated effort: [Z] hours

Next step: Run /start <feature-name> to begin implementation.
```

## Example Output

Show the user a summary:
```
Technical Approach:
- Create useKeyboardShortcuts hook with event listeners
- Integrate into MainLayout component
- Use react-router's navigate() for routing
- Add toast notifications via Sonner

Tasks: 8 total
- Setup: 0
- Implementation: 5
- Testing: 2
- Documentation: 1

Files: 2 new, 1 modified

Ready to start? Run /start <feature-name>
```

---

Remember: Be thorough but realistic. Break large tasks into smaller steps.
