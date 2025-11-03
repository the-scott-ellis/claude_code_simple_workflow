# Claude Code Workflow System

A lightweight, session-friendly workflow for AI-assisted development with Claude Code.

## Installation

From your project root:

```bash
# Add as git submodule (recommended)
git submodule add https://github.com/the-scott-ellis/claude_code_simple_workflow.git .claude-workflow

# Make scripts executable
chmod +x .claude-workflow/scripts/*.sh

# Initialize the workflow
.claude-workflow/scripts/init.sh
```

This creates:
- `CLAUDE.md` - Pre-filled with detected project info + workflow instructions
- `dev/features/` - Empty, ready for new features
- `dev/done/` - For archived completed work

**Next steps:**
1. Edit `CLAUDE.md` to add your project-specific context
2. Optional: Copy slash commands to your project: `cp -r .claude-workflow/.claude .`
3. Start working: Open Claude Code and say "Let's plan out [your feature]"

> **Note:** Other installation options (minimal setup, team configurations, different project types) are available in [INSTALL.md](INSTALL.md).

## Philosophy

- **Low ceremony:** Minimal files, maximum clarity
- **Session-aware:** Easy to pick up where you left off
- **Agent-friendly:** Sub-agents can quickly understand context
- **Living documents:** Files evolve as work progresses

## Structure

```
your-project/
├── CLAUDE.md                    # Project context + workflow instructions
├── /dev/
│   ├── /features/
│   │   ├── feature-name.active.md    # Currently working on (ONE only)
│   │   ├── feature-name.md           # Ready/Planned (default state)
│   │   ├── feature-name.backlog.md   # Rough idea, not fully spec'd
│   │   └── feature-name.blocked.md   # Waiting on external dependency
│   └── /done/
│       └── 2025-01-feature-name.md   # Archived completed work
└── .claude-workflow/            # This workflow (optional submodule)
    ├── /.claude/commands/       # Slash commands (/plan, /tasks, /start, etc.)
    ├── /.agents/                # Specialized sub-agents (optional)
    └── /scripts/                # Helper utilities (optional)
```

## Filename Conventions

Status is indicated by the file extension:

- **`.active.md`** - Currently working on (only ONE file should have this)
- **`.backlog.md`** - Rough idea, not yet fully planned
- **`.blocked.md`** - Waiting on something external (optional)
- **`.md`** - Default state (ready/planned, fully spec'd)

Benefits:
- Instant visual scan without opening files
- Easy to find active work: `ls *.active.md`
- Git commits show clear status changes
- Simple for scripts/automation to parse

## Workflow Commands

The workflow uses slash commands to enforce structure:

```bash
/status                    # Show all features and their states
/plan <feature-name>       # Gather requirements (Phase 1)
/tasks <feature-name>      # Create technical breakdown (Phase 2)
/start <feature-name>      # Begin implementation (Phase 3)
/finish <feature-name>     # Archive completed work
```

### Three-Phase Process

**Phase 1: `/plan` - Requirements**
- Gather requirements from user
- Ask clarifying questions
- Define WHAT to build (not HOW)
- Output: Feature file with requirements only

**Phase 2: `/tasks` - Technical Breakdown**
- Read the requirements
- Define technical approach
- Break into specific tasks with checkboxes
- Output: Task list added to feature file

**Phase 3: `/start` - Implementation**
- Execute tasks one by one
- Check off boxes as you complete them
- Update with session notes
- Output: Working code, tests, documentation

### Example Session

```
User: /plan keyboard-shortcuts
→ Claude asks questions, gathers requirements, creates plan

User: /tasks keyboard-shortcuts
→ Claude designs technical approach, creates task list

User: /start keyboard-shortcuts
→ Claude implements, checking off tasks as it goes

User: /finish keyboard-shortcuts
→ Claude archives to done/ folder
```

## Best Practices

- **Only one `.active.md` at a time** - keeps focus clear
- **Update as you go** - check boxes, add notes during session
- **"For Next Session" section** - critical for continuity
- **Session History** - breadcrumb trail of what happened when
- **Be honest in Current State** - helps future you/agents orient quickly
- **Use descriptive filenames** - `auth-improvements.md` not `feature-2.md`

## Why This Works

✅ **Enforced structure:** Can't skip planning phases
✅ **Session continuity:** Feature files tell the story
✅ **Clear next steps:** Commands guide the process
✅ **Team consistency:** Everyone follows same workflow
✅ **Agent-friendly:** Claude reads CLAUDE.md + .active.md each session
✅ **Low friction:** Simpler than spec/plan/task multi-file systems

Simple. Flexible. Actually gets used.

---

## What to Put in CLAUDE.md

Your `CLAUDE.md` file should contain project context that helps Claude (and humans) understand your project:

```markdown
# Project Name

## Overview
Brief description of what this project does and its purpose.

## Tech Stack
- Language/framework
- Key libraries
- Build tools
- Testing approach

## Project Structure
Brief overview of how code is organized.

## Development Workflow
How you prefer to work, coding conventions, etc.

## Current Priorities
What's most important right now.

## Active Work
Link to current .active.md file or describe current focus.
```

## Feature File Template

When creating a new feature file, use this structure:

```markdown
# Feature: [Name]

## Current State
- Status: Planning / In Progress / Testing / etc.
- Last Updated: [Date]
- Owner: [You/Team]

## Requirements
[What needs to be built - the WHAT, not the HOW]

## Technical Approach
[How it will be implemented - added during /tasks phase]

## Tasks
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

## For Next Session
[Critical context for picking up where you left off]

## Session History
### [Date] - Session 1
[What happened this session]
```

---

## FAQ

**Q: Do I need to use all the slash commands?**
A: No! The core workflow is just the file structure. Slash commands are optional enhancements.

**Q: Can I adapt this to my own workflow?**
A: Absolutely. This is a starting point. Modify to fit your needs.

**Q: Do I need the scripts folder?**
A: No. The scripts are helpers. You can manage files manually.

**Q: What if I want to work on multiple features?**
A: You can, but keep only ONE `.active.md`. Use feature branches in git for parallel work.

**Q: How do I handle urgent bugs?**
A: Create a `hotfix-description.md` file, work on it, then archive to done/

---

## License

MIT License - adapt and use however works for you.

## Contributing

This is designed to be forked and customized. Share your adaptations!
