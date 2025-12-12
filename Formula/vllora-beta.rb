class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.17-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-2/vllora-macos-aarch64"
      sha256 "f898bdb3620f27f64cd282262670e61a0d05412531de04fdf8b973027e877533"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-2/vllora-macos-x86_64"
      sha256 "46570715d1c19db8faf5eb532bf7d371e13bb634dbc8a89fdff217e6604de4e4"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-2/vllora-linux-aarch64"
      sha256 "ac05f7bb750c05d547f51ad86ef99484773b482dcc1f6e417c1df689438a679b"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.17-prerelease-2/vllora-linux-x86_64"
      sha256 "c487713cf6edba6a4070a2cd577eb95588a149105d7143d9097deb4b0e491e48"  # Run: shasum -a 256 ai-gateway-x86_64
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
