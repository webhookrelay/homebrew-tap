require "language/go"

class Relay < Formula  
  desc "Client for Webhook Relay service - receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://github.com/webhookrelay/client.git",
    :tag => "v0.2.1",
    :revision => "163a5cf3c0d1aaba2f426be634dad3e1e0e29ff0"

  head "https://github.com/webhookrelay/client.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p "src/github.com/webhookrelay"
    ln_s buildpath, "src/github.com/webhookrelay/client"
    system "make build"
    bin.install "cmd/relay/relay"
  end

  test do
    system "#{bin}/relay", "--help"
  end
end