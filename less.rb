require 'formula'

class Less < Formula
  homepage 'http://www.greenwoodsoftware.com/less/index.html'
  url 'http://www.greenwoodsoftware.com/less/less-444.tar.gz'
  md5 '56f9f76ffe13f70155f47f6b3c87d421'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/lesskey"
  end
end
