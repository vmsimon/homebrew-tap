class Cloudctl < Formula
  release = "0.11.12"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      def install
            bin.install "cloudctl-darwin-arm64" => "cloudctl"
      end
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      def install
            bin.install "cloudctl-darwin-amd64" => "cloudctl"
      end
    end
  elsif OS.linux?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      def install
            bin.install "cloudctl-linux-amd64" => "cloudctl"
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
