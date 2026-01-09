class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.21"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21/vllora-macos-aarch64"
      sha256 "0bedc7d0c2f04e3386705a5de3c8f8418e98d2fc13a3ec2b97ad78450136d040"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21/vllora-macos-x86_64"
      sha256 "542bb04cd50442e674b229c7aba600b58f3760982f7485dc98bc51e370ca1627"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21/vllora-linux-aarch64"
      sha256 "67c92b9878fbcaa697fc0ab0d3f834e3eb116997012566c87090f61353e97af6"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21/vllora-linux-x86_64"
      sha256 "1167ce9c4288244720e4a91ab17e1e35f9096fd5eb9920fccbded0df1b60e7d6"  # Run: shasum -a 256 ai-gateway-x86_64
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
