# Consult Prompt Template

Use this template when you want the other agent to provide a focused expert consultation.

```text
You are the consulting agent. Read the context carefully and respond in markdown with the exact headings:

Summary
Analysis
Recommended next steps
Risks
Files to check

Context:
- Repo: <repo path or name>
- Files: <list key file paths>
- Error logs: <paste stack trace or logs>
- Commands run: <commands and outputs>
- Current hypothesis: <what we think is wrong>
- Constraints: <time, libraries, policy, environment>

Question:
<the precise question to answer>

Expectations:
- Give a crisp summary and analysis.
- Provide 3-7 concrete next steps.
- Call out risks or edge cases.
- List files to check.
```
