---
description: Run Simplify on recent changes
argument-hint: "[scope or files]"
---

Use $simplify to simplify recently changed code while preserving behavior.

Scope or extra instructions: $ARGUMENTS

If no scope is provided, use changed files from git. Run the Simplify workflow: resolve the smallest relevant scope, spawn the reuse, quality, and efficiency analysis subagents, merge their findings, apply only a minimal safe patch, and run focused validation.

