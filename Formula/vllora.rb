class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.5"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.5/vllora-macos-aarch64"
      sha256 "d8abfb6fc1ac09272a8c7127ef85e339dec8442dc9ef6a2333a6e9f87133decf"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.5/vllora-macos-x86_64"
      sha256 "5b6798505661748598c1dd63a247c8acdc070895b8845ca2df4f8296cfbc13bb"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.5/vllora-linux-aarch64"
      sha256 "5f11b1a844a4172a54e0a7c274818d591eba13c4c7b644677a996395f7b19ffd"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.5/vllora-linux-x86_64"
      sha256 "0dbc935f3473b1a5dc31e83f12d80abcf8c9c4cdd9c33b1ac2253afa2bc34188"  # Run: shasum -a 256 ai-gateway-x86_64
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
