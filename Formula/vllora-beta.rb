class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.10-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-2/vllora-macos-aarch64"
      sha256 "3944c84a01cd95d43a562b001b54480eaa9b9dcf32e1024ce025d6fc5a509863"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-2/vllora-macos-x86_64"
      sha256 "0c4a7cd4cd8c998b6c0195dcb5aae422448c256704ec78e28adbbfb8ba51400d"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-2/vllora-linux-aarch64"
      sha256 "d79d212009c47f049144dce27db93adb88662a07cd61a3fddba78bdb7a868703"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-2/vllora-linux-x86_64"
      sha256 "48aaf85e616b8cc0481426b03bce358627f683b22e2a3f35393f4a294f7497dc"  # Run: shasum -a 256 ai-gateway-x86_64
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
