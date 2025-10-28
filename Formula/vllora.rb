class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.4.0-prerelease-21"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-21/ai-gateway-macos-aarch64"
      sha256 "a966075e84f6bc9b9696eec9a3b1e488f2ee3559d14720f2000574b8fffb91b7"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-21/ai-gateway-macos-x86_64"
      sha256 "400b8d328911609037e8ac075c3fbb6e9b651b0b714bb580af751e91c6e4bf97"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-21/ai-gateway-linux-aarch64"
      sha256 "placeholder_linux_arm_sha256"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-21/ai-gateway-linux-x86_64"
      sha256 "46aa860cbcdcdb9ca5e01eadd68ba7fafc8c2a3f8fa3d0b09b82e3ef9f860c59"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-macos-aarch64" => "vllora"
      else
        bin.install "ai-gateway-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-linux-aarch64" => "vllora"
      else
        bin.install "ai-gateway-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/ai-gateway", "--version"
  end
end