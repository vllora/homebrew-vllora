class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.18-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.18-prerelease-1/vllora-macos-aarch64"
      sha256 "bcdd7f6912f1570b2159764ddc02eeff0b90e04699d0a30edf11857acbb3f6ab"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.18-prerelease-1/vllora-macos-x86_64"
      sha256 "4a7a12d36fef57c9faf97542938df3aa9217ad11fc44b0f20e9dbe8f0ff598ad"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.18-prerelease-1/vllora-linux-aarch64"
      sha256 "14139f52ac75ad2b24d137ee54adc3593439c377e60814a48f4bca13fdfc0257"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.18-prerelease-1/vllora-linux-x86_64"
      sha256 "fabe43893805975265f3214ecdd51769579ca8681ced7b4f45e25c2d4021e295"  # Run: shasum -a 256 ai-gateway-x86_64
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
