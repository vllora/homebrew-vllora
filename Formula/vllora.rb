class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "1.0.0-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease-2/vllora-macos-aarch64"
      sha256 "8bcb87944409816aff6023c85e62e25296ef00d40feaebe0869e5b150a767b27"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease-2/vllora-macos-x86_64"
      sha256 "35a3fb019c9007d7623bd96383de46f4361e12e5ac13bbab50921e1013996161"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease-2/vllora-linux-aarch64"
      sha256 "7514938c3cd675f5d9f65eb7069ec8ae465456ae0d74bf386ffb0bc75cccbf06"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v1.0.0-prerelease-2/vllora-linux-x86_64"
      sha256 "59ee0d34f089f2ed47a6206b0a73feff893b86a86e411059d4bc6f4376cf755e"  # Run: shasum -a 256 ai-gateway-x86_64
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
