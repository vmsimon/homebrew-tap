class Cloudctl < Formula
  release = "0.14.5"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "754c0b8316c8d89025ff346db9578fd89c64d0c92476d46f524b3c514d53468e"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "af6c3bba74eb00b83965383cab82ee0d30816b1cfb9e7347e4ed6c61b2cc458d" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "e04201616f37a30257d630911a44614539d54ad5551eb4e89f7e6e11fdf78c69"
    end
  end

  def install
    bin.install Dir.glob("cloudctl-*").first => "cloudctl"

    chmod 0555, bin/"cloudctl"
    generate_completions_from_executable(bin/"cloudctl", "completion")
  end
end

