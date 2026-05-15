---
description: Run Simplify on recent changes
argument-hint: "[scope or files]"
---

Use $simplify to simplify recently changed code, comments, and docs while preserving behavior.

Scope or extra instructions: $ARGUMENTS

If no scope is provided, use changed files from git. Run the Simplify workflow: resolve the smallest relevant scope, record a quick bloat baseline, spawn the reuse, quality, and efficiency analysis subagents, rank deletion/deduplication/consolidation before local polish, remove or refine stale/local-plan comments and docs where safe, apply only a minimal safe patch, and run focused validation. Report whether the patch reduced, held, or increased net size.
