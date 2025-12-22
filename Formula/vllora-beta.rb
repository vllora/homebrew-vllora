class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.20-prerelease-4"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-4/vllora-macos-aarch64"
      sha256 "8649f02316791aeac6a3b669c5ef8fccc2eb5d7b92e23771c3b5c00bbc1b30d6"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-4/vllora-macos-x86_64"
      sha256 "2d327d98ad13d23ab33d1b99d3b684c82feb1fd35c2b1494d60aaa345c8b99a6"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-4/vllora-linux-aarch64"
      sha256 "3f303c1103213adede8a2802c63b49777518a7b4c8254fa39a05033766ee37cc"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-4/vllora-linux-x86_64"
      sha256 "d17b47f23adbc64b77778dd17e28c55efb9649a0979cad0409491be324999fb4"  # Run: shasum -a 256 ai-gateway-x86_64
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
