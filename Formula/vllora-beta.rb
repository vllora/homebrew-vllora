class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.14-prerelease-3"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-3/vllora-macos-aarch64"
      sha256 "b610f5b289b13ce9ee320dd9d0baa483d90695d5befc4900148ef53144f25844"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-3/vllora-macos-x86_64"
      sha256 "52f3ed90c4e5d07846602f1bf3ce58245ed5bfad6e29b1a7a471c7a7e88ccd39"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-3/vllora-linux-aarch64"
      sha256 "3458cec8d3d19c7b90710303bf96db2224c02e26f9a19f21429e266d4716d162"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-3/vllora-linux-x86_64"
      sha256 "b007d78312418d3082a0df5d77e8e378ecd33b32fb962db1b9c33672da2c9239"  # Run: shasum -a 256 ai-gateway-x86_64
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
