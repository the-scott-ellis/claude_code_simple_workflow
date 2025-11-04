# /agents Command

**Purpose:** Analyze your project and generate custom development agents tailored to your tech stack.

## Overview

This command helps you bootstrap a set of specialized AI agents for your project. Instead of starting from scratch, Claude analyzes your codebase, identifies your tech stack, and proposes agents that will be most useful for your specific development workflow.

## What This Command Does

1. **Analyzes Project Structure**
   - Scans root directory for package managers and config files
   - Identifies programming languages and frameworks
   - Detects testing frameworks and build tools
   - Examines existing code patterns

2. **Proposes Relevant Agents**
   - Suggests 3-5 agents based on your stack
   - Explains what each agent will do
   - Shows example use cases for your project

3. **Generates Agent Files**
   - Creates customized agent markdown files
   - Includes project-specific examples
   - References your actual file structure
   - Follows your coding conventions

4. **Provides Usage Guidance**
   - Shows how to invoke each agent
   - Suggests when to use which agent
   - Explains agent collaboration patterns

## Usage

```bash
/agents
```

That's it! Claude will handle the rest.

## What Agents Look Like

Agents are markdown files in `.agents/` that define:
- **Identity**: The agent's role and expertise
- **Core Principles**: Fundamental approaches they follow
- **Capabilities**: What tasks they handle
- **Tech Stack**: Specific tools and frameworks
- **Patterns & Examples**: Code patterns and solutions
- **Success Metrics**: How to measure quality

## Example Output

After running `/agents`, you might get:

### For a React/TypeScript Project:
```
Proposed Agents:

1. **type-safety-agent.md**
   - Eliminates `any` types
   - Creates Zod schemas
   - Ensures strict TypeScript

2. **react-patterns-agent.md**
   - Custom hooks
   - Component patterns
   - State management

3. **testing-agent.md**
   - Jest + React Testing Library
   - Component tests
   - Integration tests

4. **api-integration-agent.md**
   - REST API patterns
   - Error handling
   - Data fetching
```

### For a Python/Django Backend:
```
Proposed Agents:

1. **django-patterns-agent.md**
   - Views, models, serializers
   - Django ORM patterns
   - Migrations

2. **api-design-agent.md**
   - DRF best practices
   - Endpoint design
   - Versioning

3. **python-testing-agent.md**
   - pytest patterns
   - Fixtures and mocking
   - Test organization

4. **database-agent.md**
   - PostgreSQL optimization
   - Query patterns
   - Indexing strategies
```

## Command Flow

### Step 1: Analysis
Claude examines your project:
```
Analyzing project structure...
✓ Found package.json - Node.js project
✓ Detected TypeScript, React, Vite
✓ Testing: Jest + React Testing Library
✓ Database: Supabase
✓ Forms: React Hook Form + Zod
```

### Step 2: Proposal
Claude suggests agents:
```
Based on your stack, I recommend these agents:

1. Type Safety Agent
   Why: You're using TypeScript + Zod extensively
   Use for: Defining types, creating schemas, fixing `any` types

2. React Patterns Agent
   Why: React + custom hooks pattern detected
   Use for: Building components, creating hooks, state management

3. Testing Agent
   Why: Jest + RTL configured
   Use for: Writing unit tests, integration tests, coverage

4. API Integration Agent
   Why: Supabase client usage detected
   Use for: Data fetching, error handling, caching

Would you like me to create these agents? (yes/no/modify)
```

### Step 3: Customization (Optional)
You can modify the proposal:
```
User: "Skip the testing agent, add an accessibility agent instead"

Claude: Updated proposal:
1. Type Safety Agent
2. React Patterns Agent
3. API Integration Agent
4. Accessibility Agent - WCAG, ARIA, keyboard navigation

Proceeding to generate...
```

### Step 4: Generation
Claude creates the agent files:
```
Creating agents...
✓ .agents/type-safety-agent.md
✓ .agents/react-patterns-agent.md
✓ .agents/api-integration-agent.md
✓ .agents/accessibility-agent.md

Done! Your agents are ready to use.
```

### Step 5: Usage Examples
Claude shows you how to use them:
```
Example usage:

"Use the Type Safety Agent to define types for my user profile form"
"Have the React Patterns Agent create a useAuth hook"
"Ask the API Integration Agent to handle error states for this query"
"Invoke the Accessibility Agent to review keyboard navigation"
```

## Project Detection Logic

### Node.js / JavaScript / TypeScript
**Detected by:** `package.json`, `tsconfig.json`, `.js`/`.ts` files

