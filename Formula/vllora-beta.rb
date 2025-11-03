class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.0-prerelease-3"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-3/vllora-macos-aarch64"
      sha256 "9e668f478fc4375212c07d6177016ca011f4723705498a188650bf44afec3016"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-3/vllora-macos-x86_64"
      sha256 "8bef963d8a3f2b4d1e70ab94ca837046870ee59ad92780b75c7c5ff268a3195a"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-3/vllora-linux-aarch64"
      sha256 "48258c4d2a105df8e3d41a8670b8f091eb89814feb6ade05f25afbc1c278c581"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.0-prerelease-3/vllora-linux-x86_64"
      sha256 "8484a5ae3f5b65e4dc8bc343c0432eb67f0e4a27dfee721d7a9f888c3678c064"  # Run: shasum -a 256 ai-gateway-x86_64
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
