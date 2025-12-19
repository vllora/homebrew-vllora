class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.19-prerelease-8"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-8/vllora-macos-aarch64"
      sha256 "ef0b08e36d4a6266e2c34f1cd166543ade6639c4048f579d13488f266f2885c6"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-8/vllora-macos-x86_64"
      sha256 "6813596e1364a531da3cad0ff84cd2a112e5cc2b40274e2c57091de534708acd"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-8/vllora-linux-aarch64"
      sha256 "6fe2355f0e56dbccafb581e9fe7c6058ecd0f03987be3b17f3a18e163a74eeee"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-8/vllora-linux-x86_64"
      sha256 "ad0910090da5ec9fbab13c1212b0a49e2d643c29d5094ac6dc9454e2a044b042"  # Run: shasum -a 256 ai-gateway-x86_64
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
