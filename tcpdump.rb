require 'formula'

class Tcpdump < Formula
  homepage 'http://www.tcpdump.org/'
  url 'http://www.tcpdump.org/release/tcpdump-4.2.1.tar.gz'
  md5 'c202878c6db054767b52651041b9e60e'

  head 'git://bpf.tcpdump.org/tcpdump'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-ipv6",
                          "--disable-smb",
                          "--disable-universal"
    system "make install"
  end
end
