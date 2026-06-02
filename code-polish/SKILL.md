---
name: code-polish
description: >-
  Polish code formatting/style and trim redundancy WITHOUT changing behavior. Use to tidy
  layout, enforce consistent style (indentation, quotes, import order, naming), run the
  project's formatter + linter --fix, remove dead code / unused imports / commented-out
  blocks, and replace verbose constructs with shorter equivalent ones (guard clauses, early
  return, destructuring, optional chaining). Complements code-simplification (which lowers
  cognitive/logical complexity); this one focuses on format, consistency, and compactness.
  Use when asked to format, tidy, polish, clean up, or 精简 code. Triggers: format code,
  tidy, polish, clean up code, optimize formatting, trim, 优化代码格式, 精简代码, 整理代码, 代码格式化.
---

# Code Polish — 代码格式优化与精简

在**不改变行为**的前提下，让代码更整洁、风格统一、紧凑可读。与 `code-simplification`(降逻辑复杂度) 互补——这个偏**格式 / 风格 / 冗余 / 紧凑度**。

## 铁律（先记住）
1. **不改行为** —— 改前确认有测试或能验证；改完跑测试/类型检查，绿了才算数。
2. **工具优先** —— 能交给 formatter/linter 的绝不手改。
3. **小步可回滚** —— 一类问题改一批、跑测、提交；大批量用 codemod/脚本，别手工。
4. **只动格式与冗余** —— 同一次改动**不夹带功能/逻辑变更**，保持 diff 干净。
5. **贴项目规范，不按个人偏好** —— 先看 `.editorconfig` / `.prettierrc` / `CLAUDE.md` / 邻近代码。

## 流程（按序）
1. **定范围** —— 哪些文件/目录；确认有测试兜底或可手工验证。
2. **格式层（自动）** —— 跑项目的 formatter（prettier / black / gofmt / clang-format / rustfmt…）+ `lint --fix`：统一缩进、引号、分号、空行、import 排序与去未用、行宽。
3. **精简层（人工，按信号）** —— 见下表，逐条等价替换。
4. **验证** —— 跑测试 + 类型检查 + lint；确认行为不变。
5. **自检** —— 这版真更好读吗？diff 是否只含格式/精简、无意外逻辑改动？
6. **原子提交** —— 单独一个 `refactor/style:` 提交，信息写清"仅格式与精简、行为不变"。

## 精简信号 → 等价更简洁写法
| 信号 | 改法 |
|---|---|
| 死代码 / 未用 import / 注释掉的代码 | 删（孤立项先列出确认再删） |
| 深层 if/else 包裹主体 | 护卫子句 + 早返回（early return） |
| 多余中间变量 / 一次性变量 | 内联 |
| `x ? x : y`、`x != null ? x.a : undefined` | 空值合并 `??` / 可选链 `?.` |
| 重复对象取字段 | 解构 |
| 多次重复的逻辑（≥3 次） | 抽成函数/常量 |
| 冗长布尔判断 | 提取具名布尔（`isAdmin` 胜过裸表达式） |
| 手写循环做 map/filter/reduce | 用数组方法（前提：不牺牲可读性） |

## 反模式（别做）
- 为了**缩行数**牺牲可读性（明确 > 聪明，一行嵌套三元不如几行清楚）。
- 在格式提交里偷偷改行为 / 改公共接口。
- 全仓库一把梭手工重排（用工具 + 分批）。
- 跨项目套个人风格、无视既有约定。

## 检验（过不了就回滚）
行为不变（测试绿）？符合项目格式规范？diff 干净只含格式/精简？队友会一眼批准？
