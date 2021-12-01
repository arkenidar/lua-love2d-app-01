
-- windows (in project dir)
--- "C:\Program Files\LOVE\love" .

-- cygwin
--- cd /cygdrive/c/Users/dario/Dropbox/info-sharing/projects/lua-love2d-app-01 && /cygdrive/c/Program\ Files/LOVE/love.exe .

-- rectangles
border=5
---rectangle1={10,10,100,50}
---border1={rectangle1[1]-border, rectangle1[2]-border, rectangle1[3]+border*2, rectangle1[4]+border*2}

-- content to display
string1="Counter: "
--counter1=1

-- state of left mouse button
mouse_down=1

function point_in_rectangle_check(point, rectangle)
  return point[1]>=rectangle[1] and
    point[1]<=(rectangle[1]+rectangle[3]) and
    
    point[2]>=rectangle[2] and
    point[2]<=(rectangle[2]+rectangle[4])
end

---function love.draw()
function draw_widget(rectangle1)

local rectangle

-- BORDER part

-- for border1
local border1={rectangle1[1]-border, rectangle1[2]-border, rectangle1[3]+border*2, rectangle1[4]+border*2}
rectangle=border1

local point={love.mouse.getX(),love.mouse.getY()}
if love.mouse.isDown(1) and
    point_in_rectangle_check(point, rectangle) then
  -- clicked inside
  love.graphics.setColor(1,0,0) -- red (pressed)
  if mouse_down==1 and love.mouse.isDown(1) then
    mouse_down=2
    -- action on first press
    rectangle1.counter=rectangle1.counter+1
  end
    
else
  if point_in_rectangle_check(point, rectangle) then
    -- hovered
    love.graphics.setColor(0,0,1) -- blue
  else
    -- normal, not hovered (nor pressed)
    love.graphics.setColor(.5,.5,.5) -- grey
  end
end

-- reset the left mouse button press
if not love.mouse.isDown(1) then mouse_down=1 end

-- draw border1
love.graphics.rectangle("fill", rectangle[1], rectangle[2], rectangle[3], rectangle[4])

-- RECTANGLE part

-- for rectangle1
rectangle=rectangle1
-- draw rectangle1
love.graphics.setColor(1,1,1) -- white
love.graphics.rectangle("fill", rectangle[1], rectangle[2], rectangle[3], rectangle[4])

-- draw rectangle1 content
local string_counter1=string1..rectangle1.counter
love.graphics.setColor(0,0,0) -- black
love.graphics.print(string_counter1, rectangle1[1]+border,rectangle1[2]+border)

end

local rectangle1={10,10,100,50,counter=1}
local rectangle2={10+100+10*2,10,100,50,counter=10}
function love.draw()
  draw_widget(rectangle1)
  draw_widget(rectangle2)
end
