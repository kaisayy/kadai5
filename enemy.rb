# coding: utf-8

class Enemy < Sprite
  def initialize(x, y, image)
    super
    @dx = rand(2) * 2 - 1 
    @dy = rand(2) * 2 - 1
  end

  def update
    self.x += @dx
    self.y += @dy
    #self.y += 1
    #self.x += 1

    if self.x >= Window.width - self.image.width || self.x <= 0
      self.vanish
    end

    if self.y >= Window.height - self.image.height || self.y <= 0
      self.vanish
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish
  end
end
