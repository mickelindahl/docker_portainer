location /portainer/api/websocket/ {
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_http_version 1.1;
      proxy_pass http://portainer/api/websocket/;
  }

proxy_set_header Connection $http_connection;