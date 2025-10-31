class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "1.0.0-prerelease"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease/vllora-macos-aarch64"
      sha256 "59376a43c99c327ced8c2050856e67a59862ca1689bb973b08764cd79e15d66b"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease/vllora-macos-x86_64"
      sha256 "20db33560c5a0b40befdd09cb45cd02e677b677ad959333eb334c433cb79feb3"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease/vllora-linux-aarch64"
      sha256 "18fcbb77d62d6df710e70a4da7d3b9a1c82ac3c4b175a1b384bfa33546cd9b31"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease/vllora-linux-x86_64"
      sha256 "da1912b864f16e41806bbc6a2eb0741d248d85a470eaeefaee577ab2278d3b83"  # Run: shasum -a 256 ai-gateway-x86_64
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
