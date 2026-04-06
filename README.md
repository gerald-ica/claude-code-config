# Claude Code CLI Configuration

My Claude Code CLI configuration - agents, commands, skills, rules, hooks, plugins, and scripts.

## Structure

```
.
├── agents/          # 57 specialized subagents
├── commands/        # 41 slash commands
├── skills/          # 60 agent skills (user-level)
├── plugins/         # 52 installed plugins (378 skills, 77 agents, 92 commands)
├── agents-skills/   # 11 additional skills from ~/.agents/
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

**Total: ~500 skills, 134 agents, 133 commands across all sources.**

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

## Plugins (52 installed)

All plugins from the Claude Code marketplace, including:

| Plugin | Description |
|--------|-------------|
| **superpowers** | Skill-first workflow, brainstorming, planning, TDD, debugging |
| **get-shit-done (GSD)** | Project management with phases, roadmaps, verification |
| **feature-dev** | Guided feature development with architecture focus |
| **frontend-design** | Production-grade frontend interfaces |
| **figma** | Figma design-to-code and code-to-design |
| **firebase** | Firebase project management and deployment |
| **firecrawl** | Web scraping and skill generation from docs |
| **vercel** | Deployment, AI SDK, Next.js, and platform tools |
| **slack** | Channel digests, standup generation, messaging |
| **hookify** | Create hooks from conversation analysis |
| **PR review toolkit** | Code review, silent failure hunting, type design analysis |
| **data engineering** | Airflow DAGs, dbt, warehouse management |
| **huggingface** | Model training, datasets, Gradio apps |
| **chrome devtools** | Browser debugging via MCP |
| **code-simplifier** | Code cleanup and simplification |
| **commit-commands** | Git commit, push, and PR workflows |
| **imessage** | iMessage channel integration |
| **playwright** | Browser automation and E2E testing |
| **product-tracking** | Analytics tracking plans and implementation |
| **revenuecat** | In-app purchase and subscription management |
| **semgrep** | Static analysis and security scanning |

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
