--[[
  Function find on StackOverflow => https://stackoverflow.com/questions/12394841/safely-remove-items-from-an-array-table-while-iterating
  Thank you Mitch McMabers
  removes safely an item from a table and returns an ordered table, read more in the link
]]
function TableRemove(t, fnKeep)
    local j, n = 1, #t;

    for i=1,n do
        if (fnKeep(t, i, j)) then
            -- Move i's kept value to j's position, if it's not already there.
            if (i ~= j) then
                t[j] = t[i];
                t[i] = nil;
            end
            j = j + 1; -- Increment position of where we'll place the next kept value.
        else
            t[i] = nil;
        end
    end

    return t;
end
