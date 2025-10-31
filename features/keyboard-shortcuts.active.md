# Keyboard Navigation Enhancement

**Goal:** Add Cmd+1/2/3/4 shortcuts to jump between main app sections (Dashboard, Teams, Campaigns, Settings)

**Priority:** High | **Effort:** Small (~2 hours) | **Started:** Jan 16, 2025 | **Session:** 2

## Plan

- [x] Research current routing structure and navigation patterns
- [x] Design keyboard shortcut mappings
- [x] Implement useKeyboardShortcuts hook with platform detection
- [x] Add unit tests for the hook
- [ ] Integrate hook into MainLayout component
- [ ] Wire up shortcuts to React Router navigation
- [ ] Add visual feedback for shortcuts (toast notifications)
- [ ] Test keyboard shortcuts in browser
- [ ] Add documentation to README

## Current State

**Hook is complete and tested.** Located at `src/hooks/useKeyboardShortcuts.ts`.

Today (Jan 16, Session 2) we're integrating it into the MainLayout component. Need to:
1. Import the hook
2. Define shortcut config with navigate() callbacks
3. Test in browser that Cmd+1 → Dashboard, Cmd+2 → Teams, etc.

## Technical Details

### Hook API
```typescript
useKeyboardShortcuts({
  shortcuts: [
    { key: '1', modifiers: ['meta'], action: () => navigate('/dashboard') },
    { key: '2', modifiers: ['meta'], action: () => navigate('/teams') },
    // ...
  ]
});
```

### Platform Detection
- Mac: Uses `meta` (Cmd key)
- Windows/Linux: Uses `ctrl` key
- Automatically detects via `navigator.platform`

### Accessibility Considerations
- Shortcuts should not conflict with browser defaults
- Add `aria-keyshortcuts` attributes to nav links
- Consider adding a "Keyboard Shortcuts" help modal (future enhancement)

## Session History

### Jan 15, 2025 - Session 1
**Duration:** ~45 minutes

- Researched existing navigation in MainLayout.tsx and App.tsx
- Decided on Cmd+1/2/3/4 mapping for main sections
- Built `useKeyboardShortcuts` hook from scratch
- Added platform detection (Mac vs Windows)
- Added `preventDefault()` to avoid browser conflicts
- Wrote unit tests with React Testing Library
- All tests passing ✓

**Files created:**
- `src/hooks/useKeyboardShortcuts.ts`
- `src/hooks/useKeyboardShortcuts.test.ts`

### Jan 16, 2025 - Session 2 (Current)
**In Progress...**

- Starting MainLayout integration
- Will update this section as we progress

## For Next Session

If we don't finish today:

**What's done:** The hook is fully implemented and tested. It's ready to use.

**What's next:** Import into `src/components/MainLayout.tsx` and wire up the shortcuts:

```typescript
import { useKeyboardShortcuts } from '../hooks/useKeyboardShortcuts';
import { useNavigate } from 'react-router-dom';

const navigate = useNavigate();

useKeyboardShortcuts({
  shortcuts: [
    { key: '1', modifiers: ['meta'], action: () => navigate('/dashboard') },
    { key: '2', modifiers: ['meta'], action: () => navigate('/teams') },
    { key: '3', modifiers: ['meta'], action: () => navigate('/campaigns') },
    { key: '4', modifiers: ['meta'], action: () => navigate('/settings') },
  ]
});
```

Then test in browser that navigation actually works.

## Blockers

None currently.

## Future Enhancements

- Add a keyboard shortcuts help modal (Cmd+?)
- Add toast notifications when shortcuts are triggered
- Consider adding shortcuts for common actions (Cmd+N for new campaign, etc.)
- Add shortcuts to help documentation
