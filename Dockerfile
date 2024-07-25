# 使用官方 Python 运行时作为基础镜像
FROM python:3.9-slim

# 设置容器内的工作目录
WORKDIR /app

# 将 book_catalog 文件夹整个复制到容器的 /app/book_catalog
COPY book_catalog /app/book_catalog

# 安装 requirements.txt 中指定的所有依赖项
RUN pip install --no-cache-dir -r /app/book_catalog/requirements.txt

# 对外开放 80 端口
EXPOSE 80

# 使用 uvicorn 运行你的 FastAPI 应用，监听所有接口的 80 端口
CMD ["uvicorn", "book_catalog.main:app", "--host", "0.0.0.0", "--port", "80"]
