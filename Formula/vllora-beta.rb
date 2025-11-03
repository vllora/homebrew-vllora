class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.0-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-1/vllora-macos-aarch64"
      sha256 "4397217f89b4a39a2dc1feed21917e58a6cdc2605434649a0049146d0c99d315"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-1/vllora-macos-x86_64"
      sha256 "bff74d1ca62bc02b83ef1b19f0e3790d267ec3f4499f9c04022ddbd18d8eb860"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-1/vllora-linux-aarch64"
      sha256 "a9415d75981582d4dc701ab11ce0dae9f2e0295b29d4d7c30fa77cb49f1494d4"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-1/vllora-linux-x86_64"
      sha256 "b799af639fe2c2d61f9b82e552b1c01c6f3c57aabdcb79f6f93e39cd989e070e"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora"
      else
        bin.install "vllora-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora"
      else
        bin.install "vllora-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora", "--version"
  end
end
