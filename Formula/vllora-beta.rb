class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.0-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-2/vllora-macos-aarch64"
      sha256 "c1a85554cc0eec40e88f55b3d6e0e17d27eb413c7959f4de04fe65243614fc12"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-2/vllora-macos-x86_64"
      sha256 "b93d4c54792959bc31044280cc272e8001efccfd70c24157cfe1fa456c02ece8"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-2/vllora-linux-aarch64"
      sha256 "8c241fcef552f1777237c2b27beb5865c1781c4eec6449ac748650cb49f0a4be"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-2/vllora-linux-x86_64"
      sha256 "baf407e8370fbf4c05a6842ec79e18f6f997e79c69bac5750921f3bd8f53abc9"  # Run: shasum -a 256 ai-gateway-x86_64
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
