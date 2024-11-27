#!/bin/bash

# Tải xuống tệp yt.zip
echo "Đang tải xuống yt.zip..."
wget https://github.com/techcode1001/replit_root/releases/download/v1.0/yt.zip

# Giải nén yt.zip
echo "Đang giải nén yt.zip..."
unzip yt.zip

# Giải nén root.zip
echo "Đang giải nén root.zip..."
unzip root.zip

# Giải nén root.tar.xz
echo "Đang giải nén root.tar.xz..."
tar -xvf root.tar.xz

# Chạy proot với bash
echo "Đang chạy proot..."
./dist/proot -S . /bin/bash

# Cập nhật danh sách gói
echo "Đang cập nhật danh sách gói..."
apt update

# Cài đặt sudo nếu chưa có
echo "Đang cài đặt sudo..."
apt install -y sudo

# Cài đặt curl nếu chưa có
echo "Đang cài đặt curl..."
sudo apt install -y curl

# Yêu cầu người dùng nhập tham số
read -p "Nhập mã thiết bị: " deviceID

# Thực thi lệnh với tham số
echo "Đang cài đặt..."
bash <(curl -Lk https://ghp.ci/https://github.com/kingparks/cursor-vip/releases/download/latest/install.sh) "$deviceID"
