class Cloudctl < Formula
  release = "0.13.0"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "3236a7daffb8ed11a69b22f5f2c60a1d4c1847cb50158c1d4da48867412003a8"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "b6d637a7a040d09a9e66990c5cf66b4a339dce2a7ce396b89074a0bf3f939b1c" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "f944dbff080aeb967606bdadfdadc148c516695c88e07ff32d34881fac1f229d"
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

