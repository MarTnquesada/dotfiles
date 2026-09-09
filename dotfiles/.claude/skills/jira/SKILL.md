---
description: Implement a Jira ticket end-to-end
argument-hint: [ticket-key]
disable-model-invocation: true
allowed-tools: mcp__claude_ai_Atlassian__getJiraIssue, mcp__claude_ai_Atlassian__search, Bash(git:*), Read, Edit, Write
---

# Implement Jira Ticket

Ticket key: $ARGUMENTS

## Instructions

1. **Fetch the ticket** from Jira using the Atlassian MCP tools. Read the summary, 
   description, acceptance criteria, and any comments.

2. **Find the repo.** The ticket description will mention a repository name.
   All my repos live under `~/workspace/`. Navigate to `~/workspace/<repo-name>`.
   If the repo name isn't mentioned, ask me.

3. **Set up the branch:** The BRANCH_NAME should be written by concatenating the ticket key $ARGUMENTS with a very short description of the ticket using hyphens.
    For example: "PROD-6229: Uvify targets repository for better maintainability" could become "PROD-6229-uvify-targets-repository".
    Pull the latest version of main or master (whichever is relevant) and branch out.

4. **Plan the implementation.** If you find that there are any ambiguities or you require more implementation details, ask me directly as much as needed. Once you have received enough information, resume implementing.

5. **Implement the planned changes**. Match existing code style 
   and conventions in the repo.

6. **Run tests** if the project has a test suite. Fix any failures.

7. **Verify that the sonarqube gate for this project passes**, use the available SonarQube mcp for it.

8. **Commit and push:**
Make sure that you have first installed the local pre-commit or pre-push hook if there is any.
```bash
   git add -A
   git commit -m "<concise summary>"
   git push -u origin <BRANCH_NAME>
```

9. **Summarize** what was done and flag anything from the ticket that wasn't 
   addressed or needs clarification.
