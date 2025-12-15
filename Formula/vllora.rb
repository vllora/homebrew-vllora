class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.18"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.18/vllora-macos-aarch64"
      sha256 "5a5b6144ae7f2c83a4b86b1540ce0b853c70d58a2502bcfab3dc98a0b232b8e1"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.18/vllora-macos-x86_64"
      sha256 "de7e653e2a929af96e4c21c01f6b2c21f3c52aaa4c59069b6ebe2e5ca670c8c1"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.18/vllora-linux-aarch64"
      sha256 "36830820c54651d770e0d471e947b3a6092a802cd8c76cf5e0fe007453f81d61"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.18/vllora-linux-x86_64"
      sha256 "84455389a36d379edf07bf6dad86780406218cd36c867261d58c6c4aacdd4f6e"  # Run: shasum -a 256 ai-gateway-x86_64
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
