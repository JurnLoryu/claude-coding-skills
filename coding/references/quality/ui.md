# 生产级 UI

- **避开 AI 审美**：滥用紫色/渐变、rounded-2xl、通用 Hero、Lorem ipsum、均匀大 padding、堆阴影 → 改用项目配色、设计系统间距阶梯、真实占位文本。
- **容器/呈现分离**：容器管数据（`useTasks`），呈现纯渲染（收 props）；状态超 3 层 prop 钻 → Context。
- **无障碍底线（WCAG 2.1 AA）**：交互元素 Tab 可达 → 非原生补 `role+tabIndex+onKeyDown` → input 配 label → 焦点管理 → 空/错/载三态都有 UI。
- **响应式**：移动优先，测 320/768/1024/1440。
- 神器：**容器/呈现分离 + 语义化空态**（`{载入→Skeleton, 错→ErrorState, 空→EmptyState}`），任何状态都不空白屏。
