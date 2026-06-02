# 上下文工程

- 5 层：rules(CLAUDE.md) → specs(按需) → source(改前读相似 pattern/类型) → errors(只给焦点错误，不 dump 整段日志) → history。
- 聚焦 ≤2000 行/任务；长对话另起 session 或显式总结进度。
- **冲突浮出**：spec 与 code 不符、需求不全、无先例 → 停下给 A 跟 spec / B 跟 code / C 问，别无声选。
