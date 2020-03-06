function love.load()
  button={}
  button.x=200
  button.y=200
  button.size=50

  score=0
  timer=10
  gameState=1

  myFont= love.graphics.newFont(50)
end

function love.update(dt) --runs every frame
  if gameState==2 then
    if timer>0 then
      timer=timer-dt
      if timer< 0 then
        timer=0
        gameState=1
        score=0
      end
    end
  end

   --dt=1/60s we run at 60 frames per second so dt x fps= 1
end



function love.draw()
  if gameState==2 then
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", button.x, button.y, button.size)
  end

  love.graphics.setFont(myFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Score: "..score,10,0)
  love.graphics.print("Time: "..math.ceil(timer),570,0)
  --mousepos_x = love.mouse.getX()
  --love.graphics.print(mousepos_x)
  --love.graphics.print("Text", printx, printy)
  --love.graphics.print("Text",printdistance , 50)
  if gameState==1 then
    love.graphics.printf("Click anywhere to begin",0,love.graphics.getHeight()/2,love.graphics.getWidth(),"center")
  end
end



function love.mousepressed(x, y, b, istouch)
  --if distanceBetween(x,y, button.x, button.y)< button.size then


  if b==1 and gameState==2 then
    --printx= love.mouse.getX()
    printx= love.mouse.getX()
    printy= love.mouse.getY()
    printdistance=distanceBetween(printx,printy,button.x,button.y)
    printbuttonsize= button.size

    if printdistance < printbuttonsize then
      score= score +1

      button.x= love.math.random(button.size,love.graphics.getWidth()-button.size)
      button.y= love.math.random(button.size, love.graphics.getHeight()-button.size)
    end
    --printy= love.mouse.getY()
  end

  if gameState==1 then
    gameState=2
    timer=10
  end

end

function distanceBetween(x1,y1,x2,y2)
  return math.sqrt((y2-y1)^2+(x2-x1)^2)
end
