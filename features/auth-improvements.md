# Auth Improvements - Remember Me & Session Handling

**Goal:** Add "Remember Me" checkbox to login form and improve session refresh token handling

**Priority:** High | **Effort:** Medium (~4 hours) | **Planned:** Jan 14, 2025

## Plan

- [ ] Research Supabase session persistence options
- [ ] Add "Remember Me" checkbox to LoginForm component
- [ ] Update useAuth hook to handle persistent sessions
- [ ] Implement refresh token rotation
- [ ] Add session timeout handling with user notification
- [ ] Update tests for new auth behavior
- [ ] Test across browser restarts and different devices
- [ ] Update auth documentation

## Context

### Current Behavior
- Users are logged out when they close the browser
- No option to stay logged in
- Refresh tokens expire after 7 days (Supabase default)
- No user notification when session expires

### Desired Behavior
- Default: Session ends when browser closes (current)
- With "Remember Me": Session persists for 30 days
- Graceful session expiry with notification
- Auto-refresh tokens in background when user is active

## Technical Approach

### Supabase Session Storage
Supabase supports two storage modes:
- `localStorage` - Persists across browser restarts
- `sessionStorage` - Cleared when browser closes

We'll default to `sessionStorage` and switch to `localStorage` when "Remember Me" is checked.

### Files to Modify
- `src/components/LoginForm.tsx` - Add checkbox
- `src/hooks/useAuth.ts` - Update session handling
- `src/lib/supabase.ts` - Make storage configurable
- `src/hooks/useAuth.test.ts` - Update tests

### Edge Cases
- User has "Remember Me" but manually logs out → Clear localStorage
- Session expires while user is active → Show toast, redirect to login
- User switches devices → Each device has its own session
- Security: Still enforce max session length (30 days)

## Open Questions

- Should we add "Log out from all devices" functionality?
- Do we want to show "Last login" timestamp in settings?
- Should we send email notification on new login from unknown device?

## Related Files
- Current auth hook: `src/hooks/useAuth.ts`
- Supabase client: `src/lib/supabase.ts`
- Login form: `src/components/LoginForm.tsx`
- Protected route: `src/components/ProtectedRoute.tsx`

## Dependencies
None - ready to start when prioritized.

## Acceptance Criteria
- [ ] "Remember Me" checkbox appears on login form
- [ ] Checking it persists session across browser restarts
- [ ] Not checking it clears session on browser close
- [ ] User sees notification when session expires
- [ ] All existing auth tests still pass
- [ ] New tests cover remember me functionality
- [ ] Works on Chrome, Firefox, Safari
