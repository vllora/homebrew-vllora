class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.6"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.6/vllora-macos-aarch64"
      sha256 "515da8def8402becfa31399d94ca7f9f8e38410c8a65e85d29a28996efd1a827"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.6/vllora-macos-x86_64"
      sha256 "3a42c991425af2b4fc7d6af6c130012209c50089cce97ad759ef9a50d53ec91b"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.6/vllora-linux-aarch64"
      sha256 "28dd7f11d9c9a0ee9e0841b9628c00d693c23d4b290a620b64b21f18e8826ef3"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.6/vllora-linux-x86_64"
      sha256 "a2197ea76328cee2d9a28c753f2d6d6de80abb53532326c3d550a224d1f43eb6"  # Run: shasum -a 256 ai-gateway-x86_64
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
