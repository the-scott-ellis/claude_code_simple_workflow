# Claude Workflow - Complete Package Summary

A self-contained, team-ready workflow system for AI-assisted development with Claude Code.

## 📦 What's Included

### Core Workflow Files
- **README.md** - Main documentation
- **INSTALL.md** - Installation and setup guide
- **PACKAGE_SUMMARY.md** - This file

### Slash Commands (/.claude/commands/)
- **plan.md** - Phase 1: Requirements gathering
- **tasks.md** - Phase 2: Technical breakdown
- **start.md** - Phase 3: Implementation
- **status.md** - View all features
- **finish.md** - Archive completed work

### Templates (/templates/)
- **CLAUDE.md** - Full template for new projects
- **CLAUDE-workflow-section.md** - Append to existing CLAUDE.md
- Feature file templates

### Specialized Agents (/.agents/)
- **task-orchestrator.md** - Complex multi-step coordination
- **type-safety-agent.md** - TypeScript & Zod schemas
- **react-hooks-specialist.md** - Custom hooks & state
- **accessible-component-builder.md** - WCAG compliant components
- **test-first-developer.md** - Comprehensive testing
- **README.md** - Agent usage guide

### Helper Scripts (/scripts/)
- **init.sh** - Initialize workflow in project
- **status.sh** - Show all feature statuses
- **new-feature.sh** - Create feature file
- **start-work.sh** - Mark feature as active
- **finish-work.sh** - Archive to done/
- Other utility scripts

### Example Files (/features/, /done/)
- Example feature files at different stages
- Completed work examples

## 🚀 How It Works

### The Workflow
```
/plan → /tasks → /start → /finish
```

**Phase 1: `/plan`**
- Gather requirements
- Ask clarifying questions
- Define WHAT to build

**Phase 2: `/tasks`**
- Design technical approach
- Create task checklist
- Define HOW to build

**Phase 3: `/start`**
- Execute tasks
- Check off as you go
- Update with progress

**Finish: `/finish`**
- Verify completion
- Archive to done/

### Integration with Claude Code

**CLAUDE.md:**
- Auto-created or appended by init.sh
- Claude reads it every session
- Contains project context + workflow rules

**Sub-Agents:**
- Specialized expertise on demand
- Invoked during /tasks or /start phases
- Read CLAUDE.md for project context

**Feature Files:**
- Living documents that evolve
- Track requirements, tasks, and progress
- Easy to pick up where you left off

## 📊 Package Contents

- **20+ total files** (excluding examples)
- **5 slash commands**
- **5 specialized agents**
- **6+ helper scripts**
- **2+ CLAUDE.md templates**

## 🎯 Key Features

✅ **Enforced Structure** - Can't skip phases with slash commands
✅ **Language Agnostic** - Works with any tech stack
✅ **Session Continuity** - Easy to pick up where you left off
✅ **Team Standards** - Consistent workflow across projects
✅ **Merge-Friendly** - Works with existing CLAUDE.md
✅ **Self-Contained** - Everything in one package
✅ **Flexible** - Use only the parts you need

## 🏁 Quick Start

### Minimal Setup (No Installation)

```bash
mkdir -p dev/features dev/done
touch CLAUDE.md
```

Start working with Claude Code!

### Full Installation

```bash
cd your-project
git submodule add [workflow-repo-url] .claude-workflow
chmod +x .claude-workflow/scripts/*.sh
.claude-workflow/scripts/init.sh
```

### First Feature

```
/status
/plan my-first-feature
/tasks my-first-feature
/start my-first-feature
```

## 📚 Documentation

- **README.md** - Philosophy and overview
- **INSTALL.md** - Installation steps for various setups
- **.agents/README.md** - Agent usage guide
- Each slash command file - Detailed phase instructions

## 🔄 Typical Session

