1️⃣ 安裝 microk8s
在 Ubuntu 上安裝 microk8s：

```
sudo snap install microk8s --classic
## 安裝後，確保你的用戶可以訪問 microk8s（避免每次使用 sudo）：


sudo usermod -aG microk8s $USER
newgrp microk8s
## 啟動 microk8s 並啟用必要的插件：


microk8s enable dns storage ingress
## 檢查 microk8s 是否正常運行：


microk8s status --wait-ready

microk8s kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.yaml


cd my_k8s
microk8s kubectl apply -k ./overlays/prod


microk8s kubectl get pods | grep odoo

microk8s kubectl logs deploy/odoo

microk8s kubectl get svc | grep odoo


sudo tee /etc/nginx/sites-available/mail-service <<'EOF'
server {
    listen 80;
    server_name mail.foson.co;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
        allow all;
    }

    location / {
        proxy_pass http://127.0.0.1:30080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/mail-service /etc/nginx/sites-enabled/

sudo nginx -t && sudo systemctl reload nginx

sudo certbot certonly --webroot -w /var/www/certbot -d mail.foson.co

```

