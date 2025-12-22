class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.20-prerelease-6"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-6/vllora-macos-aarch64"
      sha256 "d5c837e29a748af718f68752a4e0c5db5ed5e39ebf6b96506122f60517c55d23"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-6/vllora-macos-x86_64"
      sha256 "3bbcbd922ee1b2bd61d899a804023b2fa50b2ddd949aa4e6838ec9465dc47365"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-6/vllora-linux-aarch64"
      sha256 "858bc4fa0dd7fb1e4f70ae8718bb87606afc0d1ca1daa2b9834aa088ba60acff"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-6/vllora-linux-x86_64"
      sha256 "5eff393c640445ef0666f602893a0f917f107230ebdbaed4efd56804fef51447"  # Run: shasum -a 256 ai-gateway-x86_64
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
