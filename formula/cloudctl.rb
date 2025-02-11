class Cloudctl < Formula
  release = "0.14.4"
  desc "Commandline client for Kubernetes as a Service and more!"
  homepage "https://github.com/fi-ts/cloudctl"
  url "https://github.com/fi-ts/cloudctl/"
  license ""
  version release
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-arm64"
      sha256 "f41dc4260677011752cb527e96ff2fe63400fce059d8d499613746c3aac51efe"
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-darwin-amd64"
      sha256 "887683af55e2232d29f0ee9ad03d2b5ef0dcac41ca6811c75c4a6bf6a9f4c148" 
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      #atm not supported
    else
      url "https://github.com/fi-ts/cloudctl/releases/download/v#{version}/cloudctl-linux-amd64"
      sha256 "e48eea979cd7f29929e808f417c1e158c8487ccf68dd2304f645a35e9cec560f"
    end
  end

  def install
    bin.install Dir.glob("cloudctl-*").first => "cloudctl"

    chmod 0555, bin/"cloudctl"
    generate_completions_from_executable(bin/"cloudctl", "completion")
  end
end

