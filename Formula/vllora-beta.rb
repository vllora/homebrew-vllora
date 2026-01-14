class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.22-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-2/vllora-macos-aarch64"
      sha256 "69463578dff28dbc5ac6cd80b7f6e24181ab04898ffb8e5e8a847b4d3d506c02"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-2/vllora-macos-x86_64"
      sha256 "a825d6be1af882e3f8dea5a81bfc953c77fe4161477f812782773bf304eda87d"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-2/vllora-linux-aarch64"
      sha256 "8744623889e03d061925b96dbe3f02fd30a6693c2e09bbd0906209e785862c95"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22-prerelease-2/vllora-linux-x86_64"
      sha256 "725cdf7870ee5fe653dbc481c50f47d6a2c824abdf71566e88bf0004757b6bd9"  # Run: shasum -a 256 ai-gateway-x86_64
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
