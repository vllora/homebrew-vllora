class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/langdb/vllora"
  version "0.4.0-prerelease-12"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-12/ai-gateway-macos-aarch64"
      sha256 "134b9fd2d53123c65eeabc15ff63f68043e5b869e47eb5641c66fe031e3e2ecd"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-12/ai-gateway-macos-x86_64"
      sha256 "28753b2dfc78f65d95d06f0003364b40d25a3f2bb21fed615018cb524c63e434"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
  #   if Hardware::CPU.arm?
  #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
  #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
  #   else
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-12/ai-gateway-linux-x86_64"
      sha256 "7aead4f8eb5685a96101cc068ce2a98103cc26078c96497d79c7a8f901252dc3"  # Run: shasum -a 256 ai-gateway-x86_64
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