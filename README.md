# Claude Code CLI Configuration

My Claude Code CLI configuration - agents, commands, skills, rules, hooks, and scripts.

## Structure

```
.
├── agents/          # 57 specialized subagents
├── commands/        # 41 slash commands
├── skills/          # 60 agent skills
├── rules/           # 16 global rules
├── hooks/           # Session hooks (TypeScript/shell)
├── scripts/         # Utility scripts
├── get-shit-done/   # GSD workflow templates
├── brand-voice-guidelines.md
├── project-info.md
├── riper-config.json
├── settings-zai.json
└── statusline.sh
```

## Agents

Specialized subagents for delegation:

| Category | Agents |
|----------|--------|
| **Core** | developer, code-reviewer, code-explorer, code-analyzer, file-analyzer, researcher, software-architect |
| **Planning** | tech-lead, team-lead, business-analyst, qa-engineer, plan-execute, research-innovate, review |
| **Frontend** | frontend-architect, component-builder, design-system-generator, ui-ux-designer, superdesign-agent, ascii-ui-mockup-generator, accessibility-auditor, shadcn-ui-adapter |
| **Backend** | nextjs-backend-architect, sst-cloud-architect, mastra-ai-agent-builder |
| **Testing** | vitest-component-tester, playwright-e2e-tester, test-runner, qa-code-auditor |
| **GSD** | gsd-project-researcher, gsd-research-synthesizer, gsd-roadmapper, gsd-codebase-mapper, gsd-phase-researcher, gsd-planner, gsd-plan-checker, gsd-executor, gsd-integration-checker, gsd-verifier, gsd-debugger |
| **Auditing** | skill-auditor, slash-command-auditor, subagent-auditor |
| **Agency** | Full department agents (engineering, marketing, design, support, etc.) |

## Commands

Slash commands for common workflows - planning, task management, code creation, debugging, auditing, and more.

## Skills

Reusable skill definitions covering development workflows, marketing, CRO, security testing, document generation, and specialized domains.

## Rules

Global rules applied to every session:
- Git workflow (branches, worktrees, commits)
- GitHub operations (repo protection, issue sync)
- Code standards (paths, frontmatter, datetime)
- AST-grep integration for structural code search

## Setup

Copy to `~/.claude/`:

```bash
# Clone
git clone https://github.com/gerald-ica/claude-code-config.git

# Copy configs (backup existing first)
cp -r claude-code-config/* ~/.claude/
```

Or symlink specific directories:

```bash
ln -sf $(pwd)/claude-code-config/agents ~/.claude/agents
ln -sf $(pwd)/claude-code-config/commands ~/.claude/commands
ln -sf $(pwd)/claude-code-config/skills ~/.claude/skills
ln -sf $(pwd)/claude-code-config/rules ~/.claude/rules
```
