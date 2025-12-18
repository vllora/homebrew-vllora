class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.19-prerelease-7"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-7/vllora-macos-aarch64"
      sha256 "1bf4acddd105fe684312021a5eb6c0201b8f8d36f817b919b6f6cf174cdbfee3"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-7/vllora-macos-x86_64"
      sha256 "8c9663c264e8980082f1737d8e57047f3a76f14616c17240c0ad2f0495937726"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-7/vllora-linux-aarch64"
      sha256 "4169bab719991bd0b452b3fade3f2663268717b0dd042adaca8ca804f29ed697"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-7/vllora-linux-x86_64"
      sha256 "85cc563e75b9fb73de0f028c0b8f670868608d1bc54c203c657fc7aefb8b975d"  # Run: shasum -a 256 ai-gateway-x86_64
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
