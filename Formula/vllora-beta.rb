class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.10-prerelease-4"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-4/vllora-macos-aarch64"
      sha256 "04a3077081b497789d71f3fbf3bc2341338f798447ecca6760dc724c134bb23f"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-4/vllora-macos-x86_64"
      sha256 "aa3893f0e06ce08edf12502e2337f675bdc91a0b4f0dd0363297750ac5c2b521"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-4/vllora-linux-aarch64"
      sha256 "be784fdc106a2cc21012a26279899c8149905f440660dca7733fa98750895442"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-4/vllora-linux-x86_64"
      sha256 "5ada8d9cb674dab93cd2ddffa58b40e89cf664d5d9fb6fb00f87554f8681a153"  # Run: shasum -a 256 ai-gateway-x86_64
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
