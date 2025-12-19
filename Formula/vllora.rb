class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.19"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19/vllora-macos-aarch64"
      sha256 "f79286c821d7f22d7b160f431cb3a79be97f29371e41e7f55041cf38d93ffd26"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19/vllora-macos-x86_64"
      sha256 "248aa47f3fe2def9a70d8d873ef5c2163c89258cf6e975eab79373d450c364b6"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19/vllora-linux-aarch64"
      sha256 "f6d8a5fff96db0e6474ac13587d5b0fcbf278862d481e0ed6dca330a1d9d01cb"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19/vllora-linux-x86_64"
      sha256 "5fe20dc5df4ebd344cb2668e64169cc23cf39b5c7d1183e22515f1950adb6293"  # Run: shasum -a 256 ai-gateway-x86_64
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
