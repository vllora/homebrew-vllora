class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.14-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-2/vllora-macos-aarch64"
      sha256 "3aca23b74350e3f51b67a13add117e6ca6e1681b1b838c0cc9b9ea051b253ab5"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-2/vllora-macos-x86_64"
      sha256 "b6dd4c266dac1df2f4a8dec8da3ddf94552a9377fb1bdb26f70567bceba71ef3"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-2/vllora-linux-aarch64"
      sha256 "8b2eab5ba7fe54b142f4353b9cb5b2b09d5300d96139986a9c854244e1892aec"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-2/vllora-linux-x86_64"
      sha256 "8fac284d7943ab2d3e019e9503ba304715fdc1e9297a0d3f0fcc057aae2b4ebb"  # Run: shasum -a 256 ai-gateway-x86_64
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
