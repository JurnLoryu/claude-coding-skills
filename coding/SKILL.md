---
name: coding
description: >-
  Integrated software-engineering skill that fuses the user's configured engineering skills
  into one. Two scales: a SOLO/daily coding loop (source-driven → incremental → TDD →
  simplify → debug) for fast-but-solid work, and a LARGE-PROJECT lifecycle (plan → spec →
  docs/ADR → context → git → security → performance → CI/CD → ship → deprecate) for work
  that must scale, ship, and be maintained — plus a quality bar (five-axis review,
  adversarial verification, interface contracts, production UI) and the user's own coding
  rules. Use whenever writing, modifying, debugging, refactoring, or reviewing code, or
  picking up a codebase. Triggers: write code, implement, build feature, fix bug, debug,
  refactor, review, ship, large project, 写代码, 改代码, 修bug, 重构, 代码审查, 上线, 大项目, 接手代码.
---

# Coding

> 写、改、修、重构、审查代码的统一操作手册——**单人日常闭环 ⇄ 大项目全生命周期**，外加质量审查与你的编码守则。

写/改/修/重构/审查代码的统一手册——把你已配置的工程 skills 的精华整合在一处。按尺度取用：**单人/日常**（快而稳）与 **大项目**（可规划、可上线、可维护）。

## 基线（每次改动，always-on）
先读后改 · 贴合既有风格 · 最小手术式改动（标 `file:line`）· 用专用工具且独立调用并行 · 验证后如实报告（失败贴输出，不报未验证的"完成"）· 删除/覆盖/force-push/发数据先确认。

## 单人 / 日常编码闭环 → `references/implement/`
**源码驱动**`source-driven.md` → **增量实现**`incremental.md`（≤100 行/步、改完即测） → **TDD**`tdd.md`（先写失败测试、红-绿-重构） → **简化**`simplify.md`（降认知复杂度） → **调试**`debug.md`（STOP→复现→缩小→根因→回归）。

## 大项目生命周期 → `references/project/`
**规划**`planning.md` · **规格**`spec.md` · **文档/ADR**`docs-adr.md` · **上下文**`context.md` · **Git**`git.md` · **安全**`security.md` · **性能**`performance.md` · **CI/CD**`ci-cd.md` · **上线**`shipping.md` · **弃用/迁移**`deprecation.md`。

## 质量与正确性 → `references/quality/`
**审查流程**`review.md`（五维+严重度，0→7 按序） · **对抗性复核**`adversarial-review.md` · **接口契约**`api-design.md` · **生产 UI**`ui.md`。

## 编码守则（你平时的要求）→ `references/rules.md`
批评直给 · 速度并行但关键决策先问 · 质量零 AI 味 · 详细不啰嗦 · 复用优先 · 验证如实报告 · 暴露坑 · commit/安装/部署不擅自做。

## 沉淀 → 配套 `memory` 技能
非显然的修复根因、确立的标准、踩过的坑、用户偏好 → 按 `memory` 技能写进记忆，并把当天工作记进日记。

## 清单 → `references/checklists.md`
实现前 / 实现中 / 提交前 / 上线前 四道关。
