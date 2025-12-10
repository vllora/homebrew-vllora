class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.15-prerelease-12"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-12/vllora-macos-aarch64"
      sha256 "8b93a42422c1fad2787ff1a3a8af0e4da391edb17757a3d1a5e53acd4afbc114"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-12/vllora-macos-x86_64"
      sha256 "733cb905f62e7cd909f6495ec72c370f49af41dee99d4690877de3d2821c40b3"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-12/vllora-linux-aarch64"
      sha256 "a900d23924a6be9bc210960b56f9f71fb6f754105ffb30981a226b070d5602e4"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-12/vllora-linux-x86_64"
      sha256 "b3ead99570cf8aaca3b8ffe2eb112856e547be9486cda4392087388d550c4fe5"  # Run: shasum -a 256 ai-gateway-x86_64
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
