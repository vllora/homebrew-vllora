class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.12-prerelease-5"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-5/vllora-macos-aarch64"
      sha256 "fd7f5166d88e9a3e3506c39d13d6c49d05fb52e92bfe5225824e307c6f2c2c64"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-5/vllora-macos-x86_64"
      sha256 "2e610ac2f42b5ce06c6c7342dc304c2a09fe5472efb8554be87d48aff50b18cb"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-5/vllora-linux-aarch64"
      sha256 "f631be06f6cc422bb4d4057e371f8790143d87f5f3460df4953cdbf0fbb4a21b"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-5/vllora-linux-x86_64"
      sha256 "f49190fde944d1fb66448d3c728b9e44a10a6226ea7ed08a4ea95b79b3494467"  # Run: shasum -a 256 ai-gateway-x86_64
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
