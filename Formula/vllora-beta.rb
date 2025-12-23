class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.20-prerelease-8"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-8/vllora-macos-aarch64"
      sha256 "2d99859a12263b7c20a651bd8cc121d246f2167abb3fefc0f55e9b2c9cbf9822"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-8/vllora-macos-x86_64"
      sha256 "a9391fd1000aea0d26602bc8740c1b21b8b5594988fec81c33a35f7abec6e2a1"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-8/vllora-linux-aarch64"
      sha256 "f57e3144fe908c87f50a5e07531907dfb791343c0cbe7bdde0c3fe9e714672ae"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-8/vllora-linux-x86_64"
      sha256 "d6b639b2f2067c8091ed5d84165ac000c3f78cb8181cbf8f37386d11feee1042"  # Run: shasum -a 256 ai-gateway-x86_64
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
