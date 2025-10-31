class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.4.0-prerelease-35"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-35/vllora-macos-aarch64"
      sha256 "66e3bed1012b4879349cf44cabbe89abdde9f88b302d28a1deb01da1fa015e56"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-35/vllora-macos-x86_64"
      sha256 "7fe3e15bb21c034c3f009918845f04f0fbbe951916201a84c8303396fed9a0db"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-35/vllora-linux-aarch64"
      sha256 "d81d90b05d0989556c921cad3ddfb94d45e56fa024019bf57cc63ab9e7bbd17b"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.4.0-prerelease-35/vllora-linux-x86_64"
      sha256 "d0a1e1d66e7e502134df0b2146976a54d87269a9bceca6ada562bc735a778031"  # Run: shasum -a 256 ai-gateway-x86_64
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
