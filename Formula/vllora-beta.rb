class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.12-prerelease-6"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-6/vllora-macos-aarch64"
      sha256 "96f04b2db78f256d6c66b1dbcff1eac055b4ba7564376bdf1f4188c67d84015c"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-6/vllora-macos-x86_64"
      sha256 "24c36053d15330a16d19df548748db4115928e3b98a283c8ed301ab5c31e5277"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-6/vllora-linux-aarch64"
      sha256 "1f38c97f1c215ee7df74bf08a546a55979f5760b670d856cb007406c36925a55"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-6/vllora-linux-x86_64"
      sha256 "fa08ca79724b7c1f22ff2395ffb0c080ac0cb716fa94a47671dacd73db28aab4"  # Run: shasum -a 256 ai-gateway-x86_64
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
