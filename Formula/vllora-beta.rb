class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.8-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.8-prerelease-1/vllora-macos-aarch64"
      sha256 "4029ec89f1f552c9d2373c943dab3356301ae4d9a0a0d51c4e9a64751a36d98e"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.8-prerelease-1/vllora-macos-x86_64"
      sha256 "defdac9cfdf2e50cc69623c142c3040675d527a41dc50dcb22e84b2ba88add34"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.8-prerelease-1/vllora-linux-aarch64"
      sha256 "e128ed4350f2708c01ee0d0e1d6c9aa432500fd88c72829f6e7627bff8f31f12"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.8-prerelease-1/vllora-linux-x86_64"
      sha256 "aba5906bb0b51516a10a32298375ce913cd697315400e171ccad702fc5c9532b"  # Run: shasum -a 256 ai-gateway-x86_64
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
