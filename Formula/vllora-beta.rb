class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.12-prerelease-4"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-4/vllora-macos-aarch64"
      sha256 "943751ec43c25024cebec43cd4ef449e3e32a5fcccc03b9e4cccdb937248cb66"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-4/vllora-macos-x86_64"
      sha256 "0f59262c6907e3c6e201d0ab454a798dcafebab1c5a273d9219ff783ae1417dc"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-4/vllora-linux-aarch64"
      sha256 "fec0d8875171280990fdbe0d860ecefe6b6639f97f44767f1b06f0818a6bde8f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-4/vllora-linux-x86_64"
      sha256 "381571b4d0c07034c18dd1527c80fe0578933bd79fb5a15474bc8986e427c564"  # Run: shasum -a 256 ai-gateway-x86_64
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
