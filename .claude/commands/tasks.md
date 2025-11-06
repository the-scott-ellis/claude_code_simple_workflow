# Create Technical Task Breakdown

Read the feature plan and create a detailed technical breakdown with specific tasks. This is Phase 2 of 3.

## Your Task

1. **Get the feature name** from command arguments (e.g., `/tasks dark-mode-toggle`)
2. **Read the feature file:** `features/<feature-name>.md`
3. **Ask any technical clarification questions** if needed using AskUserQuestion tool
4. **Invoke the Technical Breakdown Agent** to create the detailed task breakdown
5. **Review and create the updated `.active.md` file**

## Technical Breakdown Agent Invocation

After reading the feature file and gathering any needed clarifications, invoke the Technical Breakdown Agent:

Use the Task tool with:
- `subagent_type`: "general-purpose"
- `description`: "Create technical breakdown"
- `prompt`: "You are the Technical Breakdown Agent from .agents/technical-agent.md. Create a detailed technical breakdown for the feature in features/[feature-name].md. First, explore the codebase to understand its structure, patterns, and relevant existing code. Then create a detailed task breakdown organized into sessions. Transform the file from .md to .active.md format with: metadata updates (Status: Active, Started date, Session: 1, Estimated Sessions), detailed task checklist grouped by sessions, Technical Notes section with architecture decisions and files to change, and Current State section. Return the complete updated feature file content."

## After Agent Returns

1. **Review the technical breakdown** - Verify tasks are specific and well-organized
2. **Create the new file** as `features/[feature-name].active.md`
3. **Delete the old file** `features/[feature-name].md`
4. **Tell the user:**
```
✅ Technical breakdown complete: [feature-name]

Created: features/[feature-name].active.md

The breakdown includes:
- [N] tasks across [X] sessions
- Specific files identified: [count] new, [count] modified
- Architecture and implementation approach
- Potential challenges identified

Ready to start implementing!
```

## Important Notes

- The Technical Breakdown Agent explores the codebase first
- It creates specific tasks with file paths
- Tasks are organized into logical sessions
- The file must be renamed from `.md` to `.active.md`
- You handle file operations (read, create, delete)
- Let the agent do the exploration and breakdown work

---

Remember: This is Phase 2 - technical planning. Implementation comes next when the developer starts working through the tasks.
