class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.15-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-1/vllora-macos-aarch64"
      sha256 "759e15c483dfebcb96683d8b0de3a2f7e38442ef7d60405e8455bc2569011796"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-1/vllora-macos-x86_64"
      sha256 "f2c9c588bf5f145ed4e8b1ed70570783cdc38f8f16216dc3a264923be34ffa39"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-1/vllora-linux-aarch64"
      sha256 "084bc1a0ab59140e5ffe95d8d6f037ae30a50129644500381857843031a606aa"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-1/vllora-linux-x86_64"
      sha256 "1e66d3e2d09223d9f5df182bcb2007e8f2b010fa1f394d177f441594d31a0c57"  # Run: shasum -a 256 ai-gateway-x86_64
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
