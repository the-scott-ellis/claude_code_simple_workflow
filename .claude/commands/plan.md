# Plan a New Feature

Create a new feature file with requirements only. This is Phase 1 of 3.

## Your Task

1. **Get the feature description** from the command arguments (e.g., `/plan "add dark mode toggle"`)
2. **Ask clarifying questions** using the AskUserQuestion tool:
   - What problem does this solve?
   - What are the core requirements?
   - What's in scope vs out of scope?
   - Any constraints or considerations?
   - Ask 3-5 targeted questions to fully understand WHAT to build
3. **Invoke the Planning Agent** to create the feature file
4. **Show the result** to the user and create the file in `features/`

## Planning Agent Invocation

After gathering requirements through clarifying questions, invoke the Planning Agent:

Use the Task tool with:
- `subagent_type`: "general-purpose"
- `description`: "Plan new feature"
- `prompt`: "You are the Planning Agent from .agents/planning-agent.md. Create a feature plan for: [feature description]. Use these clarifying answers: [user's answers]. Generate a complete feature file following the format in your agent file, including: Goal, Context, User Story, Acceptance Criteria, Technical Considerations, Out of Scope, and metadata (Status: Planned, Priority, Effort estimate, Created date). Return the complete feature file content and suggest a filename."

## After Agent Returns

1. **Review the agent's plan** - Ensure it captures requirements correctly
2. **Create the feature file** in `features/[feature-name].md`
3. **Tell the user:**
```
✅ Feature planned: [feature-name]

Created: features/[feature-name].md

The plan includes:
- Clear goal and user story
- [N] acceptance criteria
- Technical considerations
- Scope boundaries

Next step: Run /tasks [feature-name] to create the technical breakdown.
```

## Important Notes

- The Planning Agent handles the file format and content structure
- You handle user interaction (questions) and file creation
- Focus on gathering good requirements through questions
- Let the agent do the detailed planning work

---

Remember: This is Phase 1 - requirements and planning only. Technical breakdown comes in `/tasks`.
