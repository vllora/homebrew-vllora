class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.14"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14/vllora-macos-aarch64"
      sha256 "f7963f1eee4aa373b51460d54ffc73c7183bdd25b376cdf9b22dc2e14357282f"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14/vllora-macos-x86_64"
      sha256 "ea6482dcb828e791310de06f1061145354edf36f2f68a0f207f0a50cfa6ae9f4"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14/vllora-linux-aarch64"
      sha256 "397b8d822241dc8091e1c37f283d07a6bad28b846d18bb2cfb044b0669af65d8"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14/vllora-linux-x86_64"
      sha256 "79a43a8d30ee625a084f82cac32e60489c4efc8a578340336d4819cbe72bbb8b"  # Run: shasum -a 256 ai-gateway-x86_64
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
