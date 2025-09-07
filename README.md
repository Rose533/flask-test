# flask-test

簡短介紹：  
一個用 Flask 寫的簡單網站，部署在 Kubernetes (minikube)。示範如何把 app 打包成容器、用 GitHub Actions 推到 GHCR，並在 minikube 上用 PVC 儲存 SQLite。

---

## 目錄
- 本機快速跑（開發）
- 建立映像並推到 GHCR（CI）
- 在 minikube 上部署（Kubernetes）
- 常用指令
- 清理
- 注意事項

---

## 本機快速跑（開發）
1. 建議在虛擬環境中執行：
```bash
python -m venv .venv
.\.venv\Scripts\Activate.ps1   # PowerShell（Windows）
pip install -r requirements.txt
python app.py
# 或用 gunicorn
gunicorn --bind 0.0.0.0:5000 app:app
