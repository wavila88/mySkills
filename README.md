# WilliamSkills

## start-free-day

Read-only morning briefing for a job search: Gmail (interviews, tests, deadlines), LinkedIn direct messages and recruiter invitations, and at least 5 remote proposals (LinkedIn Easy Apply + elempleo.com), AI-related first, 10M COP/month or more, for .NET / React + .NET in Colombia. Excludes lead/staff roles.

### Install

**Option 1: one command (recommended)**

```bash
npx skills add wavila88/mySkills --skill start-free-day
```

The CLI asks which agents to install for (Claude Code, opencode). Add `-g` to install at user level instead of the current project.

**Option 2: clone and run the script (fallback, no external tool)**

```bash
git clone https://github.com/wavila88/mySkills.git
cd mySkills
```

```powershell
# Windows
powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target both
```

```bash
# macOS / Linux / Git Bash
./install.sh both
```

Targets: `claude` -> `~/.claude/skills/start-free-day`, `opencode` -> `~/.config/opencode/skills/start-free-day`.
The skill is a plain `SKILL.md` (`name` + `description` frontmatter), which both hosts read.

### Connect the data sources

**Gmail**

- Claude: add the Gmail connector in Connectors and authorize with Google.
- opencode: add the remote MCP server to `opencode.json` (OAuth with Google on first use):

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "gmail": { "type": "remote", "url": "https://gmailmcp.googleapis.com/mcp/v1", "enabled": true }
  }
}
```

**LinkedIn** (no public API for messages; uses your own signed-in browser session)

- Claude: built-in browser or Claude in Chrome. Sign in yourself once.
- opencode: Playwright MCP with a persistent profile so the session survives:

```json
{
  "mcp": {
    "playwright": {
      "type": "local",
      "command": ["npx", "@playwright/mcp@latest", "--user-data-dir", "C:/Users/<you>/.playwright-linkedin"],
      "enabled": true
    }
  }
}
```

Do not use community LinkedIn MCPs that ask for your `li_at` cookie; they break LinkedIn's terms and expose your session.

### Use

Say "start-free-day" (or "revisa mi día"). To customize role, country or exclusions, edit the `PROFILE` block in `start-free-day/SKILL.md`.
