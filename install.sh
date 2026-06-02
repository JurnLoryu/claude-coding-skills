#!/usr/bin/env bash
# 一键安装：把本仓库的技能拷到 Claude Code 用户技能目录
# 用法： bash install.sh        （可用 CLAUDE_SKILLS_DIR 覆盖目标目录）
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
SKILLS=(coding code-polish memory)

mkdir -p "$DEST"
for s in "${SKILLS[@]}"; do
  if [ -d "$SRC/$s" ]; then
    rm -rf "$DEST/$s"
    cp -r "$SRC/$s" "$DEST/$s"
    echo "[OK] installed: $s -> $DEST/$s"
  else
    echo "[SKIP] not found: $SRC/$s" >&2
  fi
done

echo "Done. 重开 Claude Code 会话即可加载这些技能。"
