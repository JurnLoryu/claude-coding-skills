# 性能（先量后改）

- **MEASURE → IDENTIFY → FIX → VERIFY → GUARD**；不测量的优化是赌博。
- 量两层：合成(Lighthouse) + 真实用户(web-vitals)。目标 LCP≤2.5s / INP≤200ms / CLS≤0.1。
- 常见杀手：N+1 查询、未分页列表、无尺寸图片、无谓 re-render。
- 图片：LCP 图 `<picture>+fetchpriority=high`，其余 `loading=lazy+decoding=async`，都带 width/height。
- **性能预算**入 CI：JS<200KB gzip、p95<200ms、Lighthouse≥90。
