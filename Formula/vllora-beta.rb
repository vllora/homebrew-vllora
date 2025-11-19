class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.9-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.9-prerelease-1/vllora-macos-aarch64"
      sha256 "5f911dff0e1dca711b9162e58d556e342ac2443c8bc7290fcd6e6c008e0caafd"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.9-prerelease-1/vllora-macos-x86_64"
      sha256 "0122e798bb621f41f55d1ba7a6c581a9f529a3e5155d573b69c559a21e9ef556"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.9-prerelease-1/vllora-linux-aarch64"
      sha256 "764cf6b40ac1f9509c041a2bbccf12f527caea5840be0556c007353986f74a32"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.9-prerelease-1/vllora-linux-x86_64"
      sha256 "925febb20fac69ac73bd17f371603ce38bdf1a85ecc285f60fc971b9183dc123"  # Run: shasum -a 256 ai-gateway-x86_64
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
