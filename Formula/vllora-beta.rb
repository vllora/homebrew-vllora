class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.22-prerelease-4"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-4/vllora-macos-aarch64"
      sha256 "413061360f3a0deb3d1fe59edd2373c317b7ca3935208145e3f5727e8563568d"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-4/vllora-macos-x86_64"
      sha256 "cb2e95aade1570a6298e283ca66e850a0324c60823d3a2ce95fa400df4d4f17f"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-4/vllora-linux-aarch64"
      sha256 "9b705e6cb4cf46f88f57c3e7860a8ec97b8f78e02a0c10f0d3db5606d3a6b976"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-4/vllora-linux-x86_64"
      sha256 "a0f82f8b4f77dfc24b31065f8d46a8b34d96f3bfcc1de72d8c0cebb76ab45f34"  # Run: shasum -a 256 ai-gateway-x86_64
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
