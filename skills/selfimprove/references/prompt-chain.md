# Selfimprove prompt chain

Run the prompts in order unless the user narrows scope. Use Claude Code for prompts labeled
[CLAUDE CODE]. Use Codex for prompts labeled [CODEX]. Pause after each prompt to let the
results inform the next step.

## 1) Random exploration and bugfix [CODEX]
I want you to sort of randomly explore the code files in this project, choosing code files to deeply investigate and understand and trace their functionality and execution flows through the related code files which they import or which they are imported by. Once you understand the purpose of the code in the larger context of the workflows, I want you to do a super careful, methodical, and critical check with "fresh eyes" to find any obvious bugs, problems, errors, issues, silly mistakes, etc. and then systematically and meticulously and intelligently correct them. Be sure to comply with ALL rules in AGENTS dot md.

## 2) Review other agents' code [CLAUDE CODE]
<!-- CLAUDE:review_agents:start -->
Ok can you now turn your attention to reviewing the code written by your fellow agents and checking for any issues, bugs, errors, problems, inefficiencies, security problems, reliability issues, etc. and carefully diagnose their underlying root causes using first-principle analysis and then fix or revise them if necessary? Don't restrict yourself to the latest commits, cast a wider net and go super deep! Use ultrathink.
<!-- CLAUDE:review_agents:end -->

## 3) UX and workflow audit [CODEX]
Great, now I want you to super carefully scrutinize every aspect of the application workflow and implementation and look for things that just seem sub-optimal or even wrong/mistaken to you, things that could very obviously be improved from a user-friendliness and intuitiveness standpoint, places where our UI/UX could be improved and polished to be slicker, more visually appealing, and more premium feeling and just ultra high-quality, like Stripe-level apps.

## 4) Beads plan from the audit [CODEX]
OK so please take ALL of that and elaborate on it more and then create a comprehensive and granular set of beads for all this with tasks, subtasks, and dependency structure overlaid, with detailed comments so that the whole thing is totally self-contained and self-documenting (including relevant background, reasoning/justification, considerations, etc.-- anything we'd want our "future self" to know about the goals and intentions and thought process and how it serves the over-arching goals of the project.)

Notes:
- If `.beads/` exists, use `bd` to create tasks and dependencies, then run `bd sync`.
- If `.beads/` is missing, initialize beads automatically and proceed with `bd`.

## 5) Beads review pass [CODEX]
Check over each bead super carefully-- are you sure it makes sense? Is it optimal? Could we change anything to make the system work better for users? If so, revise the beads. It's a lot easier and faster to operate in "plan space" before we start implementing these things!

## 6) Execute beads [CODEX]
OK, so start systematically and methodically and meticulously and diligently executing those remaining beads tasks that you created in the optimal logical order! Don't forget to mark beads as you work on them. After each bead, run the smallest meaningful check to confirm the change works before proceeding.

## 7) Continue [CODEX]
proceed

Repeat "proceed" as needed until the beads work is complete.

## 8) Fresh eyes final pass [CODEX]
Great, now I want you to carefully read over all of the new code you just wrote and other existing code you just modified with "fresh eyes" looking super carefully for any obvious bugs, errors, problems, issues, confusion, etc. Carefully fix anything you uncover.

## 9) Commit and push (reference only) [CLAUDE CODE]
<!-- CLAUDE:commit_push:start -->
Now, based on your knowledge of the project, commit all changed files now in a series of logically connected groupings with super detailed commit messages for each and then push. Take your time to do it right. Don't edit the code at all. Don't commit obviously ephemeral files. Use ultrathink.
<!-- CLAUDE:commit_push:end -->

Note: This skill requires manual commits, so do not run this prompt unless the user opts in.
