# Feature Examples

This directory contains example feature files from a React/TypeScript project to demonstrate how the workflow functions.

## About These Examples

These files show:
- Different feature statuses (`.active.md`, `.backlog.md`, standard `.md`)
- How to document requirements, tasks, and progress
- Session history tracking
- "For Next Session" sections for continuity

## Using in Your Project

When you initialize the workflow in your project, this directory will be **empty** and ready for your features. These examples are just for reference.

## File Status Conventions

- **`.active.md`** - Currently being worked on (only one at a time)
- **`.backlog.md`** - Rough idea, not yet fully planned
- **`.blocked.md`** - Waiting on external dependency
- **`.md`** - Ready/planned, fully specified

## Creating Your First Feature

Use the workflow commands:
```
/plan feature-name    # Gather requirements
/tasks feature-name   # Create technical breakdown
/start feature-name   # Begin implementation (auto-renames to .active.md)
```

Or create manually:
```bash
touch dev/features/my-feature.md
```

Then start working with Claude Code!
