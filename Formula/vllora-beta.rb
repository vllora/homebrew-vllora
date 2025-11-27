class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.11-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-2/vllora-macos-aarch64"
      sha256 "bf66839f1f9eaf0a38ade1a939baf1eb19d48caa4771fdc637d1756e099ee14b"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-2/vllora-macos-x86_64"
      sha256 "081469793788380855ea1307748ea7dc304811d0471a889dd21b635c24981b83"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-2/vllora-linux-aarch64"
      sha256 "c6b9abb23b404f7d640addb752059d2352b5a3e588c855515f98179ba0c3c17b"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-2/vllora-linux-x86_64"
      sha256 "0d2399fc9bb25e410ab9672da2c6b4054578780b57d36b6378e16d500538527e"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora-beta"
      else
        bin.install "vllora-macos-x86_64" => "vllora-beta"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora-beta"
      else
        bin.install "vllora-linux-x86_64" => "vllora-beta"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora-beta", "--version"
  end
end
