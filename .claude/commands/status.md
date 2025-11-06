# Show Project Status

Display all features and their current states. Use this to see what's being worked on and what's available.

## Your Task

Invoke the Status Report Agent to generate the project status.

Use the Task tool with:
- `subagent_type`: "general-purpose"
- `description`: "Generate project status report"
- `prompt`: "You are the Status Report Agent from .agents/status-agent.md. Scan the features/ and done/ folders, categorize all features by their status, and generate a comprehensive status report following the format defined in your agent file. Be sure to count tasks accurately in active files and provide helpful suggestions based on the current state."

The agent will handle:
- Scanning features/ and done/ folders
- Categorizing by file extension (.active.md, .blocked.md, .backlog.md, .md)
- Reading files to extract metadata and count tasks
- Formatting the output with helpful suggestions

Simply invoke the agent and display its report to the user.

---

Use this command when:
- Starting a new session (to see what's in progress)
- Deciding what to work on next
- Getting project overview
