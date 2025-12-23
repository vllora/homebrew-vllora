class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.20-prerelease-7"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-7/vllora-macos-aarch64"
      sha256 "5a512570ed475f9ee443496adcdcca0c563f47caad055c28c47354439ea4cc47"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-7/vllora-macos-x86_64"
      sha256 "27f23c417939e93798c7b8f7e3307f697711901c32ce2d40cc917dd9c54ddab3"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-7/vllora-linux-aarch64"
      sha256 "aac74b12c4f527f57536b7c221a7d9803e61c21b1cc1d4a832877cc94cb214b6"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-7/vllora-linux-x86_64"
      sha256 "c4cfe31a6a61af6d67471cddb87494b2ea34404f9b8a0ee01529be9e4ba66ab0"  # Run: shasum -a 256 ai-gateway-x86_64
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
