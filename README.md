# 🐾 Liam Pet Love Admin System | 萌宠爱心管理系统

> [!IMPORTANT]
> **Core Command | 核心命令**: 
> ```bash
cd Liam-pet-love-admin
> mkdir -p tmp_home && mvn clean package -Dmaven.test.skip=true -Duser.home=$(pwd)/tmp_home -Dmaven.repo.local=$HOME/.m2/repository -Dmaven.compiler.useIncrementalCompilation=false
> ```
> This project requires a clean build environment. Use the command above to avoid permission issues on macOS and disable incremental compilation to ensure MapStruct works correctly.
> 本项目需要纯净的构建环境。请使用上述命令以避免 macOS 上的权限问题，并禁用增量编译以确保 MapStruct 正常工作。

## 📖 Introduction | 项目简介

Liam Pet Love Admin is a comprehensive management system for pet care, built on top of RuoYi-Vue-Plus. It features multi-tenant support, distributed architecture, and a modern tech stack.
Liam Pet Love Admin 是一个基于 RuoYi-Vue-Plus 构建的宠物爱心管理系统。它具备多租户支持、分布式架构以及现代化的技术栈。

## 🚀 Quick Start | 快速开始

### 1. Prerequisites | 环境准备

Ensure you have the following installed:
请确保您已安装以下软件：

*   **JDK**: 17+
*   **MySQL**: 8.0+ (Create database `Liam_pet_love_bd`)
*   **Redis**: 5.0+ (Started / 已启动)
*   **Maven**: 3.8+

### 2. Build Project | 构建项目

Run the following command in the project root to build the backend. We recommend disabling incremental compilation to avoid MapStruct issues:
在项目根目录下运行以下命令以构建后端。建议禁用增量编译以避免 MapStruct 相关问题：

```bash
cd Liam-pet-love-admin
mkdir -p tmp_home
mvn clean package -Dmaven.test.skip=true -Duser.home=$(pwd)/tmp_home -Dmaven.repo.local=$HOME/.m2/repository -Dmaven.compiler.useIncrementalCompilation=false
```

### 3. Start Backend | 启动后端

After a successful build, start the main application:
构建成功后，启动主应用程序：

```bash
# Start ruoyi-admin module | 启动 ruoyi-admin 模块
# Ensure you are in the Liam-pet-love-admin directory | 确保在 Liam-pet-love-admin 目录下
mvn spring-boot:run -pl ruoyi-admin -Dspring-boot.run.fork=false
```

### 4. Start Frontend | 启动前端

The frontend source code is located in the root `src` directory (combined structure).
前端源代码位于根目录 `src` 下（混合结构）。

```bash
# Install dependencies | 安装依赖
npm install

# Start development server | 启动开发服务器
npm run dev
```

### 5. One-Click Start Script | 一键启动脚本

We provide a convenient script to start both backend and frontend in separate terminals.
The script automatically applies the "Safe Mode" build settings (using temporary home and disabling incremental compilation) to prevent macOS permission and MapStruct issues.
我们提供了一个便捷脚本，可在独立终端中同时启动后端和前端。
该脚本自动应用“安全模式”构建设置（使用临时主目录并禁用增量编译），以防止 macOS 权限和 MapStruct 问题。

```bash
# In the project root (parent of this directory) | 在项目根目录（此目录的上级）
# Run the script | 运行脚本
./start_dev.sh
```

## 🛠️ Core Commands Cheat Sheet | 核心命令速查

### Clean Build (macOS Safe) | 清理构建 (macOS 安全)

```bash
mkdir -p tmp_home && mvn clean package -Dmaven.test.skip=true -Duser.home=$(pwd)/tmp_home -Dmaven.repo.local=$HOME/.m2/repository
```

### Start Main Service | 启动主服务

```bash
mvn spring-boot:run -pl ruoyi-admin -Dspring-boot.run.fork=false
```

### Start Monitor | 启动监控中心

```bash
mvn spring-boot:run -pl ruoyi-extend/ruoyi-monitor-admin
```

### Start Job Server | 启动任务调度

```bash
mvn spring-boot:run -pl ruoyi-extend/ruoyi-snailjob-server
```

## ❓ Troubleshooting | 常见问题

### 1. Build Failure: `Operation not permitted`
**Cause**: macOS sandbox or permission issues with `.msp` folder.
**Fix**: Use `-Duser.home=$(pwd)/tmp_home` to redirect user home during build.
**原因**: macOS 沙箱或 `.msp` 文件夹权限问题。
**解决**: 使用 `-Duser.home=$(pwd)/tmp_home` 重定向构建时的用户目录。

### 2. Compilation Error: `cannot find symbol` (e.g., Log, BusinessType)
**Cause**: Missing dependencies in sub-modules (e.g., `liam-pet-love` missing `ruoyi-common-log`).
**Fix**: Ensure `pom.xml` includes necessary dependencies. We have fixed this by adding `ruoyi-common-log` and `ruoyi-common-idempotent` to `liam-pet-love/pom.xml`.
**原因**: 子模块（如 `liam-pet-love`）缺少依赖（如 `ruoyi-common-log`）。
**解决**: 确保 `pom.xml` 包含必要依赖。我们已通过在 `liam-pet-love/pom.xml` 中添加 `ruoyi-common-log` 和 `ruoyi-common-idempotent` 修复了此问题。

### 3. MapStruct Error: `error reading ...` or `not a statement`
**Cause**: Generated files might be locked, corrupted, or incomplete due to incremental compilation.
**Fix**: Delete the `target` directory and rebuild with `-Dmaven.compiler.useIncrementalCompilation=false`.
**原因**: 生成的文件在构建过程中可能被锁定、损坏或因增量编译而不完整。
**解决**: 删除 `target` 目录并使用 `-Dmaven.compiler.useIncrementalCompilation=false` 重新构建。

### 4. Class Not Found / Bean Not Found
**Symptoms**:
- `NoClassDefFoundError: org/dromara/common/core/domain/model/RegisterBody`
- `UnsatisfiedDependencyException` (e.g., `ISysPermissionService` not found)

**Cause**:
Build failure or incomplete compilation in dependent modules (e.g., `ruoyi-common-core`, `ruoyi-system`).
This often happens if you delete `target` manually but Maven's incremental compiler thinks files are up-to-date.
**原因**:
依赖模块（如 `ruoyi-common-core` 或 `ruoyi-system`）构建失败或编译不完整。
通常发生在你手动删除了 `target` 目录，但 Maven 的增量编译器误以为文件是最新的。

**Fix**:
Rebuild the problematic module explicitly:
```bash
mvn clean install -pl ruoyi-modules/ruoyi-system -Dmaven.compiler.useIncrementalCompilation=false
```
Then rebuild the main app.
**解决**:
显式重新构建有问题的模块：
```bash
mvn clean install -pl ruoyi-modules/ruoyi-system -Dmaven.compiler.useIncrementalCompilation=false
```
然后重新构建主应用。

---

## 🤝 Contribution | 贡献

Feel free to submit Pull Requests or Issues.
欢迎提交 Pull Request 或 Issue。
