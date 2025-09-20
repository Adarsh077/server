sudo apt -y update
sudo apt -y upgrade
sudo apt -y install net-tools btop git network-manager
sudo apt -y autoremove

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker

docker ps -a

# git clone https://github.com/Adarsh077/server.git ./

# docker compose up -d

# chmod +x ./backup.sh
# crontab -l > mycron 2>/dev/null
# sed -i '\|'"./backup.sh"'|d' mycron
# echo "0 0 * * * ./backup.sh" >> mycron
# crontab mycron
# rm mycron

# echo "Backup cron job installed: ./backup.sh at midnight"