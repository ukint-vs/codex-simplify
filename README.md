# Codex Simplify

Codex-first code simplification workflow with OpenCode and Pi adapters.

`$simplify` scopes recently changed code and docs, records a quick diff baseline, runs four focused analysis passes for reuse, structure, quality, and efficiency, then applies one behavior-preserving patch that reduces net changed lines. It delegates independent passes in parallel when the environment supports it and runs the remainder locally.

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
Use $simplify to tighten my recent implementation diff.
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

- Preserves external behavior and public interfaces; internal signatures may change when all callers are updated in the same patch.
- Targets a net-negative patch: deletions, deduplication, and consolidation first, and skips net-additive suggestions instead of applying them.
- Hunts structural spaghetti: wrong-depth fixes, special cases on shared paths, control-flag parameters, pass-through wrappers, scattered dispatch.
- Analysis passes read the full files and search the repository — deletion and reuse findings must be verified against real references, not just the diff.
- Removes or refines stale, redundant, or local-plan comments and docs.
- Reports the patch's net line delta and lists remaining cleanup targets.
- Avoids generated files, vendored code, lockfiles, snapshots, and migrations unless requested.
- Uses four analysis goals: reuse, structure, quality, and efficiency, with capability-aware delegation.

## Development

Run validation before publishing:

```bash
./scripts/validate.sh
```

Inspired by Anthropic's `code-simplifier` workflow, adapted to Codex plugin and skill conventions.
