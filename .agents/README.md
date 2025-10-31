# AI Development Agents

Specialized AI agents for common development tasks. These agents work with the Claude Workflow to provide expert assistance in specific domains.

> **Note:** The agents included here are configured for React/TypeScript projects. They serve as examples and templates. Teams using other frameworks (Vue, Angular, Python, etc.) should create their own agents following similar patterns.

## Available Agents

### 1. **Task Orchestrator** (`task-orchestrator.md`)
Complex multi-step task management
- Breaks down large tasks into subtasks
- Routes work to appropriate agents
- Manages dependencies and sequencing
- Parallelizes work when possible

**Use when:** You have a complex feature with multiple components to coordinate

### 2. **Type Safety Agent** (`type-safety-agent.md`)
TypeScript and type safety specialist
- Eliminates `any` types
- Creates Zod schemas
- Defines database types
- Ensures strict type safety

**Use when:** You need TypeScript interfaces, Zod validation, or type definitions

### 3. **React Hooks Specialist** (`react-hooks-specialist.md`)
Custom React hooks and state management
- Form state persistence
- Keyboard event handling
- Browser API integration
- Focus management
- Performance optimization

**Use when:** You need custom hooks for state, effects, or browser APIs

### 4. **Accessible Component Builder** (`accessible-component-builder.md`)
WCAG 2.1 AA compliant component development
- Keyboard navigation patterns
- ARIA implementation
- Screen reader support
- Focus management
- Semantic HTML

**Use when:** Building UI components that must be fully accessible

### 5. **Test-First Developer** (`test-first-developer.md`)
Comprehensive testing (after implementation)
- Unit tests for components and hooks
- Integration tests for user flows
- Test coverage requirements
- Jest + React Testing Library

**Use when:** You need tests written for implemented features

## How to Use with Claude Workflow

### During `/tasks` Phase

Reference agents when designing technical approach:

```markdown
## Technical Approach

Will use React Hooks Specialist to create:
- useKeyboardShortcuts hook for event handling
- Platform detection (Mac/Windows)

Then Accessible Component Builder to ensure:
- Proper ARIA attributes
- Keyboard navigation compliant
```

### During `/start` Phase

Invoke agents as needed during implementation:

**Example 1: Create a custom hook**
```
"Invoke the React Hooks Specialist to create a useKeyboardShortcuts hook"

I'll read .agents/react-hooks-specialist.md and create the hook following those patterns.
```

**Example 2: Add TypeScript types**
```
"Use the Type Safety Agent to create Zod schemas for this form"

I'll read .agents/type-safety-agent.md and create type-safe validation.
```

**Example 3: Ensure accessibility**
```
"Invoke Accessible Component Builder to review keyboard navigation"

I'll read .agents/accessible-component-builder.md and audit against WCAG standards.
```

## Agent Collaboration Pattern

For complex features, use multiple agents in sequence:

1. **Type Safety Agent** - Define interfaces and types
2. **React Hooks Specialist** - Create state management hooks
3. **Accessible Component Builder** - Build the UI component
4. **Test-First Developer** - Write comprehensive tests

## Using with the Task Tool

You can also use Claude's Task tool to run agents independently:

```
Task tool:
- subagent_type: "general-purpose"
- prompt: "You are the React Hooks Specialist from .agents/react-hooks-specialist.md.
          Create a useKeyboardShortcuts hook with platform detection..."
```

## Quick Reference

| Task | Agent |
|------|-------|
| Complex multi-step coordination | Task Orchestrator |
| TypeScript types & Zod schemas | Type Safety Agent |
| Custom React hooks | React Hooks Specialist |
| Accessible UI components | Accessible Component Builder |
| Write tests | Test-First Developer |
| Keyboard event handling | React Hooks Specialist |
| ARIA implementation | Accessible Component Builder |
| Form state persistence | React Hooks Specialist |

## Customizing Agents

These agents are templates. Customize them for your project:

1. Update the tech stack section with your specifics
2. Add project-specific code patterns
3. Include examples from your codebase
4. Reference your project standards

## When to Invoke

**✅ Use agents when:**
- You need specialized expertise
- The task matches an agent's domain
- You want consistent patterns

**❌ Don't use agents for:**
- Simple, straightforward tasks
- Tasks outside their expertise
- When I can handle it directly

## Notes

- Agents read CLAUDE.md for project context
- They follow your project standards automatically
- They're designed to work together
- Update them as your patterns evolve

---

See individual agent files for detailed capabilities and examples.
