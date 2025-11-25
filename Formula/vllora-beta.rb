class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.11-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-1/vllora-macos-aarch64"
      sha256 "e7ebc60d882af412e920119953f894b420fa4905085882ed45e0be03d60dfabe"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-1/vllora-macos-x86_64"
      sha256 "6b265d8b1e1af970f8403a934fe9d20356f81f5290120e9c1f03d8b6d092d9c2"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-1/vllora-linux-aarch64"
      sha256 "c827b71ce259056d010555b34f317714529a71fe57947451c2394f5d31a99b0a"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.11-prerelease-1/vllora-linux-x86_64"
      sha256 "ac78cfb50d040c58c4ca56d20c33075c9a14b90923f269a710bc634f87655608"  # Run: shasum -a 256 ai-gateway-x86_64
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
