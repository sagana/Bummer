function checkCollision(obj1, obj2)

      if( obj1.x < obj2.x + obj2.width and
          obj1.x + obj1.width > obj2.x and
          obj1.y < obj2.y + obj2.height and
          obj1.y + obj1.height > obj2.y) then
          return true
      else
        return false
      end
end
