# Codex Simplify

Codex-first code simplification workflow with OpenCode and Pi adapters.

`$simplify` scopes recently changed code and docs, records a quick bloat baseline, launches three read-only analysis subagents for reuse, quality, and efficiency, then applies one minimal behavior-preserving patch.

## Structure

```text
.agents/plugins/marketplace.json
prompts/simplify.md
plugins/code-simplifier/.codex-plugin/plugin.json
plugins/code-simplifier/skills/simplify/SKILL.md
plugins/code-simplifier/skills/simplify/agents/openai.yaml
.opencode/commands/simplify.md
package.json
```

## Codex

Add this repository as a Codex plugin marketplace:

```bash
codex plugin marketplace add ukint-vs/codex-simplify
```

Then enable `Codex Simplify` from Codex plugin management and ask:

```text
Use $simplify on my recent changes.
Use $simplify to reduce bloat in my recent changes.
```

Optional custom prompt shortcut:

```bash
mkdir -p ~/.codex/prompts
cp prompts/simplify.md ~/.codex/prompts/simplify.md
```

Then run:

```text
/prompts:simplify
/prompts:simplify src/parser.ts src/parser.test.ts
```

Codex custom prompts are namespaced under `/prompts:`. Raw `/simplify` is not currently a Codex plugin command.

The skill defaults to changed files from git. You can also give explicit paths:

```text
Use $simplify on src/parser.ts and src/parser.test.ts.
```

## OpenCode

OpenCode users can use the bundled command from the repository root:

```text
/simplify
/simplify src/parser.ts src/parser.test.ts
```

The command reads the canonical Codex skill instructions and passes through any arguments.

## Pi

Pi can install this repository as a package from git:

```bash
pi install git:github.com/ukint-vs/codex-simplify
```

Then invoke the skill:

```text
/skill:simplify
/skill:simplify src/parser.ts src/parser.test.ts
```

## Behavior

- Preserves external behavior and public interfaces.
- Prioritizes deletion, deduplication, and consolidation before local polish.
- Removes or refines stale, redundant, or local-plan comments and docs.
- Reports whether the patch reduced, held, or increased net size and lists remaining bloat targets.
- Avoids generated files, vendored code, lockfiles, snapshots, and migrations unless requested.
- Uses three analysis goals: reuse, quality, and efficiency.
- Applies only a small final patch after merging and filtering subagent findings.

## Development

Run validation before publishing:

```bash
./scripts/validate.sh
```

Inspired by Anthropic's `code-simplifier` workflow, adapted to Codex plugin and skill conventions.
