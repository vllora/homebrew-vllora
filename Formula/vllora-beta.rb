class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.1-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-2/vllora-macos-aarch64"
      sha256 "5446a1f8c6630554128d891b89672cf7202d80e673262d8e8e7247708917495f"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-2/vllora-macos-x86_64"
      sha256 "4ef52a1d8b0ef4a50e4e83d21932ac0f0bf3b78ef78e218e10350dee51997890"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-2/vllora-linux-aarch64"
      sha256 "5e0ca8f0046eda7799f1b33550b99dc15f0ecd44df1a3f6053aa42268dd43f3d"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-2/vllora-linux-x86_64"
      sha256 "72f6d42b29ceb79e459a146f9c7385522b1dd69c41a7d21784da168a9dbec6ea"  # Run: shasum -a 256 ai-gateway-x86_64
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
