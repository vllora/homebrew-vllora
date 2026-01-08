class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.21-prerelease-36"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-36/vllora-macos-aarch64"
      sha256 "7102872915ab82f31a4d52c5cdb55056f821faa235d0c68e6741bf9d0186d65f"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-36/vllora-macos-x86_64"
      sha256 "27a603e75c6826a1381d14e0d9a4ca817be9348bdfa8c3e74c8831aa758a23d7"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-36/vllora-linux-aarch64"
      sha256 "af1cfeb58b85788014da72a01add38145a71e2d5dff0f683032a047aa988f367"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-36/vllora-linux-x86_64"
      sha256 "ecac3554f0bdc4072c755abbba695dc83671070ead1c907f83438bb92b61e4dd"  # Run: shasum -a 256 ai-gateway-x86_64
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
