class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.19-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-1/vllora-macos-aarch64"
      sha256 "8a945f837b9fbeb23f561c849496bd6d4ca954256ba3ce753b6745cea2063257"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-1/vllora-macos-x86_64"
      sha256 "8577ec1d0ab6bf63f394b9f7fee16ee0bf4dfee7fe77c890e9e1a3e48e0e290f"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-1/vllora-linux-aarch64"
      sha256 "f14180d47bed638801a269cf859bde19d1e2eb65b7880785d1e920cbb9a1c3a3"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-1/vllora-linux-x86_64"
      sha256 "209f17ff1432485a66e811f0b9cd235d78ac28b4f30aedd8486deff70b3855ab"  # Run: shasum -a 256 ai-gateway-x86_64
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
