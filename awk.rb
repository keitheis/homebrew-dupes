require 'formula'

class Awk < Formula
  homepage 'http://www.cs.princeton.edu/~bwk/btl.mirror/'
  url 'http://www.cs.princeton.edu/~bwk/btl.mirror/awk.tar.gz'
  md5 'a7062ecade93dc4cb39190e48db9a51d'
  version '20110810'

  def install
    ENV.O3 # Docs recommend higher optimization
    system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
    bin.install 'a.out' => 'awk'
    man1.install 'awk.1'
  end
end
