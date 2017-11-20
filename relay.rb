require "language/go"

class Relay < Formula  
  desc "Client for Webhook Relay service - receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://github.com/webhookrelay/client.git",
    :tag => "0.4.1",
    :revision => "7b3196cabdd87a54f12e18137db5ab40f5a6cdce"

  head "https://github.com/webhookrelay/client.git"

  depends_on "go" => :build

  def install    
    contents = Dir["{*,.git,.gitignore}"]
    gopath = buildpath/"gopath"
    (gopath/"src/github.com/webhookrelay/client").install contents
    ENV["GOPATH"] = gopath
    ENV.prepend_create_path "PATH", gopath/"bin"

    cd gopath/"src/github.com/webhookrelay/client" do
        system "make", "build"
        bin.install "cmd/relay/relay"        
    end
  end

  test do
    system "#{bin}/relay", "--help"
  end
end
