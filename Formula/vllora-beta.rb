class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.16-prerelease-3"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-3/vllora-macos-aarch64"
      sha256 "6f211f7b6d6d6d68beef85142bd3d15ed9248e9a58c6adc221cc8cff40fe7eca"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-3/vllora-macos-x86_64"
      sha256 "3873fcce022147dc5b37dd7f21cb1374acf0d5c965b9b96c6c70bebfa95875ab"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-3/vllora-linux-aarch64"
      sha256 "4f05678df8d9485038e2d3327e01e2b408ec2c231b28487dd950fb2c03bc3ddc"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-3/vllora-linux-x86_64"
      sha256 "2ec3ad4491811b3c8bac333cb121be589a6ecdefb1c8e732bb2891db47a238fa"  # Run: shasum -a 256 ai-gateway-x86_64
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
