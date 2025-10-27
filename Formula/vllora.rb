=== Full Formula/vllora.rb Output ===
class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/langdb/vllora"
  version "0.4.0-prerelease-14"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-14/ai-gateway-macos-aarch64"
      sha256 "6e086846bb4265471947fe1041026052a5409895393118cf056c95aa1bbd7253"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-14/ai-gateway-macos-x86_64"
      sha256 "a9fc6ad3f2e84cbf25c0e9584a2edb58a8d924d3ee47305dc06a867a93102025"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
  #   if Hardware::CPU.arm?
  #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
  #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
  #   else
      url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-14/ai-gateway-linux-x86_64"
      sha256 "e2237cb7640701fc92d07bdfbe4f361e98e3884ee96404bb53fa9945340cfa4d"  # Run: shasum -a 256 ai-gateway-x86_64
  #   end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ai-gateway-macos-aarch64" => "vllora"
      else
        bin.install "ai-gateway-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      bin.install "ai-gateway-linux-x86_64" => "vllora"
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/ai-gateway", "--version"
  end
end