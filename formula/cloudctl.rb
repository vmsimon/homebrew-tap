class Cloudctl < Formula
  release = "0.11.13"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "80d7e3b8d6b50fc10dbf6e853fc388f060655e6c3e60929decad632f57d5431e"
      def install
        bin.install "cloudctl-darwin-arm64" => "cloudctl"
      end
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "29eb9f445bceadf338a51eedcb14bb8ee1e7d54e32d6c91a240b5b252618b60a" 
      def install
        bin.install "cloudctl-darwin-amd64" => "cloudctl"
      end
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "0b969610a349cc2ab8e0ccc0a97118492ff834bf63f839811ac72468e1835abb"
      def install
        bin.install "cloudctl-linux-amd64" => "cloudctl"
      end
    end
  end

  def caveats
    <<~EOS
    
        To activate the completions, add the following to your .zshrc:

          [[ -e $(brew --prefix)/bin/cloudctl ]] && eval "$(cloudctl completion zsh)"
        
        There are also completions for bash and fish available.
        
    EOS
  end
end
