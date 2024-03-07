class Cloudctl < Formula
  release = "0.12.17"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "67cedc407d9cbd520970e971e3143db0b014942c81ea0cb929ed903b1d254a64"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "f63e4c84a7f5a841f5a65cde25e63aa1564e0e6fffc4af360725f3971b30176b" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "da8645bee069d1fcfecc01cd2510ee8db6aca6a7a90117c0a94d7b87507f93cb"
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

