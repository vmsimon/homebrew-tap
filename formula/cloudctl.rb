class Cloudctl < Formula
  release = "0.12.11"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "17454501ec2041cf6914a34e77abb9cc597b627e4181bb8b025e0cee2a30ed66"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "a1c74f10e3310b58b6c0299326fc5eeca346567fa51c260cfe3f0ced38f5cb35" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "b6ed8ff1b38e48967d9d84b97dd65d8ef91ef0177e53b7532f88f641f9e3d251"
    end
  end

  def install
    bin.install Dir.glob("cloudctl-*").first => "cloudctl"
  end

  def caveats
    <<~EOS
    
        To activate completions, add the following to your .zshrc:

          [[ -e $(brew --prefix)/bin/cloudctl ]] && eval "$(cloudctl completion zsh)"
        
        There are also completions for bash and fish available.
        
    EOS
  end
end

