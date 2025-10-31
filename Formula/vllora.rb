class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.4.0-prerelease-38"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-38/vllora-macos-aarch64"
      sha256 "47238698a8a460e09dfe2007e58b427768022055d7a5ac9100a9839474259c82"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-38/vllora-macos-x86_64"
      sha256 "a9a57cdcaa5f836799eb91a4e04d61426259f0beb354835d084783ae1405b402"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-38/vllora-linux-aarch64"
      sha256 "6ec7b8257ef8f56bde2f4d0e0a6f16107a2eed6ca3eb294cdf8b17f02135103f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-38/vllora-linux-x86_64"
      sha256 "cc8dde287cd67e982aeeecfabd220d768706a9f2f5c4c1b6a9c36ccdb60f5291"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora"
      else
        bin.install "vllora-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora"
      else
        bin.install "vllora-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora", "--version"
  end
end
