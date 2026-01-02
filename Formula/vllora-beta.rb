class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.21-prerelease-16"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-16/vllora-macos-aarch64"
      sha256 "b181b2e4e9561453cf57f23f2ad97637302197392cc133f920107821a2989c08"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-16/vllora-macos-x86_64"
      sha256 "9c40dda3d3a66628c96adf4954adb4ff3be76933892a9b30e8771962ab3e4aea"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-16/vllora-linux-aarch64"
      sha256 "3f910a20695dad02ac9bcab72377d78024484a56a109a20ff4d7f929fe08a107"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-16/vllora-linux-x86_64"
      sha256 "94c67309f6b2d6dae83bdfd030dfd02fcd4a30f2f2c3698a5ef7026c0dec3349"  # Run: shasum -a 256 ai-gateway-x86_64
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
