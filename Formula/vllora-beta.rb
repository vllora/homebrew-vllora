class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.21-prerelease-23"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-23/vllora-macos-aarch64"
      sha256 "1ea228a27ef4e0d4909967411e8e48de297e99615d3adc8fdcbf6d752a1def06"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-23/vllora-macos-x86_64"
      sha256 "b9c78c87de743e4d8c44af377bf25c307bf398d1f53c6e02f3c3601950acb120"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-23/vllora-linux-aarch64"
      sha256 "6c542302c28340b50c366eb9f470521cc696763cd80459bda517c4de12880e6a"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-23/vllora-linux-x86_64"
      sha256 "40a6fba42b97bdb9cb71c96f3fcb3b14ff2487faf06f0f91e306afbb222ed7c2"  # Run: shasum -a 256 ai-gateway-x86_64
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
