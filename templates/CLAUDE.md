# [Project Name] Development Guidelines

## Project Context
[TODO: Add 1-2 sentences describing what this application does]

## Development Workflow

We use the **Claude Workflow** system for structured feature development.

### 🔄 Workflow Commands

**IMPORTANT: At the start of EVERY session, run `/status` to see current work.**

Use these commands in order for each feature:

```
/plan <feature>    →  Gather requirements (ask questions, define WHAT)
/tasks <feature>   →  Create technical breakdown (define HOW, create task list)
/start <feature>   →  Begin implementation (execute tasks, update progress)
/finish <feature>  →  Archive completed work
/status            →  Show all features and their states
```

### Phase-by-Phase Rules

#### Phase 1: `/plan` (Requirements Only)
- **Purpose:** Understand WHAT to build
- **Your job:** Ask clarifying questions until requirements are crystal clear
- **Output:** Feature file with Goal, Requirements, Success Criteria
- **❌ DO NOT:** Write code, create tasks, or define technical approach

#### Phase 2: `/tasks` (Technical Breakdown)
- **Purpose:** Define HOW to build it
- **Your job:** Design architecture, break into specific tasks
- **Output:** Technical Approach + detailed task checklist
- **❌ DO NOT:** Start implementation yet

#### Phase 3: `/start` (Implementation)
- **Purpose:** Build the feature
- **Your job:** Execute tasks, check them off, update progress
- **Output:** Working code, tests, documentation
- **✅ DO:** Update the .active.md file as you work

### Workflow Enforcement

**❌ NEVER skip phases:**
- Don't jump to code without `/tasks`
- Don't create tasks without `/plan`
- Don't start multiple features (only ONE `.active.md` at a time)

**✅ ALWAYS:**
- Run `/status` at session start
- Update feature files as you work
- Check off tasks when complete
- Ask before deviating from the plan

## Tech Stack

### Frontend
- React 18 with TypeScript (strict mode)
- Tailwind CSS for styling
- Vite for build tooling
- React Router for navigation

### Forms & Validation
- React Hook Form
- Zod schemas

### Backend
[TODO: Add your backend details - Supabase, Firebase, custom API, etc.]

### Testing
- Jest + React Testing Library
- 80% coverage minimum
- Tests written after implementation (not strict TDD)

## Project Standards

### TypeScript
- Strict mode enabled
- No `any` without justification
- Prefer type inference where clear

### Testing
- Co-locate unit tests: `Component.test.tsx`
- Integration tests: `src/__tests__/`
- Use test utilities from `src/test-utils/`

### Accessibility
- All features keyboard accessible
- Semantic HTML
- ARIA labels where needed
- Test with screen readers for complex interactions

### Git Commits
- Semantic format: `feat:`, `fix:`, `refactor:`, `test:`, `docs:`
- Include Claude attribution:
  ```
  🤖 Generated with Claude Code
  Co-Authored-By: Claude <noreply@anthropic.com>
  ```

### Code Quality Checklist
Before committing:
- [ ] TypeScript compiles without errors
- [ ] Tests pass (if written)
- [ ] Linter passes
- [ ] Feature works in isolation
- [ ] Keyboard navigation tested
- [ ] Error states handled

## Key Files & Patterns

### Authentication
[TODO: Document your auth setup]
- Auth hook: `src/hooks/useAuth.ts` (if exists)
- Protected routes: `src/components/ProtectedRoute.tsx` (if exists)

### Forms Pattern
```typescript
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';

const schema = z.object({
  name: z.string().min(1, 'Required'),
});

type FormData = z.infer<typeof schema>;

const { register, handleSubmit, formState: { errors } } = useForm<FormData>({
  resolver: zodResolver(schema),
});
```

### Testing Utilities
```typescript
import { render, pressTab, expectFocused } from '../test-utils';

// Renders with all providers (Auth, Router, Theme, etc.)
render(<MyComponent />);

// Keyboard testing
pressTab();
expectFocused(screen.getByRole('button'));
```

### State Management
- Local state: `useState`
- Form state: React Hook Form
- Global state: React Context
- [TODO: Add your state management approach]

## Specialized Sub-Agents

Available in `.claude-workflow/.agents/` (or `claude-workflow/.agents/`):

- **Task Orchestrator** - Complex multi-step task coordination
- **Type Safety Agent** - TypeScript types and Zod schemas
- **React Hooks Specialist** - Custom hooks and state management
- **Accessible Component Builder** - WCAG compliant components
- **Test-First Developer** - Comprehensive testing

**Usage:**
```
"Invoke the React Hooks Specialist to create a useKeyboardShortcuts hook"
"Use Type Safety Agent to add Zod schemas for this form"
```

See `.claude-workflow/.agents/README.md` for details.

## Common Commands

```bash
# Development
npm run dev          # Start dev server
npm test            # Run tests
npm run test:watch  # Tests in watch mode
npm run test:coverage # Coverage report

# Quality checks
npm run lint        # ESLint
npm run typecheck   # TypeScript
```

## Environment Variables

Required in `.env.local`:
```
[TODO: List your environment variables]
```

## Project Structure

```
/src
  /components      # Reusable UI components
  /pages          # Route pages
  /hooks          # Custom React hooks
  /contexts       # React Context providers (if used)
  /lib            # External library configs
  /types          # TypeScript definitions
  /utils          # Utility functions
  /test-utils     # Testing helpers
  /__tests__      # Integration tests

/dev              # Claude Workflow files (don't commit .active.md files)
  /features       # Feature planning and tracking
  /done           # Archived completed features
```

## Decision Log

Major decisions and their rationale:

| Date | Decision | Rationale |
|------|----------|-----------|
| [Date] | [Decision made] | [Why this choice?] |

---

**Remember:**
- Start every session with `/status`
- Follow the phases: `/plan` → `/tasks` → `/start` → `/finish`
- Update feature files as you work
- Only one `.active.md` at a time

<!-- MANUAL ADDITIONS START -->
<!-- Add any project-specific notes below this line -->

<!-- MANUAL ADDITIONS END -->
