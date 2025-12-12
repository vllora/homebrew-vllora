class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.17"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.17/vllora-macos-aarch64"
      sha256 "ae1a95044485a549d42da9c909f75068638d1ddaf7c4c3daff0916236a39b199"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.17/vllora-macos-x86_64"
      sha256 "8aec08e4b0cbe0c02941042934f7780f455a7a7cef23c2fc695a76f2cae65036"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.17/vllora-linux-aarch64"
      sha256 "6ea48529d6204ece21b06e4beb2eb5f9ee11e0cdef5d5253baafc35e1ea074bf"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.17/vllora-linux-x86_64"
      sha256 "2dc7ee539766c9b9adc1d33e175e4888802860ca31f44a67c0a5453e7bcff8f2"  # Run: shasum -a 256 ai-gateway-x86_64
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
