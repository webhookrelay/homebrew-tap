class Relay < Formula  
  desc "Client for Webhook Relay service - demo websites from localhost and receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://storage.googleapis.com/webhookrelay/downloads/relay-darwin-amd64"
  sha256 "1eb3ce2b50b0ce456de68dcbc3e6ec535bfb63969f831380804fc74c1dcfe45a"

  def install    
    mv "relay-darwin-amd64", "relay"
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end
