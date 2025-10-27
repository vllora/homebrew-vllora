class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/langdb/vllora"
  version "0.4.0-prerelease-13"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-13/ai-gateway-macos-aarch64"
      sha256 "828ed32f9b137e6eebd3dbaf1fda221765cfdc8ab681b75d911ccb48392ad6af"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-13/ai-gateway-macos-x86_64"
      sha256 "09f6b632e8255c9775c8db807d5a3f24d8a6a7a2fb83b456ae5708aef2c61baf"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
  #   if Hardware::CPU.arm?
  #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
  #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
  #   else
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-13/ai-gateway-linux-x86_64"
      sha256 "acb338e3bccf1ed8bc17b93c3a5918fa7a6e9fad7ddced2e2223b29946c3808c"  # Run: shasum -a 256 ai-gateway-x86_64
  #   end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-macos-aarch64" => "vllora"
      else
        bin.install "ai-gateway-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      bin.install "ai-gateway-linux-x86_64" => "vllora"
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