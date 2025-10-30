class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version ".4.0-prerelease-30"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v.4.0-prerelease-30/ai-gateway-macos-aarch64"
      sha256 "ecfdca5b04e13f3c3caad8d9c7240c554b35d993ff8d4af08020fdf9a406e297"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v.4.0-prerelease-30/ai-gateway-macos-x86_64"
      sha256 "751028385c02fec818d71c80da699cf2863de8698b7900c3358cdf3443d4cf64"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v.4.0-prerelease-30/ai-gateway-linux-aarch64"
      sha256 "4117958557d9a5254cda5648402b649f5f08cf1af5cc6e920874d3bc1e68d617"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v.4.0-prerelease-30/ai-gateway-linux-x86_64"
      sha256 "34bf406e8e8737c53b658b01b699f3b9d9a2a548132dbf98e1fa06920932b9f9"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-macos-aarch64" => "vllora"
      else
        bin.install "ai-gateway-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-linux-aarch64" => "vllora"
      else
        bin.install "ai-gateway-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/ai-gateway", "--version"
  end
end