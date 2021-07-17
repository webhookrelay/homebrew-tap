class Relay < Formula  
  desc "Client for Webhook Relay service - demo websites from localhost and receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://storage.googleapis.com/webhookrelay/downloads/relay-darwin-amd64"
  sha256 "f81addbd3860c2427053bbf6de158d1f925a762783e4c77bb6e422afcdb0817d"

  def install    
    mv "relay-darwin-amd64", "relay"
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end