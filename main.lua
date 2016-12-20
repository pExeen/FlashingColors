screenWidth = love.graphics.getWidth()
screenWidthMid = screenWidth / 2
screenHeight = love.graphics.getHeight()
screenHeightMid = screenHeight / 2
x = screenWidthMid
y = screenHeightMid
speed = 700
circleRadiusMin = 200
circleRadiusMax = 300
oldCircleRadiusMin = 0
oldCircleRadiusMax = 0
function love.draw()
	love.mouse.setVisible(false)
	love.graphics.setBackgroundColor( r, g, b)
	love.graphics.setColor(g, b, r)
	if love.keyboard.isDown("space") then
		love.graphics.circle( "fill", x, y, circleRadius, 100)
	end
end

function love.update(dt)
	circleRadius  = love.math.random(circleRadiusMin, circleRadiusMax)
	r = love.math.random(255)
	g = love.math.random(255)
	b = love.math.random(255)
	keyboardControll(dt,speed)
end

function love.keypressed(key)
   if key == "escape" then
      love.event.quit()
   end
   if key == "return" then
   	circleRadiusMin = circleRadiusMin + 100
   	circleRadiusMax = circleRadiusMax + 100
   	oldCircleRadiusMin = circleRadiusMin
   	oldCircleRadiusMax = circleRadiusMax
   end
   if key == "backspace" then
   	circleRadiusMin = circleRadiusMin - 100
   	circleRadiusMax = circleRadiusMax - 100
		oldCircleRadiusMin = circleRadiusMin
   	oldCircleRadiusMax = circleRadiusMax
   end
   if key == '0' then
   		circleRadiusMin = 10
   		circleRadiusMax = 40
   	end
   	if key == 'r' then
   		x = screenWidthMid
   		y = screenHeightMid
   		circleRadiusMin = 200
   		circleRadiusMax = 300
   		oldCircleRadiusMin = 200
   		oldCircleRadiusMax = 300
   	end
end

function love.keyreleased(key)
	if key == '0' then
		circleRadiusMin = oldCircleRadiusMin
		circleRadiusMax = oldCircleRadiusMax
	end
end

function keyboardControll(dt,speed)
	if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		x = x + speed * dt
	end
	if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		x = x - speed * dt
	end
	if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
		y = y + speed * dt
	end
	if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
		y = y - speed * dt
	end
end
