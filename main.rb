# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'bullet'

Window.width  = 800
Window.height = 600

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)

enemies = []
10.times do
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end

bullets = []
reshoot_count = 0

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw

  # 当たり判定
  Sprite.check(player, enemies)

  if Input.mouseDown? M_LBUTTON and (reshoot_count % 10).zero?
    bullets << Bullet.new(player.x + player.image.width / 2, player.y)
    reshoot_count += 1
  else
    reshoot_count = 0
  end
  Sprite.update bullets
  Sprite.draw bullets

end
