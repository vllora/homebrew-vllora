class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.20-prerelease-3"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-3/vllora-macos-aarch64"
      sha256 "5b2d0cabc41cf49cf27793a8b45a0b5a412192fdd8b1177c4b7859639eecde02"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-3/vllora-macos-x86_64"
      sha256 "fbcffc9564ef1e4e068e6a7ed709cf1e177da5e508e7258d24db16811ebfca78"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-3/vllora-linux-aarch64"
      sha256 "2ed056fbeee64370716c6b81a97338c71ed8e13a523fdadf14538a08ec77351e"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20-prerelease-3/vllora-linux-x86_64"
      sha256 "e6da77ece7cb2c22de202248debd19e911e4cb0d5310cc9b2e8eee95a79b0a68"  # Run: shasum -a 256 ai-gateway-x86_64
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
