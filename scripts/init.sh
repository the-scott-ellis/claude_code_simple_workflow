#!/bin/bash
# Initializes the Claude Workflow in a new project

set -e

echo "🚀 Initializing Claude Workflow"
echo ""

# Get workflow path (handles both submodule and direct clone)
WORKFLOW_DIR=""
if [[ -d ".claude-workflow" ]]; then
  WORKFLOW_DIR=".claude-workflow"
elif [[ -d "claude-workflow" ]]; then
  WORKFLOW_DIR="claude-workflow"
else
  echo "❌ Error: Claude Workflow not found."
  echo "   Expected .claude-workflow/ or claude-workflow/ directory."
  exit 1
fi

# Check if workflow is already initialized
if [[ -d "dev" ]]; then
  echo "⚠️  Warning: /dev folder already exists."
  read -p "Continue and overwrite? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
  fi
fi

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p dev/features
mkdir -p dev/done

# Detect project info
PROJECT_NAME="my-project"
if [[ -f "package.json" ]]; then
  PROJECT_NAME=$(node -p "require('./package.json').name" 2>/dev/null || echo "my-project")
  echo "🔍 Detected Node.js project: $PROJECT_NAME"
elif [[ -f "pyproject.toml" ]]; then
  PROJECT_NAME=$(grep "^name = " pyproject.toml | cut -d'"' -f2 2>/dev/null || echo "my-project")
  echo "🔍 Detected Python project: $PROJECT_NAME"
elif [[ -f "Cargo.toml" ]]; then
  PROJECT_NAME=$(grep "^name = " Cargo.toml | cut -d'"' -f2 2>/dev/null || echo "my-project")
  echo "🔍 Detected Rust project: $PROJECT_NAME"
elif [[ -f "go.mod" ]]; then
  PROJECT_NAME=$(grep "^module " go.mod | awk '{print $2}' 2>/dev/null || echo "my-project")
  echo "🔍 Detected Go project: $PROJECT_NAME"
else
  PROJECT_NAME=$(basename "$PWD")
  echo "🔍 Using directory name: $PROJECT_NAME"
fi

echo ""

# Handle CLAUDE.md
if [[ -f "CLAUDE.md" ]]; then
  # Project already has CLAUDE.md - append workflow section
  echo "📝 Existing CLAUDE.md found - appending workflow section..."

  # Check if workflow section already exists
  if grep -q "## Claude Workflow System" CLAUDE.md; then
    echo "⚠️  Workflow section already exists in CLAUDE.md"
    echo "   Skipping to avoid duplicates."
  else
    cat "$WORKFLOW_DIR/templates/CLAUDE-workflow-section.md" >> CLAUDE.md
    echo "✅ Workflow section added to CLAUDE.md"
  fi
else
  # No CLAUDE.md - create from template
  echo "📝 Creating CLAUDE.md from template..."
  cp "$WORKFLOW_DIR/templates/CLAUDE.md" CLAUDE.md

  # Replace placeholder with actual project name
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/\[Project Name\]/$PROJECT_NAME/g" CLAUDE.md
  else
    # Linux
    sed -i "s/\[Project Name\]/$PROJECT_NAME/g" CLAUDE.md
  fi

  echo "✅ CLAUDE.md created"
  echo ""
  echo "⚠️  IMPORTANT: Edit CLAUDE.md and fill in [TODO] sections:"
  echo "   - Project description"
  echo "   - Tech stack details"
  echo "   - Architecture decisions"
  echo "   - Development conventions"
fi

echo ""

# Create initial foundation documentation
echo "📋 Creating foundation documentation template..."
cat > dev/done/project-foundation.md <<EOF
# Project Foundation

**Completed:** $(date +"%B %d, %Y")

## What Currently Exists

[TODO: Document the current state of the project]

### Core Features
- [ ] [Feature 1]
- [ ] [Feature 2]
- [ ] [Feature 3]

### Tech Stack
- **Language/Framework:** [TODO]
- **Database:** [TODO]
- **Key Libraries:** [TODO]

### Project Structure
[TODO: Brief overview of how the code is organized]

Example:
\`\`\`
src/
├── components/     # Reusable UI components
├── pages/          # Page-level components
├── lib/            # Utility functions and helpers
└── types/          # Type definitions
\`\`\`

### Authentication (if applicable)
- [ ] User authentication system
- [ ] Protected routes/endpoints
- [ ] Session management

### Key Components/Modules
[TODO: List main components or modules]

Example:
- LoginForm - Handles user authentication
- Dashboard - Main application interface
- DataService - API integration layer

## Known Gaps

Things to build next:
- [ ] [Feature idea 1]
- [ ] [Feature idea 2]

## Tech Debt

Areas that need attention:
- [ ] [Issue 1]
- [ ] [Refactoring needed]

## Environment Setup

[TODO: Document required environment variables and setup steps]

---

**Next Steps:**
1. Fill in the [TODO] sections above
2. Run \`/status\` to see workflow state
3. Start planning your first feature: \`/plan <feature-name>\`
EOF

# Create .gitignore entries (optional)
echo "🔒 Updating .gitignore..."
if [[ -f ".gitignore" ]]; then
  if ! grep -q "# Claude Workflow" .gitignore; then
    cat >> .gitignore <<EOF

# Claude Workflow (optional - remove # to track these files)
# dev/features/*.active.md
# dev/features/*.backlog.md
EOF
    echo "✅ Added workflow entries to .gitignore"
  else
    echo "   Workflow entries already in .gitignore"
  fi
else
  cat > .gitignore <<EOF
# Claude Workflow (optional - remove # to track these files)
# dev/features/*.active.md
# dev/features/*.backlog.md
EOF
  echo "✅ Created .gitignore with workflow entries"
fi

echo ""
echo "═══════════════════════════════════════"
echo "✅ Initialization Complete!"
echo "═══════════════════════════════════════"
echo ""
echo "📂 Created:"
echo "   - dev/features/ (empty, ready for new work)"
echo "   - dev/done/project-foundation.md (document current state)"
if [[ ! -f "CLAUDE.md" ]]; then
  echo "   - CLAUDE.md (fill in [TODO] sections)"
else
  echo "   - Added workflow to existing CLAUDE.md"
fi
echo ""
echo "📝 Next Steps:"
echo ""
echo "   1. Edit dev/done/project-foundation.md"
echo "      Document the current state of your project"
echo ""
if [[ ! -f "CLAUDE.md" ]]; then
  echo "   2. Edit CLAUDE.md"
  echo "      Fill in [TODO] sections with your project details"
  echo ""
fi
echo "   3. Start using the workflow with Claude Code:"
echo ""
echo "      /status                    # See current state"
echo "      /plan keyboard-shortcuts   # Plan a new feature"
echo "      /tasks keyboard-shortcuts  # Break into tasks"
echo "      /start keyboard-shortcuts  # Begin implementation"
echo ""
echo "🎉 Ready to build!"
