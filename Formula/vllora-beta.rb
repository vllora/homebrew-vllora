class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.16-prerelease-4"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-4/vllora-macos-aarch64"
      sha256 "25c30cc40af10881c407a34ef1ee6c0f356edc1c46cc7b70c6c9dfac03a8e2f9"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-4/vllora-macos-x86_64"
      sha256 "6fdb97e039213206276abd85f19a374a4bee39960a9aa1d5bc3a82fe4e01a343"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-4/vllora-linux-aarch64"
      sha256 "e2190aabac979b3231758cbbf29ab912f868b4d0aa977b575c42b666cdec392c"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-4/vllora-linux-x86_64"
      sha256 "09a0135137d3438827cdd9ee36b9d4cd693ddcdd53cb57d37e50edda8379c430"  # Run: shasum -a 256 ai-gateway-x86_64
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
