class Cloudctl < Formula
  release = "0.14.11"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "e2b1b530712eb50b86107429a3764db866ec14296e4b4c86dc52946fb785c9e0"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "88fbc7af974f968d2b4f9d08cfbfedfdf341ecc387d7b1974ec7ccbd0efb97f7" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "cf91c1552d8c13f85df59df8105d2d2d78edfb4a4b0eb2ca2d6931b51dce4d81"
    end
  end

  def install
    bin.install Dir.glob("cloudctl-*").first => "cloudctl"

    chmod 0555, bin/"cloudctl"
    generate_completions_from_executable(bin/"cloudctl", "completion")
  end
end

