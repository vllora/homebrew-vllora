class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.15-prerelease-10"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-10/vllora-macos-aarch64"
      sha256 "c1bdb0bd6a962d2e400f0727ea56acc61855d782ac9858bff4a02e2f438d8e67"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-10/vllora-macos-x86_64"
      sha256 "4155c570714699ba9b086e5d35d4855f8b03abae64b73b46f8a74f7c32edbcef"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-10/vllora-linux-aarch64"
      sha256 "4f1dd028baa7c107444872c90e65bf6a1168090b6d8dc61718284850f38cf46f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-10/vllora-linux-x86_64"
      sha256 "79630ac6eb49cff96a12ca25ed9ac715886cafa6f66c9882029140d61af17269"  # Run: shasum -a 256 ai-gateway-x86_64
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
