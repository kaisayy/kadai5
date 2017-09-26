# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

font = Font.new(32)
@score = 0

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)

#からの配列
enemies = []
10.times do
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end

Window.loop do
  #エスケープキーを押したら終了
  break if Input.keyPush?(K_ESCAPE)
  enemies << Enemy.new(rand(800), rand(600), enemy_img)

  #更新して描画
  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw

  # 当たり判定
  if Sprite.check(player, enemies)
    @score = @score + 1
  end
  Window.draw_font(100, 100, "#{@score}", font)
end
