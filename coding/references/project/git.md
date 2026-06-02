# Git 协作

- **Trunk-based**：main 永远可部署，feature 分支 ≤1–3 天。
- **原子提交**：一 commit 一逻辑事，测试过就提（像存档点）；`<type>: <desc>` + body 说 why（feat|fix|refactor|test|docs|chore）。
- 提交前：`git diff --staged` 看内容 + grep 密钥 + 测试 + lint + 类型检查。
- 收尾写**变更摘要 + "没碰清单(DIDN'T TOUCH)" + 假设确认项**，暴露错假设、示范 scope 纪律。
- 变更体量：~100 行/commit 理想、~300 可接受、>1000 必拆。
