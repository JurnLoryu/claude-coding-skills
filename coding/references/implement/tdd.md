# 测试驱动（任何逻辑改动 / 修 bug）

- **RED→GREEN→REFACTOR**：先写必然失败的测试 → 最小实现让它过 → 重构且保持绿。
- bug 用 **Prove-It**：先写复现测试（FAIL）→ 修 → 测试过（PASS）→ 跑全套回归。无测试的 bug 修复 = 空中楼阁。
- 金字塔：单元 80%(毫秒级) / 集成 15% / E2E 5%。
- **测状态不测调用次序**：`expect(result).toBe(...)` 好，`expect(mock).toHaveBeenCalled()` 脆。
- 测试用 DAMP（每个测试自成故事）而非 DRY。
