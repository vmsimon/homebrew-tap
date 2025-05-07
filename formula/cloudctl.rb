class Cloudctl < Formula
  release = "0.14.7"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "6971e340356282a2d661f1b15d8f2df255345aa549f63c54f74233976fd82398"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "b8526dcef76759aeebd51bbf07577bed281a7b286fc1eaaababc58713c73ed04" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "a14b7f3244e8579dc7595ee30b7657f7a0f4dcf02963e46c07cf23fa1be2775f"
    end
  end

  def install
    bin.install Dir.glob("cloudctl-*").first => "cloudctl"

    chmod 0555, bin/"cloudctl"
    generate_completions_from_executable(bin/"cloudctl", "completion")
  end
end

