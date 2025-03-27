class Cloudctl < Formula
  release = "0.14.6"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "fb068b8358fe9b3680fc4556dd6ea8a4b420a1c8ebb59646045dcc9879718ade"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "a63cb75b410c2d6c8897b7d96ed696e58bf603d043fc335ef9ce132069b23cf9" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "6f6214c6329b4fa5044d373e9ee69e3032913354cb8d8418df0827b1f261ccde"
    end
  end

  def install
    bin.install Dir.glob("cloudctl-*").first => "cloudctl"

    chmod 0555, bin/"cloudctl"
    generate_completions_from_executable(bin/"cloudctl", "completion")
  end
end

