class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.7-prerelease-3"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-3/vllora-macos-aarch64"
      sha256 "9daa3c11aa26ed34c0d5bdd6443ac4c1cb923adebbedd3b351b934503573e125"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-3/vllora-macos-x86_64"
      sha256 "8b14c17f8aceb271b84d79d937cc9fbd376995a56687e5644400a7ac53d58083"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-3/vllora-linux-aarch64"
      sha256 "6fae5aa9995f5290c00a617c64f4c61984bbe1497d0c0267a5853b6053b3469b"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-3/vllora-linux-x86_64"
      sha256 "73015722bae849f0d7b1ede2075bd6b6770cb2d22c9ae4a2369f3ca8d77f8aa2"  # Run: shasum -a 256 ai-gateway-x86_64
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
