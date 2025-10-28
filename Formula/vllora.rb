class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.4.0-prerelease-25"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-25/ai-gateway-macos-aarch64"
      sha256 "30201cbe9c8830076123dc1c5e1ca03083f097d2fae77804e08221a9d77ec34c"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-25/ai-gateway-macos-x86_64"
      sha256 "c0e5aa8494cf2b01d04f3d38d219a806f093706912eea1421b7c78dbd7b3759f"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-25/ai-gateway-linux-aarch64"
      sha256 "0257ba7047a90c009765650ccacba648fb6e431b7b5235804eb1df1935c8c137"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-25/ai-gateway-linux-x86_64"
      sha256 "ec19f540bf9c1c71a99514abbe733e83aa2b5172ca210e1f35d7bba05eea1349"  # Run: shasum -a 256 ai-gateway-x86_64
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