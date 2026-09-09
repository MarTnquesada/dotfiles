---
description: Search information online and summarize results
argument-hint: [query]
disable-model-invocation: true
allowed-tools: WebSearch, WebFetch
---

# Search information online

Search query: $ARGUMENTS

## Instructions

Search information for the given query online. Analyze the top results and select the best-fitting ones. Summarize them into a succint response that answers the initial query and assumes that the user is a seasoned software engineer. If the query is not a direct question, assume that the user wants an explanation of the given term in the context of computer science.