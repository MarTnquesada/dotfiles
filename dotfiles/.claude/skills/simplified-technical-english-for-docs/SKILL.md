---
name: simplified-technical-english-for-docs
description: When writing technical documentation, always adhere to ASD-STE100 Simplified Technical English. 
allowed-tools: Bash, Read, Edit, Write, Glob, Grep
---

When writing technical documentation, it is imperative that the language is non-ambiguous and to the point. To this end, use ASD-STE100 Simplified Technical English for docs.
ASD-STE100 is a controlled natural language, first released in 1986 (as AECMA Document PSC-85-16598) by what is now ASD (the AeroSpace and Defense Industries Association of Europe). It was built at the request of European airlines who needed maintenance documentation that could not be misread, because a misread instruction on an aircraft can kill people. As a result, STE is designed to eliminate ambiguity for a reader who cannot ask a follow-up question.

## ASD-STE100 Rule Categories 

**Word choice**
- Use approved words only in their approved meaning and part of speech.
- Each word maps to exactly one meaning — don't rely on context to disambiguate a word that has several dictionary senses.
- Prefer the plainer, shorter, more common word over a formal or rare synonym.

**Verb forms**
- Permitted forms: infinitive, imperative, simple present, simple past, simple future, and past participle used only as an adjective.
- No present perfect, past perfect, or other compound/auxiliary constructions ("we have received" is not allowed; "we received" is).
- "-ing" forms are permitted only as a technical noun or as part of a technical noun, not as a verb form.

**Voice**
- Active voice is required for procedures and instructions.
- Passive voice is allowed only in descriptive text, and only when the actor performing the action is genuinely unknown or irrelevant to the reader.

**Sentence structure**
- One instruction per sentence.
- Maximum ~20 words per sentence for procedures/instructions; maximum ~25 words for descriptive text.
- Do not omit sentence parts (verb, subject, article) just to shorten the sentence — the standard explicitly warns that this creates ambiguity rather than clarity.
- Noun clusters (strings of nouns stacked as a modifier) are capped at 3 words.

**Paragraph and document structure**
- One topic per paragraph.
- Maximum ~6 sentences per paragraph.
- Use vertical (numbered or bulleted) lists for sequences, conditions, or complex enumerations instead of burying them in prose.

**Safety instructions**
- Safety-critical instructions must open with a clear command or condition, not be buried mid-sentence.


## General STE Examples

These illustrate real ASD-STE100 rules, drawn from public secondary sources (see `references/writing-rules.md`). 

| Rule | Before | After | Why |
|---|---|---|---|
| One meaning per word | "Verify the system." / "Check the connections." / "Confirm receipt." | "Make sure the system is correct." (one approved term used consistently) | Three near-synonyms force the reader to guess whether they mean the same action. |
| One part of speech per word | "Oil the valve." | "Apply oil to the valve." | If "oil" is approved only as a noun, using it as a verb breaks the one-word-one-role guarantee. |
| Precise verb meaning | "Follow the safety instructions." | "Obey the safety instructions." | "Follow" can mean "come after" or "obey" — STE picks the unambiguous one. |
| Simple tense only | "We have received the technical reports from HQ." | "We received the technical reports from HQ." | Present perfect adds a second parse ("received, and still relevant now?") that simple past avoids. |

## Examples of STE Applied to Software Documentation

These are original examples built for this skill's actual use case: rewriting software documentation — README setup steps, code comments, and repository reference docs — so a contributor, a translator, or a non-native reader can parse it without ambiguity. They are illustrations, not quotes from any real project.

### Example A — README setup procedure

**Before:**
> Once the dependencies have been installed and the environment file has been copied, the developer should start the server while making sure the database is running, before then seeding the initial data.

**Violations flagged:**
- Present perfect ("have been installed", "has been copied") — STE permits only simple tenses.
- Passive voice in a procedure — STE requires the imperative (active) for an instruction.
- Several instructions in one sentence (start the server + seed the data) plus an "-ing" form ("making sure").
- 32 words, far over the 20-word instruction cap.

**After:**
> 1. Install the dependencies.
> 2. Copy the environment file.
> 3. Make sure the database is running.
> 4. Start the server.
> 5. Seed the initial data.

### Example B — Code comment

**Before:**
> ```
> // Note that this function might sometimes fail if the input has not been validated
> // beforehand, and it is recommended that callers make sure the data is checked first.
> ```

**Violations flagged:**
- Vague hedge ("might sometimes") — STE does not allow an unclear condition, and this comment warns of a failure.
- Present perfect + passive with no clear actor ("has not been validated").
- Two ideas in one sentence (the failure condition and the recommendation); a warning must be a direct command.

**After:**
> ```
> // Warning: This function fails if the input is not valid.
> // Validate the input before you call this function.
> ```

### Example C — Repository reference doc

**Before:**
> The parser module, which utilizes a set of handlers that have been registered at startup, is responsible for the transformation of the raw tokens that are produced by the lexer.

**Violations flagged:**
- "utilizes" is not an approved word — use "uses". "transformation" is a noun form of a verb; STE prefers the verb.
- Present perfect ("have been registered") — use a simple tense.
- 30 words, over the 25-word descriptive cap; one sentence carries the structure and the function together.

**After:**
> The parser module uses a set of handlers. The handlers register at startup. The module transforms the raw tokens that the lexer makes.


