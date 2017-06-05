require "language/go"

class Relay < Formula  
  desc "Client for Webhook Relay service - receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://github.com/webhookrelay/client.git",
    :tag => "v0.1",
    :revision => "8ecd85ab259b5d373793aa3b5ac6f9910b315128"

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