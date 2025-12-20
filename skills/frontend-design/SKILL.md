---
name: frontend-design
description: "Use when asked to design or build a frontend UI (pages, components, dashboards). Produces distinctive, production-grade interfaces that avoid generic AI aesthetics."
metadata:
  short-description: "Design bold, production-grade frontends."
---

Creates distinctive, production-grade frontend interfaces with a clear aesthetic direction and polished implementation.

## When to use
- The user asks for a frontend page, component, or app UI.
- A design needs a bold, intentional visual direction.

## Inputs it expects
- Product context (what it does, who it serves, desired tone).
- Technical constraints (framework, styling approach, responsiveness).
- Any required content, sections, or interactions.

## Step-by-step method
1) Clarify context, constraints, and the target audience.
2) Commit to a bold aesthetic direction (single clear theme).
3) Choose typography and a dominant color system; define CSS variables.
4) Plan layout structure, spacing, and motion highlights.
5) Implement production-grade code aligned to the chosen framework.
6) Review for visual cohesion, accessibility, and responsiveness.

## Design thinking
- Purpose: What problem does the interface solve?
- Tone: Pick an extreme (minimalist, maximalist, editorial, brutalist, retro, etc.).
- Differentiation: Decide what will be memorable about the design.
- Constraints: Follow existing design systems or project patterns when present.

## Aesthetics guidelines (short)
- Typography: avoid generic fonts; pick distinctive fonts with high contrast pairings.
- Color: commit to a cohesive palette with a dominant color and sharp accents.
- Motion: favor a few high-impact animations over scattered micro-interactions.
- Backgrounds: add depth via gradients, textures, or patterns; avoid flat defaults.
- Layout: break predictable grids with asymmetry, overlap, or bold spacing.

## Optional prompt blocks
See `references/frontend-aesthetics-prompts.md` for distilled and isolated prompt blocks you can apply when stronger aesthetic guidance is needed.

## Output format requirements
- Provide working, production-grade code.
- If outputting HTML, wrap in ` ```html ` fenced blocks.
- Keep structure responsive for mobile and desktop.
- Avoid default AI aesthetics (Inter/Roboto, purple-on-white, cookie-cutter layouts).

## Examples
- "Design a landing page for a fintech app with a bold editorial aesthetic."
- "Build a dashboard UI for a logistics platform with a minimal industrial theme."

## Smoke test
- Generate a single-page layout with a clearly stated aesthetic direction.
- Verify typography, palette, motion, and background choices align with that direction.
