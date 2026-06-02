---
name: memory
description: >-
  The user's persistent file-based memory + daily-log system, encoded as a skill. Sediments
  non-obvious learnings — root causes, established standards, pitfalls, user preferences —
  into memory files with an index, and auto-creates/updates a daily log of work done. Use
  whenever finishing a chunk of work, after a non-obvious fix or decision, when the user says
  to remember something, or to write the day's log. Triggers: remember this, sediment, write
  log, daily log, recap, 记一下, 记住, 沉淀, 写日记, 复盘, 总结今天.
---

# Memory

> 把非显然的经验沉淀成带索引的记忆文件，并按「月/日」自动写工作日记——让 AI 有"记性"。

把"非显然的东西只踩一次坑"做成习惯：边干边沉淀记忆 + 自动写日记。

## 文件化记忆（`~/.claude/projects/<project>/memory/`）
- **一事一文件**，frontmatter：`name`(kebab，与文件名一致) / `description`(一句话，供召回判定) / `metadata.type`(`user`|`feedback`|`project`|`reference`)。
- 正文写事实；`feedback`/`project` 类补 **Why** 和 **How to apply** 两行。用 `[[name]]` 互链相关记忆（链到还没写的也行，等于标记待写）。
- 在 `MEMORY.md` 加**一行**索引（标题 + 钩子）；MEMORY.md 只放索引，正文永远在各自文件。
- **去重而非堆叠**：先找已覆盖同一事的文件直接改它，别新建重复；写错就删。
- 相对日期转绝对（"昨天"→具体日期）。

## 该记 / 不该记
- **记**：非显然的修复根因、确立的标准与约定、踩过的坑、用户偏好与反馈。
- **不记**：代码本身/git 历史/CLAUDE.md 已说明的；只对当前对话有用的。被要求记这类时，问"哪里非显然"，只记那个点。

## 自动日记（做完一段工作就写，不必用户开口）
- 位置沿用项目日志库的现有命名：`<X月日记>/<YY.M.D>/<YY.M.D>.md`（例：`记忆代码/六月日记/26.6.7/26.6.7.md`）。
- 今天没有该文件就**创建**，已有就**追加一节**；用今天的真实日期。
- 一节写：做了什么 · 关键决策与理由 · 踩的坑与解法 · 改了哪些文件。
- **基于真实发生的事**；没干事的休息日不补建空日志。

## 边界
记忆/日志库 ≠ 代码工程源。真实代码在各自仓库；记忆库只存记忆与日志，别当代码目录用。
