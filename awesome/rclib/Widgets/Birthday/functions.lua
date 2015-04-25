isLeap = function(year)
  if math.fmod(year, 400) == 0 then
    return true
  elseif math.fmod(year, 100) == 0 then
    return false
  elseif math.fmod(year, 4) == 0 then
    return true
  else
    return false
  end
end

getBirthdays = function(bd_file)
  bdays = {}
  today = os.date("*t")
  for line in io.lines(bd_file) do 
    if string.sub(line,1,2) ~= "--" then
      name         = string.sub(line,12)
      birthday     = os.date("*t", os.time({ month = tonumber(string.sub(line,1,2)),
                                             day   = tonumber(string.sub(line,4,5)),
                                             year  = tonumber(string.sub(line,7,10)),
                                           }))
      
      birthdayStr = birthday.day .. "." .. birthday.month .. "." .. birthday.year

      hasPassed = false
      if birthday.month < today.month then
        hasPassed = true
      elseif birthday.month == today.month and birthday.day < today.day then
        hasPassed = true
      end

      nextBirthday = {day = birthday.day, month = birthday.month, year = today.year} -- month is correct!!!
      if hasPassed then
        nextBirthday.year = nextBirthday.year + 1
      end -- year is correct!!!
      if nextBirthday.month == 2 and nextBirthday.day == 29 and (not isLeap(nextBirthday.year)) then
        nextBirthday.day = 28
      end -- day is correct!!!

      nextBirthday = os.date("*t", os.time(nextBirthday))

      nextBirthdayStr = nextBirthday.day .. "." .. nextBirthday.month .. "." .. nextBirthday.year

      if hasPassed then
        if isLeap(today.year) then
          howFar = 366 - today.yday + nextBirthday.yday
        else
          howFar = 365 - today.yday + nextBirthday.yday
        end
      else
        howFar = nextBirthday.yday - today.yday
      end

      becomes = nextBirthday.year - birthday.year

      table.insert(bdays, { name            = name, 
                            birthday        = birthday,
                            birthdayStr     = birthdayStr,
                            nextBirthday    = nextBirthday, 
                            nextBirthdayStr = nextBirthdayStr,
                            howFar          = howFar,
                            becomes         = becomes,
                          })
    end
  end
  sortFunction = function(elem1, elem2)
    return (elem1.howFar < elem2.howFar)
  end
  table.sort(bdays, sortFunction)
  return bdays
end

getNextBirthdays = function(bdays, offsetTime)
  nBDays = {}
  offsetTime = offsetTime or 31
  for i = 1, table.maxn(bdays) do
    if bdays[i].howFar <= offsetTime then
      table.insert(nBDays,bdays[i])
    end
  end
  return nBDays
end

bdayToString = function(bday)
  if bday.howFar < 6 then
    col = 'red'
  elseif bday.howFar < 11 then
    col = 'orange'
  else
    col = 'green'
  end
  res = bday.name .. " <span color='" .. col .. "'>[" .. bday.howFar .. "] (" .. bday.nextBirthdayStr .. ")</span>"
  return res
end

bdaysToString = function(bdays)
  res = ""
  maxIdx = table.maxn(bdays)
  if maxIdx ~= 0 then
    res = bdayToString(bdays[1])
    for i = 2, maxIdx do
      res = res .. "\n" .. bdayToString(bdays[i]) 
    end
  end
  return res
end

setBirthdayWidgets = function()
  birthdays = getBirthdays(birthdayPath)
  nextBirthdays = getNextBirthdays(birthdays)
  if table.maxn(nextBirthdays) ~= 0 and nextBirthdays[1].howFar == 0 then
    birthdayImage:set_image(gears.surface(birthdayIcons.today))
    birthdayTTIcon = birthdayIcons.tooltipToday
  else
    birthdayImage:set_image(gears.surface(birthdayIcons.notToday))
    birthdayTTIcon = birthdayIcons.tooltipNotToday
  end
  birthdayWidgetText:set_text(birthdayIconText .. table.maxn(nextBirthdays))
  birthdayTTText = bdaysToString(nextBirthdays)
  if birthdayTTText == "" then
    birthdayTTText = "No birthday in sight"
  end
end

showBirthdayTT = function()
  birthdayTT = naughty.notify({ 
                                screen    = mouse.screen,
                                title     = "Birthdays",
                                text      = birthdayTTText,
                                icon      = birthdayTTIcon,
                                icon_size = 42,
                                preset    = naughty.config.presets.tooltip,
                              })
end

deleteBirthdayTT = function()
  naughty.destroy(birthdayTT)
end

