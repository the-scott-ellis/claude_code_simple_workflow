# Development Agents

Specialized AI agents for domain-specific development tasks. These agents work with Claude Code to provide expert assistance tailored to your project's tech stack and workflow.

## What Are Agents?

Agents are markdown files that define a specialized persona, expertise area, and patterns for Claude to follow. When invoked, Claude reads the agent file and adopts that role to handle specific tasks with deep domain knowledge.

Think of agents as:
- **Expert consultants** - Each has deep knowledge in their domain
- **Pattern libraries** - They encode best practices and consistent approaches
- **Workflow accelerators** - They speed up complex, repetitive tasks
- **Knowledge persistence** - They capture and share team expertise

## Quick Start

### Bootstrap Agents for Your Project

The easiest way to get started is to let Claude analyze your project and propose relevant agents:

```bash
# Copy slash commands to your project if you haven't already
cp -r .claude-workflow/.claude .

# Then use the /agents command
/agents
```

Claude will:
1. Analyze your tech stack and project structure
2. Propose 3-5 agents tailored to your needs
3. Generate agent files specific to your stack
4. Include relevant examples from your codebase

### Manual Creation

You can also create agents manually. See "Creating Custom Agents" below.

## Included Agents

### Task Orchestrator (`task-orchestrator.md`)
**Purpose:** Coordinates complex multi-step tasks across multiple domains

**Capabilities:**
- Analyzes tasks and identifies required expertise
- Routes work to appropriate agents
- Manages dependencies and sequencing
- Parallelizes independent work

**Use when:** You have a complex feature requiring coordination across multiple technical domains

**Stack:** Language/framework agnostic

## Creating Custom Agents

### Agent File Structure

Every agent should be a markdown file with these sections:

```markdown
# [Agent Name]

## Identity
Who is this agent? What role do they play?

## Core Principles
3-5 fundamental beliefs or approaches this agent follows

## Capabilities
What can this agent do? What tasks does it handle?

## Tech Stack (if relevant)
Specific technologies, frameworks, tools this agent works with

## Patterns & Examples
Code examples, approaches, common solutions in this domain

## Success Metrics
How do you know this agent did a good job?

## Common Pitfalls
What mistakes does this agent help avoid?
```

### Agent Design Guidelines

#### 1. Single Responsibility
Each agent should have ONE clear domain:
- ✅ "API Integration Specialist" - focused, clear scope
- ❌ "Backend Developer" - too broad, unclear boundaries

#### 2. Technology Specific
Agents should be opinionated about tech choices:
- ✅ Include specific frameworks, libraries, patterns
- ✅ Show actual code examples from your stack
- ❌ Generic advice that applies to everything

#### 3. Actionable Knowledge
Focus on HOW, not just WHAT:
- ✅ "Use this pattern: [code example]"
- ✅ "Common mistake: X. Instead do: Y"
- ❌ "Write good code" (too vague)

#### 4. Project Context
Reference your actual project:
- ✅ "Follow conventions in `src/api/base.ts`"
- ✅ "Use our standard error handling (see CLAUDE.md)"
- ❌ Generic best practices without context

## Example Agents by Stack

### React/TypeScript Project
```
- test-first-developer.md       # Jest, RTL, TDD workflow
- type-safety-agent.md          # TypeScript, Zod schemas
- react-patterns-agent.md       # Hooks, components, state
- accessibility-specialist.md   # WCAG, ARIA, keyboard nav
```

### Python/Django Backend
```
- django-patterns-agent.md      # Views, models, migrations
- api-design-agent.md           # DRF, serializers, versioning
- python-testing-agent.md       # pytest, fixtures, mocking
- database-specialist.md        # PostgreSQL, queries, optimization
```

### Go Microservices
```
- go-patterns-agent.md          # Idioms, error handling, concurrency
- grpc-specialist.md            # Protocol buffers, services
- kubernetes-agent.md           # Deployments, services, configs
- testing-agent.md              # Table tests, mocks, benchmarks
```

### Full-Stack JavaScript
```
- api-integration-agent.md      # REST, GraphQL, caching
- database-agent.md             # Prisma, migrations, queries
- frontend-patterns-agent.md    # Components, state, routing
- deployment-agent.md           # CI/CD, Docker, monitoring
```

## Using Agents

### Method 1: Direct Invocation (Recommended)

Simply ask Claude to use an agent:

```
"Use the Type Safety Agent to create Zod schemas for this form"

"Invoke the API Integration Specialist to design the user endpoints"

"Have the Test-First Developer write tests for this component"
```

Claude will:
1. Read the agent file
2. Adopt that persona and expertise
3. Complete the task following agent patterns
4. Reference examples from the agent file

### Method 2: Task Tool (Advanced)

For complex multi-step work, use the Task tool with agents:

```
Task tool:
- subagent_type: "general-purpose"
- prompt: "You are the [Agent Name] from .agents/[agent-file].md.
          [Detailed task description]..."
```

