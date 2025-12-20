# Ideate prompt chain

Run the prompts in order unless the user narrows scope. This chain focuses on ideation and
then follows the same beads/implementation/testing cycle used by selfimprove.

## 1) Ideation kickoff [CODEX]
I want you to ideate with me on the following idea and help shape it into a concrete plan. Ask
concise clarification questions first (no more than 5). Focus on goals, target users, constraints,
risks, and success metrics. Do not proceed to implementation until the answers are received.

## 2) Synthesize the plan [CODEX]
Take the clarified idea and produce a structured plan with:
- Problem statement and success metrics.
- Target users and primary workflows.
- Scope and non-goals.
- Risks, unknowns, and open questions.
- Proposed technical approach and milestones.

## 3) Beads plan from the ideation [CODEX]
Create a comprehensive and granular set of beads with tasks, subtasks, and dependency structure,
with detailed comments that make the plan self-contained and self-documenting.

Notes:
- If `.beads/` exists, use `bd` to create tasks and dependencies, then run `bd sync`.
- If `.beads/` is missing, initialize beads automatically and proceed with `bd`.

## 4) Beads review pass [CODEX]
Check over each bead super carefully-- are you sure it makes sense? Is it optimal? Could we change
anything to make the system work better for users? If so, revise the beads.

## 5) Execute beads [CODEX]
Start systematically and methodically executing the remaining beads tasks in the optimal logical
order. Mark beads as you work on them. After each bead, run the smallest meaningful check to
confirm the change works before proceeding.

## 6) Continue [CODEX]
proceed

Repeat "proceed" as needed until the beads work is complete.

## 7) Fresh eyes final pass [CODEX]
Carefully read over all new or modified code with fresh eyes and fix any issues you uncover.

## 8) Commit and push (reference only) [CODEX]
Now, based on your knowledge of the project, commit all changed files now in a series of logically
connected groupings with detailed commit messages for each and then push. Don't edit the code at
all. Don't commit obviously ephemeral files.

Note: This skill requires manual commits, so do not execute this step unless the user opts in.
