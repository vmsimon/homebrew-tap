class Cloudctl < Formula
  release = "0.14.1"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "1e8be6d8589522f5cb0cb497a8b7706aed97005fef46d7e0fe64fc3676ac6f49"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "df1e5e090b31b17ce458f0be7f194a0f2ecf63be66a7cedbfb0ee00d83f8fdb1" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "d4bec306fee3625cf09e87f0a4267d012fe77e3d35ebc48beba6f0044fb6d285"
    end
  end

  def install
    bin.install Dir.glob("cloudctl-*").first => "cloudctl"

    generate_completions_from_executable(bin/"cloudctl", "completion")
  end

  def caveats
    <<~EOS
    
        To activate completions, add the following to your .zshrc:

          [[ -e $(brew --prefix)/bin/cloudctl ]] && eval "$(cloudctl completion zsh)"
        
        There are also completions for bash and fish available.
        
    EOS
  end
end

