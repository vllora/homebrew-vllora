class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.10-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-1/vllora-macos-aarch64"
      sha256 "2b53e3eb95bf23e859240fe63b5f30202052b778af0d4ff70f0e61ba55b7f5c7"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-1/vllora-macos-x86_64"
      sha256 "7eaac316ec427253f25b05ca5bc53f8d743092ae64fea79f2b253173d94c5375"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-1/vllora-linux-aarch64"
      sha256 "5f8297bea83c6ff0a697b48c0d641c8b0eb7cf47519c4c5a484bdc11b3498472"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-1/vllora-linux-x86_64"
      sha256 "43ca41fd431f74c492b10e0c1f26c4104898121c861ee41863b1e9740bde5a85"  # Run: shasum -a 256 ai-gateway-x86_64
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
