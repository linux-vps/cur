#!/bin/bash

# Kiểm tra xem tham số đã được truyền vào chưa
if [ -z "$1" ]; then
  echo "Lỗi: Bạn cần cung cấp tham số mã thiết bị."
  exit 1
fi

deviceID=$1  # Lấy tham số đầu tiên từ dòng lệnh

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

# Chạy proot và thực thi các lệnh tiếp theo bên trong proot
echo "Đang chạy proot và thực thi các lệnh..."
./dist/proot -S . /bin/bash -c "
  echo 'Đang cập nhật danh sách gói...';
  apt update;

  echo 'Đang cài đặt sudo...';
  apt install -y sudo;

  echo 'Đang cài đặt curl...';
  sudo apt install -y curl;

  echo 'Đang cài đặt...';
  bash <(curl -Lk https://github.com/kingparks/cursor-vip/releases/download/latest/install.sh) \"$deviceID\";


  # Gửi thông báo đã cài đặt thành công tới server (Google Apps Script Web App)
  curl -X POST -H "Content-Type: application/json" -d '{
    "deviceID": "$deviceID",
    "status": "installation_complete",
    "message": "Cài đặt hoàn tất thành công!"
  }' https://script.google.com/macros/s/AKfycbwG71q6TkccXBVao3XdrjbunRk1jQnOho1xDyM6cdqjtkhl86t_Qk__6LHLEbHQ-i1_0Q/exec

"
