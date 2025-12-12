class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.17-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-1/vllora-macos-aarch64"
      sha256 "d734a1538578e8ccba6585e76415445040e1448c97d3580687afa3943c217342"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-1/vllora-macos-x86_64"
      sha256 "3c5f2421464b7ee51739eef5a82eddfbedf4dd8a5828d7ecc21aa01840b16de3"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-1/vllora-linux-aarch64"
      sha256 "91740de353cb4ccc1c041f1fa1c1e5da98303fcd05b048ab517f63cd5a652488"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-1/vllora-linux-x86_64"
      sha256 "d5b0f6e141b3ef04063e9af75083a4f09545d605a822de75936b08ada1b02013"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora-beta"
      else
        bin.install "vllora-macos-x86_64" => "vllora-beta"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora-beta"
      else
        bin.install "vllora-linux-x86_64" => "vllora-beta"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora-beta", "--version"
  end
end
