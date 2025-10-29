class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.4.0-prerelease-26"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-26/ai-gateway-macos-aarch64"
      sha256 "732e0e5e01103d3fd16fa1d124735c66319d8771b0f65c9f4f3878cb9b7e6293"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-26/ai-gateway-macos-x86_64"
      sha256 "05b72e366b307e48e5901d715ef4e2b017ecee4da0b8c781462f46cfbeb1ab7a"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-26/ai-gateway-linux-aarch64"
      sha256 "49aef94a80b0dc08eafcb7ccc554d09b27c1b7ff537fcb97d9ec25bf969d36ca"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-26/ai-gateway-linux-x86_64"
      sha256 "f7247c7e80c56b73a7bdf9ac9987b1cd57bff7c9107cb437211d358d108046e5"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-macos-aarch64" => "vllora"
      else
        bin.install "ai-gateway-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-linux-aarch64" => "vllora"
      else
        bin.install "ai-gateway-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/ai-gateway", "--version"
  end
end