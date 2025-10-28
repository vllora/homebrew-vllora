class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.4.0-prerelease-18"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-18/ai-gateway-macos-aarch64"
      sha256 "156742a4fc74c29e998147915390b2fc6a02b0b7cf8b598251dff9841e1f7b24"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-18/ai-gateway-macos-x86_64"
      sha256 "407c950d7098b604e327ded0a9184478492dc51547833877de76457a903724ec"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      # url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-18/ai-gateway-linux-aarch64"
      # sha256 "placeholder_linux_arm_sha256"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-18/ai-gateway-linux-x86_64"
      sha256 "c0526a59196258a2f94635512330bcf4d3779993177e005edf6e4c6241ff58e9"  # Run: shasum -a 256 ai-gateway-x86_64
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