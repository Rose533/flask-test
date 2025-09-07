FROM python:3.11-slim
WORKDIR /app

# 安裝套件
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 建資料夾給 sqlite（如果有用 sqlite）
RUN mkdir -p /app/data && chmod 777 /app/data

# 複製專案檔到容器
COPY . .

# 環境變數（如果你的程式要用 sqlite，可讀取這個）
ENV SQLITE_PATH=/app/data/db.sqlite3
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
