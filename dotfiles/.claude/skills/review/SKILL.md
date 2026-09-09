---
name: review
description: Review all changes on the current branch vs origin/main or origin/master, take the task description given into consideration. Produces report highlighting areas that might require changes.
argument-hint: [task-description]
---

Task description: $ARGUMENTS

1. Detect base branch: check if `origin/main` exists, else use `origin/master`.
2. Run `git diff <base>...HEAD` to get the full delta. Also run `git log <base>...HEAD --oneline` for commit context.
3. Review the diff thoroughly, taking into consideration the intention of the changes based on the task description. For each file changed, assess:
   - **Correctness**: Look out for gotchas and missed edge cases.
   - **Design**: Unnecessary complexity and violations of existing patterns (look out for existing architectural decision records in the codebase as well as considering the shape of current code).
   - **Tests**: Missing coverage for new behavior.
4. Produce a report in this format:

---

## Review: `<branch>` → `<base>`

### Summary
Maximum three sentences outlining the changes done in relation to the task description and the general readiness of the branch.

### Issues

| Severity | File | Line | Issue |
|----------|------|------|-------|
| 🔴 Critical | ... | ... | ... |
| 🟠 Major | ... | ... | ... |
| 🟡 Minor | ... | ... | ... |
| 🔵 Nit | ... | ... | ... |


---

Be brief and specific, cite exact file paths and line numbers. Do not propose fixes.
