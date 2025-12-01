class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.12-prerelease-9"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-9/vllora-macos-aarch64"
      sha256 "7675fb8a89ac09b63f48812d58024a027a058716b442f90738aca6699756bdee"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-9/vllora-macos-x86_64"
      sha256 "c790ba55a2576da691411354c48526db4221599837170024603eb94966afc046"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-9/vllora-linux-aarch64"
      sha256 "3e268321c67487e33a010e0d14f9e8c7cabe87959679240f925ec85b90505fa2"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-9/vllora-linux-x86_64"
      sha256 "77857cc275718b141a0aba3654a6baf1b1ea9e599acfb90f3a11445f8426a432"  # Run: shasum -a 256 ai-gateway-x86_64
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
