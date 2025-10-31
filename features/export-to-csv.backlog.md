# Export Campaigns to CSV

**Goal:** Allow users to export campaign data to CSV format for external analysis

**Priority:** Low | **Effort:** Small (~3 hours)

## Rough Idea

Users want to analyze campaign data in Excel/Google Sheets. Add an "Export" button that downloads current view as CSV.

## Initial Thoughts

- Button next to search/filter controls
- Export respects current filters/sorting
- Include all visible columns
- Maybe offer "Export All" vs "Export Selected"
- Use library like `papaparse` or native CSV generation

## Questions to Answer
- What columns do we include?
- Do we export related data (ad sets, ads)?
- What's the file naming convention?
- Do we need export history/logs?
- Should we limit export size?

## Why Backlog
Not urgent. Users can copy/paste from table for now. Need to validate demand before building.

## Related
- Could expand to PDF export later
- Might want scheduled exports eventually
- Consider building generic "export" system for reuse

---

_This is a rough idea. Will flesh out when we decide to prioritize._
