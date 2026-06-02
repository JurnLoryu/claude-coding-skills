# 🧰 Claude Code Engineering Skills

> 让 AI **像资深工程师一样写代码、审代码、记经验**的一套 Claude Code 技能。
> Make your AI agent code like a senior engineer — with discipline, taste, and memory.

![Claude Code](https://img.shields.io/badge/Claude%20Code-Skills-6E56CF)
![skills](https://img.shields.io/badge/skills-3-2EA043)
![behavior--safe](https://img.shields.io/badge/refactors-behavior--safe-1F6FEB)
![lang](https://img.shields.io/badge/docs-中文-EF4444)

把十几条零散的工程实践、一套代码整洁规约、和一套持久记忆纪律，**蒸馏成 3 个即插即用的技能**。说出意图就触发，不堆口号——给的全是能直接照做的招式。

---

## 📚 三个技能

| 技能 | 一句话 | 触发 |
|---|---|---|
| **`coding`** | 会随规模伸缩的工程操作手册：单人日常 ⇄ 大项目全生命周期 | 写功能 / 修 bug / 重构 / 审查 / 上线 |
| **`code-polish`** | 在**不改行为**前提下，做格式统一 + 去冗余精简 | 格式化 / 整理 / 精简代码 |
| **`memory`** | 把非显然的经验沉淀成记忆，并按日写工作日记 | 记一下 / 沉淀 / 写日记 / 复盘 |

---

## ✨ 凭什么好——看得见的细节

不是"要写好测试""注意安全"这种正确的废话。每条都落到可执行的动作：

**🧑‍💻 单人/日常闭环**（`coding/solo.md`）
- 增量：**每步 ≤100 行、只改一件事**，改完立刻 `编译+测试+验证`，三绿才提交。
- 修 bug 用 **Prove-It**：先写复现测试(FAIL) → 修 → 转 PASS → 跑回归。无测试的修复 = 空中楼阁。
- 改老代码先过 **Chesterton 五问**（这段做什么 / 谁调它 / 边界 / 为啥这样写 / git blame）。
- 找不到肇事提交？**`git bisect run npm test`** 自动二分定位。

**🏗️ 大项目生命周期**（`coding/large-project.md`）
- 规划用**纵向切片**而非横向：不是"整 DB→整 API→整 UI"，而是"注册(schema+API+UI)→登录(…)"，每片独立可验。
- 规格**先列假设**（web/native、auth、DB…）逼早期纠偏；模糊需求转可测（"快"→ LCP<2.5s + CLS<0.1）。
- 上线带**灰度阈值表**：错误率 >2× 基线立即回滚；功能开关 5%→25%→100%、2 周内清死代码。
- 下线老系统用**绞杀者 / 适配器 / 开关**三模式，逐消费者迁移（谁的用户谁负责）。

**🔍 代码审查流程**（`coding/quality.md`，0→7 按序走）
- **先审测试**（测行为还是测 mock 次数）→ 过五维（正确/可读/架构/安全/性能）→ 逐条 `严重度 — file:line`。
- 严重度分级：🔴 Critical(阻断) / 🟠 Required(必改) / 🟡 Nit(可选) / 🔵 FYI。
- 高风险改动走**对抗性复核**：把"裸代码 + 验收契约"交给一个**不知道你结论**的独立视角，指令是"找缺陷"。

**🧽 不改行为的精简**（`code-polish`）— 已实测，行为零变化：
```js
// before — 13 行嵌套 if
function f(a){ var r;
  if (a != null){ if (a.x != null){ r = a.x ? a.x : 0 } else { r = 0 } } else { r = 0 }
  return r }

// after — 2 行；node 跑前后输出都是 `5 0 0 0`
const f = (a) => a?.x ?? 0;
```
配一张「信号 → 等价改法」表（深 if→早返回、`?.`/`??`、解构、重复≥3 次再抽…），铁律：**同一次改动绝不夹带逻辑变更**。

**🧠 会记事的 AI**（`memory`）
- 一事一文件 + frontmatter + `MEMORY.md` 索引 + `[[]]` 互链，**去重更新不堆叠**。
- 干完一段活自动按 `月/日` 写当天日记；只记真实发生的事。

---

## 🗂 结构

```
skills/
├── coding/
│   ├── SKILL.md                      # 总纲（链到下方各文件）
│   └── references/
│       ├── implement/                # 单人/日常编码闭环
│       │   ├── source-driven.md      # 查官方文档定版本
│       │   ├── incremental.md        # ≤100 行/步、改完即测
│       │   ├── tdd.md                # 红-绿-重构 / Prove-It
│       │   ├── simplify.md           # Chesterton 五问、降认知复杂度
│       │   └── debug.md              # STOP→复现→根因→回归
│       ├── quality/                  # 质量与正确性
│       │   ├── review.md             # 五维审查 0→7 + 严重度
│       │   ├── adversarial-review.md # 隔离工件、独立视角找缺陷
│       │   ├── api-design.md         # 契约优先、难以滥用
│       │   └── ui.md                 # 容器/呈现分离 + 无障碍
│       ├── project/                  # 大项目生命周期
│       │   ├── planning.md           # 纵向切片 + 依赖图
│       │   ├── spec.md               # 先列假设 + 6 域
│       │   ├── docs-adr.md           # 记 why、gotcha [IMPORTANT]
│       │   ├── context.md            # 5 层上下文
│       │   ├── git.md                # trunk + 原子提交 + 没碰清单
│       │   ├── security.md           # 三层边界 Always/Ask/Never
│       │   ├── performance.md        # MEASURE→GUARD、CWV 目标
│       │   ├── ci-cd.md              # 质量门 + Build Cop
│       │   ├── shipping.md           # 灰度阈值表 + 回滚三件套
│       │   └── deprecation.md        # 绞杀者/适配器/开关
│       ├── rules.md                  # 编码守则（你的要求）
│       └── checklists.md             # 实现前/中/提交前/上线前
├── code-polish/
│   └── SKILL.md                      # 格式优化 + 去冗余精简（不改行为）
└── memory/
    └── SKILL.md                      # 文件化记忆 + 自动日记
```

> **渐进式加载**：平时只读一页 `SKILL.md` 总纲，需要细节才展开对应 `references/`，不挤占上下文。

---

## 🚀 安装

```bash
# macOS / Linux
cp -r coding code-polish memory ~/.claude/skills/

# Windows (PowerShell)
Copy-Item coding,code-polish,memory $env:USERPROFILE\.claude\skills\ -Recurse
```

重开会话即生效。

## 💡 用法

无需手动调用，说出意图自动触发；也可显式 `/coding`、`/code-polish`、`/memory`。

| 你说 | 触发 |
|---|---|
| "实现这个功能 / 修这个 bug / 重构 / 审查这段" | `coding` |
| "格式化一下 / 精简这段代码" | `code-polish` |
| "记一下这个坑 / 写今天的日记" | `memory` |

---

## 🧪 已验证

- 结构：3 个技能 frontmatter 合法、`name` 与目录一致、引用文件无断链。
- 功能：`code-polish` 精简前后 `node` 输出一致（行为零变化）；`memory` 按格式实建记忆文件与日记节。

---

## 📄 License

MIT（建议加一个 `LICENSE` 文件）。欢迎 issue / PR。