**Common agents proposed:**
- Type Safety (if TypeScript)
- Framework-specific (React/Vue/Angular/Svelte)
- Testing (Jest/Vitest/Playwright)
- API Integration
- Build/Tooling

### Python
**Detected by:** `requirements.txt`, `pyproject.toml`, `setup.py`, `.py` files

**Common agents proposed:**
- Python Patterns
- Framework-specific (Django/Flask/FastAPI)
- Testing (pytest)
- Database (SQLAlchemy/Django ORM)
- API Design

### Go
**Detected by:** `go.mod`, `go.sum`, `.go` files

**Common agents proposed:**
- Go Idioms & Patterns
- Testing (table tests, mocks)
- API/gRPC Design
- Concurrency Patterns
- Performance

### Ruby
**Detected by:** `Gemfile`, `.rb` files

**Common agents proposed:**
- Rails Patterns (if Rails detected)
- RSpec Testing
- Database (ActiveRecord)
- API Design

### Rust
**Detected by:** `Cargo.toml`, `.rs` files

**Common agents proposed:**
- Rust Patterns & Idioms
- Error Handling
- Testing
- Performance & Safety
- Async Patterns

## Agent Naming Conventions

Agents will be named based on their purpose:
- `[domain]-agent.md` - Generic pattern
- `[framework]-patterns-agent.md` - Framework-specific
- `testing-agent.md` - Testing specialist
- `database-agent.md` - Data layer specialist
- `api-[design|integration]-agent.md` - API work
- `[specialty]-specialist.md` - Focused experts

## Customization

You can always:
- **Modify generated agents** - Edit the files to match your exact needs
- **Add more agents** - Create additional ones using the template in `.agents/README.md`
- **Remove agents** - Delete agents you don't need
- **Re-run `/agents`** - Generate fresh agents as your project evolves

## Best Practices

### Do:
- ✅ Run `/agents` early in project setup
- ✅ Review and customize generated agents
- ✅ Update agents as patterns evolve
- ✅ Keep agents focused (one domain each)
- ✅ Include real examples from your codebase

### Don't:
- ❌ Create too many agents (3-7 is ideal)
- ❌ Make agents too generic
- ❌ Forget to update as project changes
- ❌ Overlap agent responsibilities
- ❌ Create agents for trivial tasks

## Re-running the Command

You can run `/agents` multiple times:

**First time:** Creates initial agent set
**Later:**
- Option to regenerate existing agents
- Add new agents for new domains
- Update agents with new patterns

Claude will ask: "I see you already have agents. Would you like to: (1) Add more agents (2) Regenerate existing (3) Cancel"

## Integration with Workflow

Agents work seamlessly with the workflow:

### During `/plan`
Reference which agents will be needed:
```markdown
## Technical Approach
Will use React Patterns Agent for components and Testing Agent for coverage
```

### During `/tasks`
Assign tasks to specific agents:
```markdown
## Tasks
- [ ] Type Safety Agent: Define form types
- [ ] React Patterns Agent: Create custom hooks
- [ ] Testing Agent: Write component tests
```

### During `/start`
Invoke agents as you work:
```
"Invoke the Type Safety Agent to handle this"
"Use the Testing Agent to write tests"
```

## Troubleshooting

**Q: What if my stack isn't detected?**
A: Manually specify: `/agents --stack typescript,react,supabase`

**Q: Can I request specific agents?**
A: Yes! "Generate a testing agent and API design agent"

**Q: What if I don't like the proposed agents?**
A: Say "no" and describe what you want instead

**Q: Can I edit agents after generation?**
A: Absolutely! They're just markdown files. Edit freely.

**Q: How do I know which agent to use?**
A: Each agent file includes clear "Use when" guidance

## Examples

### Minimal Usage
```
User: /agents
Claude: [analyzes, proposes, generates]
User: Yes, create those
Claude: [creates agents]
```

### With Customization
```
User: /agents
Claude: I propose: Type Safety, React Patterns, Testing, API
User: Skip testing, add accessibility instead
Claude: [updates proposal]
User: Perfect, create them
Claude: [creates customized agents]
```

### Targeted Request
```
User: /agents
User context: "Focus on backend APIs and database patterns"
Claude: [proposes backend-focused agents only]
```

## What Happens After

Once agents are created:
1. They're immediately available for use
2. They appear in `.agents/` directory
3. The Task Orchestrator can coordinate them
4. You can invoke them in any Claude Code session

Start using them right away:
```
"Use the [Agent Name] to help with [task]"
```

---

**Ready to create your agents? Run `/agents` now!**
