

---

## Claude Workflow System

We use structured feature development with the Claude Workflow.

### Workflow Commands

**Start every session with `/status` to see current work.**

```
/plan <feature>    →  Gather requirements (WHAT to build)
/tasks <feature>   →  Technical breakdown (HOW to build)
/start <feature>   →  Begin implementation
/finish <feature>  →  Archive when complete
/status            →  Show all features
```

### Phase Rules

1. **`/plan`** - Requirements only (no code, no technical details)
2. **`/tasks`** - Create technical approach and task list
3. **`/start`** - Execute tasks, check them off as you go
4. **`/finish`** - Archive to done/ when all tasks complete

### Important

- ❌ Never skip phases
- ❌ Never work on multiple features (one `.active.md` only)
- ✅ Always run `/status` at session start
- ✅ Always update feature files as you work

### File Locations

- Feature tracking: `dev/features/`
- Completed work: `dev/done/`
