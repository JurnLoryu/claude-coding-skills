# CI/CD（质量门挡在变更前，不是部署后）

- 门顺序：Lint → TypeCheck → Unit → Build → Integration → (E2E) → audit → Bundle Size；任一失败即阻断，不许跳过/禁规则。
- 并行 job + 缓存依赖；管道 >10 分钟要优化。
- 保护 main：CI 全绿 + 1 审批 + 禁强推；Dependabot/Renovate 自动补丁。
- **Build Cop**：始终有人负责 keep CI green，失败就修或回滚。
