class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.10-prerelease-5"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-5/vllora-macos-aarch64"
      sha256 "8ec16fecac0c3090d0d24193c6e0fb15be52e5133ff7fd5ea0ecf076c007f615"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-5/vllora-macos-x86_64"
      sha256 "2984e1550f3f86e886f99994132033210f0e20cb1728b91c80ca5353ce895572"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-5/vllora-linux-aarch64"
      sha256 "a67706928aa0396fd76540f7f3a75dcc89384f930bccb556803acd584d26be52"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-5/vllora-linux-x86_64"
      sha256 "3f0e453eb6e813510249695f135de5b2ca8a1e8591727fac9c7a597efe673ac6"  # Run: shasum -a 256 ai-gateway-x86_64
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
