class Cloudctl < Formula
  release = "0.12.6"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "b722fc07052c7b7696b00850117192644d387d75d9c0cf4bdf6e03d1528bc2b0"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "695cd8598bad6613fd9b1a679613433904916c81a12c23aaced43bcb87128fc6" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "257ea3a9ff681d863b2fa02313639e257eff89f6e30bf6a84f9cc5ccebbe9566"
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

