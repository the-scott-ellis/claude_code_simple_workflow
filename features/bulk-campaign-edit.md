# Bulk Campaign Editing

**Goal:** Allow users to select multiple campaigns and edit shared properties in one action

**Priority:** Medium | **Effort:** Large (~8 hours) | **Planned:** Jan 12, 2025

## User Story

As a campaign manager with 50+ campaigns, I want to select multiple campaigns and update their status/budget/tags in bulk, so I don't have to edit them one by one.

## Plan

- [ ] Research existing campaign table structure
- [ ] Design bulk edit UX (checkbox selection pattern)
- [ ] Implement checkbox selection in CampaignTable
- [ ] Create BulkEditModal component
- [ ] Implement bulk update API endpoint
- [ ] Add optimistic updates with rollback
- [ ] Handle partial failures gracefully
- [ ] Add keyboard shortcuts for select all/none
- [ ] Write comprehensive tests
- [ ] Update documentation

## Proposed UX

### Selection
- Checkbox column in campaign table
- "Select All" checkbox in header
- Selected count badge: "3 campaigns selected"
- Keyboard: `Cmd+A` to select all visible

### Bulk Actions Bar
Appears when 2+ campaigns selected:
```
[3 selected] Edit Properties | Change Status | Add Tags | Delete [x]
```

### Bulk Edit Modal
Shows only properties that can be bulk edited:
- Status (Active/Paused/Archived)
- Budget
- Tags (add/remove)
- Ad Account
- Notes

Fields show:
- "Keep existing" (default)
- Or new value to apply to all

## Technical Considerations

### State Management
```typescript
const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
```

### API Design
```typescript
// Edge Function: bulk-update-campaigns
POST /api/campaigns/bulk-update
{
  campaignIds: string[],
  updates: {
    status?: 'active' | 'paused',
    budget?: number,
    tags?: { add: string[], remove: string[] }
  }
}
```

### Error Handling
If some campaigns fail:
- Show summary: "2 of 5 campaigns updated"
- List which ones failed and why
- Option to retry failed ones

### Permissions
- User can only bulk edit campaigns they have access to
- RLS policies automatically filter
- UI should handle partial access gracefully

## Open Questions

- Should we support bulk edit across multiple ad accounts?
- What's the max number of campaigns we allow in one bulk operation?
- Do we want "undo" functionality for bulk operations?
- Should we log bulk edits differently in audit log?

## Files to Create/Modify
- `src/components/CampaignTable.tsx` - Add selection UI
- `src/components/BulkEditModal.tsx` - New component
- `src/hooks/useBulkUpdateCampaigns.ts` - New hook
- `supabase/functions/bulk-update-campaigns/` - New Edge Function
- Update table tests
- Add integration tests for bulk operations

## Dependencies
None - this is a new feature

## Out of Scope (Future Enhancements)
- Bulk duplicate campaigns
- Bulk export to CSV
- Scheduled bulk operations
- Bulk edit history/undo

## Design References
Look at similar patterns in:
- Gmail (bulk select emails)
- Asana (multi-task edit)
- Notion (multi-page operations)

## Acceptance Criteria
- [ ] Can select multiple campaigns via checkbox
- [ ] Bulk edit modal shows appropriate fields
- [ ] Updates apply to all selected campaigns
- [ ] Partial failures are handled gracefully
- [ ] Optimistic updates with rollback on error
- [ ] Works with keyboard shortcuts
- [ ] All tests passing
- [ ] 80% test coverage maintained
