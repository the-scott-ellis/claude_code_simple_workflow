# Installation Guide

How to add the Claude Workflow to your project.

## Prerequisites

- Git repository
- Your project code (any language/framework)
- Claude Code installed (VS Code extension or standalone)

## Quick Start (Minimal Setup)

The simplest way to use this workflow - no installation required:

```bash
# In your project root
mkdir -p dev/features dev/done
touch CLAUDE.md
```

That's it! Start working with Claude Code and manually create feature files as needed.

---

## Full Installation (Recommended)

For teams who want slash commands, scripts, and agents.

### Step 1: Add the Workflow

```bash
cd your-project

# Add as git submodule (recommended)
git submodule add https://github.com/the-scott-ellis/claude_code_simple_workflow.git .claude-workflow

# Or if not using submodules, clone directly:
# git clone https://github.com/the-scott-ellis/claude_code_simple_workflow.git .claude-workflow
```

### Step 2: Make Scripts Executable

```bash
chmod +x .claude-workflow/scripts/*.sh
```

### Step 3: Initialize

```bash
.claude-workflow/scripts/init.sh
```

This creates:
- `CLAUDE.md` - Pre-filled with detected project info + workflow instructions
- `dev/features/` - Empty, ready for new features
- `dev/done/` - For archived completed work

### Step 4: Customize CLAUDE.md

Edit `CLAUDE.md` to add:
- Project description and purpose
- Tech stack details
- Key architecture decisions
- Development conventions
- Current priorities
- Links to important documentation

### Step 5: Optional - Copy Slash Commands

If you want to use slash commands in Claude Code:

```bash
# Copy to your project root
cp -r .claude-workflow/.claude .
```

### Step 6: Start Building

You're ready! Open Claude Code and start:

```
"Let's plan out keyboard shortcuts for navigation"
```

Claude will:
1. Read `CLAUDE.md` for project context
2. Create `dev/features/keyboard-shortcuts.active.md`
3. Start implementing with full context

---

## Team Setup

If you're setting this up for a team:

### 1. Publish the Workflow

Host this repository privately or publicly:

```bash
# Create a new repo on GitHub
# Push this workflow to it
git remote add origin git@github.com:the-scott-ellis/claude_code_simple_workflow.git
git push -u origin main
```

### 2. Customize for Your Team

Update these files with your preferences:
- `templates/CLAUDE.md` - Your project template
- `scripts/validate-project.sh` - Your validation rules (if needed)
- `.agents/` - Customize or add team-specific agents

### 3. Document Your Process

Add to your team handbook:

> **Starting New Features**
>
> 1. Run `/status` to see current work
> 2. Plan with `/plan feature-name` (or create manually)
> 3. Break down with `/tasks feature-name`
> 4. Implement with `/start feature-name`
> 5. Archive with `/finish feature-name`

### 4. Share Examples

Create example projects showing the workflow in action. Team members can reference these.

---

## Installation for Different Project Types

### Node.js / JavaScript / TypeScript

```bash
cd your-project
git submodule add https://github.com/the-scott-ellis/claude_code_simple_workflow.git .claude-workflow
.claude-workflow/scripts/init.sh
```

The init script will detect your `package.json` and auto-fill tech stack info.

### Python

```bash
cd your-project
git submodule add https://github.com/the-scott-ellis/claude_code_simple_workflow.git .claude-workflow
.claude-workflow/scripts/init.sh
```

The init script will detect Python files and suggest Python-specific context.

### Other Languages

The workflow is language-agnostic. Just create the folder structure and CLAUDE.md manually:

```bash
mkdir -p dev/features dev/done
touch CLAUDE.md
```

Then fill in CLAUDE.md with your project's context.

---

## Updating the Workflow

To update the workflow in projects using it:

```bash
cd your-project/.claude-workflow
git pull origin main
cd ..
git add .claude-workflow
git commit -m "Update workflow to latest version"
```

Or if using submodules:
```bash
git submodule update --remote .claude-workflow
```

---

## Troubleshooting

### "Scripts not found or not executable"

Make sure scripts are executable:
```bash
chmod +x .claude-workflow/scripts/*.sh
```

### "Multiple .active.md files warning"

Only one feature should be active at a time:
```bash
# View current status
.claude-workflow/scripts/status.sh

# Rename extra active files back to .md
mv dev/features/feature-name.active.md dev/features/feature-name.md
```

### "Dev folder already exists"

The init script won't overwrite. Either:
- Remove existing `dev/` folder: `rm -rf dev/`
- Or manually create the structure
- Or skip init and use existing structure

### "Slash commands not working"

Make sure you've copied the `.claude/` folder to your project root:
```bash
cp -r .claude-workflow/.claude .
```

Claude Code looks for slash commands in `.claude/commands/` at the project root.

---

## Uninstalling

To remove the workflow from a project:

```bash
# If using submodule
git submodule deinit .claude-workflow
git rm .claude-workflow
rm -rf .git/modules/.claude-workflow

# If cloned directly
rm -rf .claude-workflow

# Optionally remove dev folder and CLAUDE.md
rm -rf dev/
rm CLAUDE.md

git commit -m "Remove claude-workflow"
```

Your code remains untouched - the workflow only adds documentation and scripts.

---

## Advanced Usage

### Using Only Parts of the Workflow

You can pick and choose what to use:

- **Just file structure**: Create `dev/features/` and `dev/done/` manually
- **Just CLAUDE.md**: Use the template without any other parts
- **Just scripts**: Use helper scripts without slash commands
- **Just agents**: Copy `.agents/` to your project for specialized help

Mix and match to fit your needs.

### Custom Slash Commands

Create your own slash commands in `.claude/commands/`:

```bash
touch .claude/commands/my-command.md
```

See existing commands for examples of format.

### Custom Agents

Add team-specific agents to `.agents/`:

```bash
touch .agents/my-custom-agent.md
```

Follow the format of existing agents.

---

## Support

Questions or issues? Check:
- [README.md](README.md) - Main documentation
- [templates/](templates/) - File templates
- [.agents/README.md](.agents/README.md) - Agent documentation

For bugs or feature requests, open an issue on the workflow repository.
