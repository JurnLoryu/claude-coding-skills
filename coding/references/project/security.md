# 安全（三层边界：Always / Ask / Never）

- **输入**：入口处 schema 校验；SQL 参数化；输出编码/转义。三方数据永不信任。
- **密钥**：绝不入代码（读环境变量），`.env` 不提交，提交前 grep `password|secret|api_key|token`。
- **认证**：密码 bcrypt/argon2（≥12 轮）；cookie `httpOnly+secure+sameSite`；登录限速。
- **授权**：不止"是谁"，每个保护端点查"有权吗"（`userId===resource.ownerId`）。
- **依赖**：`npm audit` critical/high 且可达就修；Helmet + 严格 CSP + CORS 白名单（不用 `*`）。
