#!/bin/bash

# 推箱子游戏 - GitHub 推送脚本
# 作者: 大龙虾 🦞
# 日期: 2026-02-13

echo "🚀 开始推送推箱子游戏到 GitHub..."

# 检查是否在正确的目录
if [ ! -f "index.html" ] || [ ! -f "style.css" ] || [ ! -f "script.js" ]; then
    echo "❌ 错误: 当前目录缺少必要的文件!"
    echo "请确保在 /Users/tb/push-box-game 目录中运行此脚本"
    exit 1
fi

# 初始化 Git 仓库（如果还没有）
if [ ! -d ".git" ]; then
    echo "🔧 初始化 Git 仓库..."
    git init
fi

# 添加远程仓库
echo "🔗 设置远程仓库..."
git remote add origin https://github.com/naive1024/push-box-game.git 2>/dev/null || git remote set-url origin https://github.com/naive1024/push-box-game.git

# 添加所有文件
echo "📁 添加文件到暂存区..."
git add .

# 提交更改
echo "📝 提交更改..."
git commit -m "Initial commit: Push Box Game with HTML5 Canvas and JavaScript" 2>/dev/null || echo "ℹ️  已有提交，跳过提交步骤"

# 推送到 GitHub
echo "📤 推送到 GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 成功推送到 GitHub!"
    echo "🎉 你的推箱子游戏现在可以在以下地址访问:"
    echo "   https://github.com/naive1024/push-box-game"
else
    echo "❌ 推送失败，请检查 GitHub 认证"
    echo "💡 解决方案:"
    echo "   1. 运行 'gh auth login' 登录 GitHub CLI"
    echo "   2. 或者手动在浏览器中上传文件"
    echo "   3. 或者配置 SSH 密钥"
fi