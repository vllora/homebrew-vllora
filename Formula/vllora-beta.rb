class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.15-prerelease-11"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-11/vllora-macos-aarch64"
      sha256 "300797d137e7e133c95be290e614764366dce71db575036ffb42c6e892a92b09"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-11/vllora-macos-x86_64"
      sha256 "588e0e17ff1ac71aad522a9a44ccfba5b6d9a630de57fb8c12056a24025a8aa6"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-11/vllora-linux-aarch64"
      sha256 "f2d6c0aab8bcc960867d117e00830b3094432a8b87c1266918e81d36da35bc70"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-11/vllora-linux-x86_64"
      sha256 "df5a863cb4ddd20771727d7d1771983f0fee747b629de13a836e425b32833edd"  # Run: shasum -a 256 ai-gateway-x86_64
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
