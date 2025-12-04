class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.14-prerelease-5"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-5/vllora-macos-aarch64"
      sha256 "7cf20bd64d4adbd644125aff876de28e27e38ea58075ea70cb15475577fccf2b"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-5/vllora-macos-x86_64"
      sha256 "c61a61a3846b7797aa7076820e995486e41e2b6b08917d1ffad0092817259a5f"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-5/vllora-linux-aarch64"
      sha256 "6164a50ac134c7d64cdfadfbe7b247fb83a56f43530cdda655cd7c4f85a65fd1"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-5/vllora-linux-x86_64"
      sha256 "8b550fa6d5ba429bf5b25a1604fc7759c67a483be91600b078404ba889ea1df9"  # Run: shasum -a 256 ai-gateway-x86_64
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
