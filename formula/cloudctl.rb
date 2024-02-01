class Cloudctl < Formula
  release = "0.12.13"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "6930fc602e5bc7652d7d4a3579f88de6eecf69ddc7c95ecd33713d4dbebd1494"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "b2c12bbfae91f729ebd886a3db653874e73c336eeb5a96f53e8a033c598cf05d" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "ab872618e8908cab2a924de96dddb6656db8c04303d5aa37a3e5658570401ba2"
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

