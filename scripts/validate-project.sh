#!/bin/bash
# Template for validating that a project follows team standards
#
# NOTE: This is a TEMPLATE configured for React/TypeScript/Vite/Supabase projects
# Customize the checks below for your own tech stack and team standards
#
# Examples of what to customize:
# - Change dependency checks to match your stack (React → Vue, Supabase → Firebase, etc.)
# - Update folder structure checks to match your conventions
# - Modify configuration file checks for your build tools
# - Add/remove checks based on your team's requirements

set -e

echo "🔍 Validating project setup..."
echo ""

ERRORS=0
WARNINGS=0

# Color codes
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Helper functions
check_required() {
  local name=$1
  local check=$2

  echo -n "Checking $name... "
  if eval "$check"; then
    echo -e "${GREEN}✓${NC}"
    return 0
  else
    echo -e "${RED}✗ Missing${NC}"
    ERRORS=$((ERRORS + 1))
    return 1
  fi
}

check_optional() {
  local name=$1
  local check=$2

  echo -n "Checking $name... "
  if eval "$check"; then
    echo -e "${GREEN}✓${NC}"
    return 0
  else
    echo -e "${YELLOW}⚠ Missing (recommended)${NC}"
    WARNINGS=$((WARNINGS + 1))
    return 1
  fi
}

# Check if we're in a valid project directory
if [[ ! -f "package.json" ]]; then
  echo -e "${YELLOW}Note: package.json not found.${NC}"
  echo "This validation script is configured for Node.js projects."
  echo "Customize this script for your tech stack or skip validation."
  exit 0
fi

echo "📦 Required Dependencies"
echo "─────────────────────────"

# Production dependencies (customize these for your stack)
check_required "react-hook-form" "grep -q '\"react-hook-form\"' package.json"
check_required "@hookform/resolvers" "grep -q '\"@hookform/resolvers\"' package.json"
check_required "zod" "grep -q '\"zod\"' package.json"
check_required "react-router-dom" "grep -q '\"react-router-dom\"' package.json"

# Optional - you can comment out or change these based on your backend
check_optional "@supabase/supabase-js" "grep -q '\"@supabase/supabase-js\"' package.json"
check_optional "lucide-react" "grep -q '\"lucide-react\"' package.json"
check_optional "sonner" "grep -q '\"sonner\"' package.json"

echo ""
echo "🧪 Testing Dependencies"
echo "─────────────────────────"

# Testing dependencies
check_optional "jest" "grep -q '\"jest\"' package.json"
check_optional "@testing-library/react" "grep -q '\"@testing-library/react\"' package.json"
check_optional "@testing-library/jest-dom" "grep -q '\"@testing-library/jest-dom\"' package.json"
check_optional "@testing-library/user-event" "grep -q '\"@testing-library/user-event\"' package.json"
check_optional "jest-environment-jsdom" "grep -q '\"jest-environment-jsdom\"' package.json"
check_optional "ts-jest" "grep -q '\"ts-jest\"' package.json"

echo ""
echo "📁 Project Structure"
echo "─────────────────────────"

# Check folder structure (customize for your project conventions)
check_required "/src folder" "[[ -d 'src' ]]"
check_optional "/src/components" "[[ -d 'src/components' ]]"
check_optional "/src/pages" "[[ -d 'src/pages' ]]"
check_optional "/src/hooks" "[[ -d 'src/hooks' ]]"
check_optional "/src/lib" "[[ -d 'src/lib' ]]"
check_optional "/src/types" "[[ -d 'src/types' ]]"
check_optional "/src/utils" "[[ -d 'src/utils' ]]"

check_optional "/src/test-utils" "[[ -d 'src/test-utils' ]]"
check_optional "/src/__tests__" "[[ -d 'src/__tests__' ]]"
check_optional "/src/contexts" "[[ -d 'src/contexts' ]]"

echo ""
echo "⚙️  Configuration Files"
echo "─────────────────────────"

