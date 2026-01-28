
# Agent Guidelines & Constraints

## 1. 无头系统浏览器调用
* **系统说明**：本系统是一个无头系统，不支持任何与浏览器相关的操作。
* **禁止自动调用浏览器**：在任何情况下，严禁自动启动浏览器预览、Playwright 或任何网页操作工具。
* **链接优先**：任务完成需要打开浏览器查看结果时，不要直接调用浏览器，仅以文本或 Markdown 链接形式提供 URL（例如：[http://localhost:3000](http://localhost:3000)），由我手动打开。


## 2. Python 环境运行与管理规范 (UV & Local Venv)

为了确保系统稳定性，禁止任何全局 Python 操作。在执行任务时必须严格遵守以下环境约束：

### 1. 核心二进制路径 (Critical Path)

所有 Python 代码执行、代码检查和解释器关联必须使用以下绝对路径：

> **`PYTHON_EXE`**: `/home/tom/.local/pyenv/.venv/bin/python3`

### 2. 强制性命令准则

AI 在终端执行命令时，**必须**遵循以下优先级映射：

| 意图 | 错误命令 (严禁使用) | **正确命令 (强制执行)** |
| --- | --- | --- |
| **运行脚本** | `python3 script.py` | `/home/tom/.local/pyenv/.venv/bin/python3 script.py` |
| **安装依赖** | `pip install <pkg>` | `cd /home/tom/.local/pyenv && uv add <pkg>` |
| **检查环境** | `which python` | `uv python find` |
| **运行模块** | `python -m <module>` | `uv run python -m <module>` |