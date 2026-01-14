class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.22-prerelease-3"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-3/vllora-macos-aarch64"
      sha256 "e3da319e706ad1ad2f8908e53cd54bcce2b73270c6c9f8bf459eab105d897c0e"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-3/vllora-macos-x86_64"
      sha256 "280403ac6a8fe8b23b56343044ac01c64e13dfd6864ea41fd9d6ad5e85f4546b"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-3/vllora-linux-aarch64"
      sha256 "4ec6cc6233f3489769889a751d59bfa01598447af50668183aacc7ba4d32dbea"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-3/vllora-linux-x86_64"
      sha256 "80e8c71c37e58edf6dbefd70a7d6740368c0d79abd6b71ca5c3ac5adaaf3a712"  # Run: shasum -a 256 ai-gateway-x86_64
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
