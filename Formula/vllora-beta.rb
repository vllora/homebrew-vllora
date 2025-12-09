class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.15-prerelease-9"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-9/vllora-macos-aarch64"
      sha256 "eb6d4d6ea55ad620ec8b3ea3c1deba0dfad30020b6f2240ab071f61c1ae0b616"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-9/vllora-macos-x86_64"
      sha256 "243cc6b224d6ea6b439fc1ed0c71971989421e0a19a264e2d4a96d46531d6463"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-9/vllora-linux-aarch64"
      sha256 "d39060f1f034aa7770d5d04074ffe13e6ba2bd5381775a6b447135476c454138"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.15-prerelease-9/vllora-linux-x86_64"
      sha256 "5d28b24e6dd63a5e62310f2a9e1c045328915d78708a108b0641b98e750e2187"  # Run: shasum -a 256 ai-gateway-x86_64
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
