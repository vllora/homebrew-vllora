class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.7-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-1/vllora-macos-aarch64"
      sha256 "67efa32e374f6d8d7f91f0b2dce00167e7de8ec5a77fa6b1681e1f631dc47657"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-1/vllora-macos-x86_64"
      sha256 "77dafda249db082ca0baea5d1fe8108cd4447d32f5941b18d2d71f45f48a7c54"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-1/vllora-linux-aarch64"
      sha256 "eab4fb2338110477fcb0daa3d6959d7157f20309169455b63e6a7ad82dcac30e"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.7-prerelease-1/vllora-linux-x86_64"
      sha256 "e18669ea6f842592476ad01890182700321feaf8bf3fcf5dfcca71b0fb1005c0"  # Run: shasum -a 256 ai-gateway-x86_64
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
