# coding: utf-8

class Bullet < Sprite
  def initialize shooter_x, shooter_y
    @costume = {live:Image.new(5, 5, C_GREEN)}
    super shooter_x, shooter_y, @costume[:live]

    shooter_pos = Complex shooter_x.to_f, shooter_y.to_f
    target_pos = Complex Input.mouse_x.to_f, Input.mouse_y.to_f

    @pos = shooter_pos
    diff = target_pos - shooter_pos
    @accelaration = (Complex diff.real / diff.abs, diff.imag / diff.abs)
  end
  def update
    @pos += @accelaration
    self.x, self.y = @pos.real.to_i, @pos.imag.to_i
    self.vanish if self.x < 0 or self.x > Window.width or self.y < 0 or self.y > Window.height
  end
  def hit obj
    self.vanish
  end
end
