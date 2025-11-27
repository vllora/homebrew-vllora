class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.11"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.11/vllora-macos-aarch64"
      sha256 "820642394cac9ffee427474903b1514f6bfb56862caf03aea68c1cf1c4e74da3"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.11/vllora-macos-x86_64"
      sha256 "29e3583b6e8c78d42b8e5f5f671ade0cec362681b92f4035cee33694792fd0d3"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.11/vllora-linux-aarch64"
      sha256 "2635a90e7828c21037a0677c7f6077134e6cb3ff83ea8dbce888ba28293ae8af"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.11/vllora-linux-x86_64"
      sha256 "591cce4e4e32acd333975a2c845b3e9141ba8770823c66b3171b54846f5debf9"  # Run: shasum -a 256 ai-gateway-x86_64
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
