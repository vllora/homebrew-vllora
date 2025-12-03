class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.14-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-1/vllora-macos-aarch64"
      sha256 "b34612b3797935396d84745d6c90154acbb10aa57df67a6da6ffc892c79d5dc9"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-1/vllora-macos-x86_64"
      sha256 "accd2daf6f5adb39a2c1bf7f20f9aa1150fb2dc9a3b59b59125d0800d2e6db89"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-1/vllora-linux-aarch64"
      sha256 "d1581162510c7a4375c24ae8f93b8e41d5c6bee32525e6353208ef49102b9585"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-1/vllora-linux-x86_64"
      sha256 "ea154a5117ba983d007f1feb2c0bf4ae3debbf513239950efd7b7b529df8a6a7"  # Run: shasum -a 256 ai-gateway-x86_64
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
