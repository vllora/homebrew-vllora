class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.13"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.13/vllora-macos-aarch64"
      sha256 "3a98fe35649f6cc1fef9802ee99a141a1f75a4984b117afb37172de61d85d826"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.13/vllora-macos-x86_64"
      sha256 "a11c9ffdd2b3bc740bfea54fbedb069a67b23495cc457cb6f92101c3f32af1e0"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.13/vllora-linux-aarch64"
      sha256 "bc24b78ed532f820896b01bf7a581afb898840177d61080d65b23b0aa6358ce2"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.13/vllora-linux-x86_64"
      sha256 "f2af6c3fed180b3a5d421ab368688975ea5d5609bee801c6e1c1f84209ad9514"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora"
      else
        bin.install "vllora-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora"
      else
        bin.install "vllora-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora", "--version"
  end
end