```
Day 1:
User: /plan auth-improvements
[Gather requirements, create plan]

User: /tasks auth-improvements
[Design approach, create task list]

User: /start auth-improvements
[Implement 5/8 tasks, session ends]

Day 2:
User: /status
[See: auth-improvements.active.md, 5/8 tasks done]

[Continue where left off, finish last 3 tasks]

User: /finish auth-improvements
[Archive to done/]
```

## 🎁 What Problems Does This Solve?

**vs Ad-Hoc Development:**
- ✅ Structured planning process
- ✅ Multi-session continuity
- ✅ Clear documentation trail

**vs Heavy Process (Spec Kit, etc.):**
- ✅ Way less ceremony
- ✅ No governance overhead
- ✅ More flexible and adaptable

**vs ai-dev-tasks:**
- ✅ Simpler (one file per feature)
- ✅ Slash commands enforce process
- ✅ Includes specialized sub-agents

**vs Natural Language Only:**
- ✅ Can't skip planning phases
- ✅ Consistent process across team
- ✅ Better context preservation

## 🛠 Customization

**For Your Team:**
1. Update templates/CLAUDE.md with your standards
2. Customize .agents/ with your patterns
3. Modify scripts for your validation needs
4. Add custom slash commands as needed

**Per Project:**
1. Fill in project-specific sections in CLAUDE.md
2. Document architectural decisions
3. Add custom agents for project-specific patterns
4. Tailor workflow to project needs

## 📈 Success Metrics

**You'll know it's working when:**
- Team consistently follows /plan → /tasks → /start
- New projects start with clear structure
- Feature files tell complete stories
- New team members can pick up work easily
- Multi-session work flows smoothly
- Less time spent context-switching

## 🤝 Team Adoption

### Onboarding

```
1. Show them the README.md
2. Walk through one /plan → /tasks → /start cycle
3. Point to .agents/ for specialized help
4. Remind: /status at every session start
5. Emphasize: only one .active.md at a time
```

### Team Handbook Entry

```markdown
## Feature Development Workflow

1. `/status` - See what's in progress
2. `/plan feature-name` - Gather requirements
3. `/tasks feature-name` - Break into tasks
4. `/start feature-name` - Begin implementation
5. `/finish feature-name` - Archive when done

**Best Practices:**
- Only one .active.md file at a time
- Update feature files as you work
- Use "For Next Session" section
- Never skip the planning phases
```

## 🚢 Publishing Your Customized Version

### As Git Submodule (Recommended)

```bash
# Host on GitHub (private or public)
git remote add origin git@github.com:your-org/claude-workflow.git
git push -u origin main

# Team members add to projects:
git submodule add git@github.com:your-org/claude-workflow.git .claude-workflow
```

### As Template Repository

Make this a template on GitHub so teams can fork and customize.

## 🎨 Supported Project Types

- **Node.js / TypeScript / React** - Full support with specialized agents
- **Python** - Full support, language-agnostic features
- **Go, Rust, Java, etc.** - Core workflow works everywhere
- **Any language** - File structure and principles are universal

## 🔧 Technical Notes

**File Structure:**
- Uses `.md` extensions with status suffixes (`.active.md`, `.backlog.md`, etc.)
- Git-friendly - status changes show in commits
- Easy to grep and search

**Slash Commands:**
- Must be in `.claude/commands/` at project root
- Written as markdown with instructions for Claude
- Easy to create custom commands

**Agents:**
- Markdown files with specialized instructions
- Can be invoked during any phase
- Read CLAUDE.md for project context

**Scripts:**
- Bash scripts for common operations
- Optional but convenient
- Can be customized for your needs

## 📞 Support

**Questions?**
- Check [README.md](README.md) for philosophy and overview
- See [INSTALL.md](INSTALL.md) for setup issues
- Read [.agents/README.md](.agents/README.md) for agent help
- Review example files in /features/ and /done/

**Bugs or Improvements?**
Open an issue on your workflow repository.

**Want to Contribute?**
Fork, customize, and share your improvements!

---

**License:** MIT - Adapt and use however works for you
**Maintained By:** Community
**Version:** 1.0.0