This launches a sub-agent that works independently and reports back.

### Method 3: Task Orchestrator

For really complex features, let the Task Orchestrator coordinate:

```
"Use the Task Orchestrator to implement user authentication"
```

The orchestrator will:
1. Break down the task
2. Identify which agents are needed
3. Sequence their work with dependencies
4. Coordinate execution

## Agent Collaboration Patterns

### Sequential Pattern
Agents work in order, each building on the previous:

```
1. Type Safety Agent → Define interfaces and schemas
2. API Design Agent → Create endpoints using those types
3. Testing Agent → Write tests for the API
4. Documentation Agent → Generate API docs
```

### Parallel Pattern
Independent agents work simultaneously:

```
Parallel:
- Database Agent → Design schema
- Frontend Agent → Build UI components
- DevOps Agent → Setup deployment

Then Sequential:
- Integration Agent → Connect frontend to backend
```

### Iterative Pattern
Agents collaborate back and forth:

```
1. Testing Agent → Write failing tests
2. Implementation Agent → Make tests pass
3. Testing Agent → Verify and add edge cases
4. Implementation Agent → Handle edge cases
5. Code Review Agent → Final quality check
```

## Best Practices

### Do's ✅
- **Keep agents focused** - One domain, deep expertise
- **Include examples** - Show actual code from your project
- **Update regularly** - As patterns evolve, update agents
- **Reference CLAUDE.md** - Agents should know project context
- **Test your agents** - Verify they give good advice

### Don'ts ❌
- **Don't create too many** - 3-7 agents is usually enough
- **Don't overlap domains** - Clear boundaries prevent confusion
- **Don't be too abstract** - Specific, actionable advice wins
- **Don't ignore project style** - Agents should match your conventions
- **Don't create agents for trivial tasks** - Use for complex domains only

## When to Create a New Agent

Create an agent when:
- ✅ You repeatedly need specialized expertise in an area
- ✅ There are complex patterns to follow consistently
- ✅ You want to capture team knowledge in a domain
- ✅ The domain has opinionated best practices
- ✅ New team members would benefit from guidance

Don't create an agent for:
- ❌ One-off tasks
- ❌ Simple, obvious operations
- ❌ Domains without clear patterns
- ❌ Areas where flexibility is more important than consistency

## Agent Template

Copy this template to create new agents:

```markdown
# [Agent Name]

## Identity
[2-3 sentences: Who is this agent? What role/persona?]

## Core Principles
1. **[Principle 1]** - [Explanation]
2. **[Principle 2]** - [Explanation]
3. **[Principle 3]** - [Explanation]

## Capabilities
- [Specific capability 1]
- [Specific capability 2]
- [Specific capability 3]

## Tech Stack
- [Technology 1] - [How it's used]
- [Technology 2] - [How it's used]
- [Framework/Tool] - [Version, purpose]

## Patterns & Examples

### [Pattern 1 Name]
\`\`\`[language]
// Example code showing the pattern
\`\`\`

### [Pattern 2 Name]
\`\`\`[language]
// Example code showing the pattern
\`\`\`

## Project-Specific Context
- File structure: [Where relevant code lives]
- Conventions: [Team standards to follow]
- Related files: [Key files to reference]

## Common Tasks
- **[Task type]**: [How to approach it]
- **[Task type]**: [How to approach it]

## Success Metrics
- ✅ [How to know you did well]
- ✅ [Quality indicator]
- ✅ [Success criteria]

## Common Pitfalls
- ❌ [Mistake to avoid]: [Why and what to do instead]
- ❌ [Mistake to avoid]: [Why and what to do instead]
```

## Starter Agents in This Repository

This repository includes a few minimal example agents to show the pattern:
- **`testing-agent.md`** - Testing patterns (customize for your framework)
- **`code-review-agent.md`** - Code review guidelines
- **`task-orchestrator.md`** - Multi-agent coordination

Use these as references when creating your own, or let the `/agents` command generate agents specific to your stack.

## Maintenance

### Keeping Agents Current
- Review agents quarterly
- Update when patterns change
- Remove outdated examples
- Add new capabilities as needed

### Version Control
- Commit agent changes with descriptive messages
- Document why patterns changed
- Link to discussions or decisions

### Team Collaboration
- Have team review new agents
- Collect feedback on agent effectiveness
- Update based on real usage

---

## Further Reading

- [Claude Code Documentation](https://docs.claude.com/claude-code)
- [Workflow Overview](../README.md)
- [Slash Commands Guide](../.claude/commands/)

## Contributing

Found a great agent pattern? Share it:
1. Create the agent following the template
2. Test it on real tasks
3. Add examples from your project
4. Submit a PR or share with your team

---

**Remember:** Agents are tools, not rules. Use them when they help, skip them when they don't. The goal is faster, better development—not ceremony for its own sake.
