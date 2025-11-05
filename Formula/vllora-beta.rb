class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.7-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-2/vllora-macos-aarch64"
      sha256 "9f08a686e34ac222d6bced29fc14e148b64552d1c0cdabde50ea25fbd84532c0"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-2/vllora-macos-x86_64"
      sha256 "242fc968e4e4e6e75519a581a5a85a9b4b1ef35bee23c5eb701fa3074b08c3cc"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-2/vllora-linux-aarch64"
      sha256 "33922a5aa5871c7cf718a6209bb1793874fe3caf3ae0d64646d4ac926c53770a"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-2/vllora-linux-x86_64"
      sha256 "7fe254d73cbf2292aa34632f89491d7e251e1745b719883d2e5e09e4531d402f"  # Run: shasum -a 256 ai-gateway-x86_64
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
