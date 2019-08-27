class Relay < Formula  
  desc "Client for Webhook Relay service - demo websites from localhost and receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://storage.googleapis.com/webhookrelay/downloads/relay-darwin-amd64"
  sha256 "d82d0293c090aa936c18ab5698e118b4683c9185dc93ca81471a7505a106ac40"

  def install    
    mv "relay-darwin-amd64", "relay"
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end