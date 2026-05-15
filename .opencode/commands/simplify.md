---
description: Simplify recently changed code, comments, and docs without changing behavior
---

Read and follow @plugins/code-simplifier/skills/simplify/SKILL.md.

Scope or extra instructions: $ARGUMENTS

If no scope is provided, use changed files from git. Run the Simplify workflow: resolve the smallest relevant scope, record a quick bloat baseline, run reuse, quality, and efficiency analysis passes, rank deletion/deduplication/consolidation before local polish, remove or refine stale/local-plan comments and docs where safe, apply only a minimal safe patch, and run focused validation. Report whether the patch reduced, held, or increased net size.
