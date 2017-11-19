require "language/go"

class Relay < Formula  
  desc "Client for Webhook Relay service - receive webhooks behind firewalls and NAT"
  homepage "https://webhookrelay.com"
  url "https://github.com/webhookrelay/client.git",
    :tag => "0.4.0",
    :revision => "8d931a198badb35b6319c17aedff67785ad35f50"

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
