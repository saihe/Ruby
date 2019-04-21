require 'socket'

def wake(mac)
  #メッセージの生成
  #FFを6回
  mes = ['FF'].pack('H2') * 6
  #続けて MACアドレスを 16回
  mes << mac.split('-').pack('H2H2H2H2H2H2') * 16

  #UDPソケットを生成
  s = UDPSocket.new
  #ブロードキャストの送信を有効化
  s.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, 1)
  #メッセージの送信
  s.send(mes, 0, '<broadcast>', 7)
end

#MACアドレスを指定
wake('48-D2-24-FA-9E-CF')
