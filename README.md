# Master Test

A Codex and Cursor skill containing the full `master-test` premium testing prompt for comprehensive software testing, QA validation, and production readiness reporting.

## Quick Install

Clone the private repository, then run the installer:

```bash
gh repo clone Rajkumar-Sony/master-test
cd master-test
./install.sh --target all
```

Install only one target:

```bash
./install.sh --target codex
./install.sh --target cursor
```

Replace an existing installation:

```bash
./install.sh --target all --force
```

After installation, restart Codex/Cursor or open a new chat so the skill is discovered.

## Manual Install

Codex:

```bash
mkdir -p ~/.codex/skills
cp -R .codex/skills/master-test ~/.codex/skills/master-test
```

Cursor:

```bash
mkdir -p ~/.cursor/skills
cp -R .cursor/skills/master-test ~/.cursor/skills/master-test
```

Codex can also install directly from the GitHub path when authenticated:

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo Rajkumar-Sony/master-test \
  --path .codex/skills/master-test
```

## Contents

- `plugin.json` - Agent Plugins 1.0 manifest.
- `.codex-plugin/plugin.json` - Codex compatibility manifest.
- `skills/master-test/SKILL.md` - Canonical Master Test skill instructions.
- `.codex/skills/master-test/SKILL.md` - Codex installable skill path.
- `.cursor/skills/master-test/SKILL.md` - Cursor installable skill path.
- `install.sh` - Convenience installer entrypoint.
- `scripts/install.sh` - Installer implementation for Codex and Cursor.

## Plugin

- Display name: Master Test
- Package name: `master-test`
- Version: `0.1.3`
- Author: RajkumarSony
