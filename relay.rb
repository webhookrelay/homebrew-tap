class Relay < Formula  
  desc "Client for Webhook Relay service - demo websites from localhost and receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://storage.googleapis.com/webhookrelay/downloads/relay-darwin-amd64"
  sha256 "093394124f135abe28bb2bf08318b1e0e9e4253c362c57973e6a3c3bab680773"

  def install    
    mv "relay-darwin-amd64", "relay"
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end
