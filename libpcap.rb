require 'formula'

class Libpcap < Formula
  homepage 'http://www.tcpdump.org/'
  url 'http://www.tcpdump.org/release/libpcap-1.2.1.tar.gz'
  md5 '06046e0e81efc60566daf1cc96c77d46'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-ipv6",
                          "--disable-universal"
    system "make install"
  end
end
