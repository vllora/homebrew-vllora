class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.19-prerelease-5"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-5/vllora-macos-aarch64"
      sha256 "9f29e688eeac632fcc450a3b8e37629d2ce8f5dbb2d5c65ceb1614b5a2711a38"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-5/vllora-macos-x86_64"
      sha256 "1fe147b46904a7f3ee1663e54615953b5a59b6f314666110b9e4546eebc84e11"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-5/vllora-linux-aarch64"
      sha256 "ea01edf0b90b4fcd795642d038d60206d837727db76c81a1f75dbc55f805509e"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-5/vllora-linux-x86_64"
      sha256 "6102b854581a504064b7f8f8a3701d1bc54daae79ee2be2b9b5fc134344c67a5"  # Run: shasum -a 256 ai-gateway-x86_64
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