# Check config files (customize for your build tools)
check_required "tsconfig.json" "[[ -f 'tsconfig.json' ]]"
check_optional "vite.config.ts" "[[ -f 'vite.config.ts' ]] || [[ -f 'vite.config.js' ]]"
check_optional "tailwind.config.js" "[[ -f 'tailwind.config.js' ]] || [[ -f 'tailwind.config.ts' ]]"

check_optional "jest.config.js" "[[ -f 'jest.config.js' ]] || [[ -f 'jest.config.ts' ]]"
check_optional ".env.local" "[[ -f '.env.local' ]] || [[ -f '.env' ]]"
check_optional "setupTests.ts" "[[ -f 'src/setupTests.ts' ]]"

echo ""
echo "🔧 TypeScript Configuration"
echo "─────────────────────────"

# Check TypeScript settings
if [[ -f "tsconfig.app.json" ]]; then
  check_required "strict mode" "grep -q '\"strict\": true' tsconfig.app.json"
  check_optional "noUnusedLocals" "grep -q '\"noUnusedLocals\": true' tsconfig.app.json"
  check_optional "noUnusedParameters" "grep -q '\"noUnusedParameters\": true' tsconfig.app.json"
elif [[ -f "tsconfig.json" ]]; then
  check_required "strict mode" "grep -q '\"strict\": true' tsconfig.json"
  check_optional "noUnusedLocals" "grep -q '\"noUnusedLocals\": true' tsconfig.json"
  check_optional "noUnusedParameters" "grep -q '\"noUnusedParameters\": true' tsconfig.json"
fi

echo ""
echo "📝 Scripts"
echo "─────────────────────────"

# Check package.json scripts
check_required "dev script" "grep -q '\"dev\":' package.json"
check_required "build script" "grep -q '\"build\":' package.json"
check_optional "test script" "grep -q '\"test\":' package.json"
check_optional "test:watch script" "grep -q '\"test:watch\":' package.json"
check_optional "test:coverage script" "grep -q '\"test:coverage\":' package.json"
check_optional "typecheck script" "grep -q '\"typecheck\":' package.json"
check_optional "lint script" "grep -q '\"lint\":' package.json"

echo ""
echo "═════════════════════════"
echo "📊 Validation Summary"
echo "═════════════════════════"

if [[ $ERRORS -eq 0 ]] && [[ $WARNINGS -eq 0 ]]; then
  echo -e "${GREEN}✅ Perfect! All checks passed.${NC}"
  echo ""
  echo "Your project meets all team standards."
  echo "Next steps:"
  echo "  1. Run: npm install"
  echo "  2. Set up environment variables (if needed)"
  echo "  3. Initialize workflow: .claude-workflow/scripts/init.sh"
  exit 0
elif [[ $ERRORS -eq 0 ]]; then
  echo -e "${GREEN}✅ All required checks passed!${NC}"
  echo -e "${YELLOW}⚠️  $WARNINGS optional items missing (recommended but not required)${NC}"
  echo ""
  echo "Your project meets minimum standards."
  echo "Consider adding the optional items above for better DX."
  echo ""
  echo "Next steps:"
  echo "  1. Run: npm install"
  echo "  2. Set up environment variables (if needed)"
  echo "  3. Initialize workflow: .claude-workflow/scripts/init.sh"
  exit 0
else
  echo -e "${RED}❌ $ERRORS required items missing${NC}"
  echo -e "${YELLOW}⚠️  $WARNINGS optional items missing${NC}"
  echo ""
  echo "Install missing dependencies:"
  echo ""
  echo "  npm install react-hook-form @hookform/resolvers zod react-router-dom"
  echo ""
  echo "  npm install -D jest @testing-library/react @testing-library/jest-dom \\"
  echo "    @testing-library/user-event jest-environment-jsdom ts-jest \\"
  echo "    @types/jest"
  echo ""
  echo "Create missing folders:"
  echo ""
  echo "  mkdir -p src/components src/pages src/hooks src/lib src/types src/utils"
  echo ""
  echo "After fixing issues, run this script again."
  exit 1
fi
