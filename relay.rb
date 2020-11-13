class Relay < Formula  
  desc "Client for Webhook Relay service - demo websites from localhost and receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://storage.googleapis.com/webhookrelay/downloads/relay-darwin-amd64"
  sha256 "5726d33ff43a59a94dfbfe29a4b4bbc6733a9ec7bc65f8bf993e304396e567fc"

  def install    
    mv "relay-darwin-amd64", "relay"
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end