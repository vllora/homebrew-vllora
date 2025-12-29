class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.21-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-1/vllora-macos-aarch64"
      sha256 "607682c7cd0c49e2e33507ddf5954b80cf28dbe033448328e1c1203028007380"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-1/vllora-macos-x86_64"
      sha256 "d8ee111eaa5d136dd506338b81b50a9fb2dd0a4223cafc9809cc28170112c97a"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-1/vllora-linux-aarch64"
      sha256 "2add1020462ce5e24b7ceb04d3dcbc7db00f6a44e0eeef7095b336a3366c635f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-1/vllora-linux-x86_64"
      sha256 "2b2e9d3c74e0cad1b517cbb6ad306bccaa729ff803980249495dbbf1924c3dbb"  # Run: shasum -a 256 ai-gateway-x86_64
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
