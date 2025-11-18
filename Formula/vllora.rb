class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.7"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7/vllora-macos-aarch64"
      sha256 "69fabcda0fd02b608b101d858a16f407f4c6c67f7927dadd92a4df96386e5ca9"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7/vllora-macos-x86_64"
      sha256 "4633bc234d333505cfde65d785c1e00c589d552a2628c6852581863f4615bb7d"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7/vllora-linux-aarch64"
      sha256 "e9ff903368b549833a8240b6aac74cd9e7d07915c073b455055596265d99800b"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7/vllora-linux-x86_64"
      sha256 "24cee23280a0785987f3fb7ce637d94895a9e9db6d3c19d553a5c970679fd620"  # Run: shasum -a 256 ai-gateway-x86_64
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
