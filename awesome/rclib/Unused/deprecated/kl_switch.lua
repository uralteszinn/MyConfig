klSwitch = wibox.widget.textbox()

kls =     { 'us(colemak)', 
            'us(dvorak)', 
            'us(dvp)', 
            'us', 
            'ch' }
klName = { ['us(colemak)'] = "Colemak", 
            ['us(dvorak)'] = "Dvorak", 
            ['us(dvp)'] = "PDvorak", 
            ['us'] = "US", 
            ['ch'] = "CH" }


function setKLAndOutput()
  awful.util.spawn("setxkbmap " .. kls[currentKL])
  if currentKL == 1 then
    output = " " .. klName[kls[currentKL]] .. " "
  else
    output = "<span color='" .. beautiful.widgetFGWarning .. "'> " .. klName[kls[currentKL]] .. " </span>"
  end
  klSwitch:set_markup(output)
end

currentKL = 1
setKLAndOutput()

function next_kl()
  currentKL = currentKL % #kls + 1
  setKLAndOutput()
end

function prev_kl()
  currentKL = (currentKL + #kls - 2) % #kls + 1
  setKLAndOutput()
end

function default_kl()
  currentKL = 1
  setKLAndOutput()
end

klSwitch:buttons(awful.util.table.join(
  awful.button({ },1, function() next_kl() end ),
  awful.button({ },2, function() default_kl() end ),
  awful.button({ },3, function() prev_kl() end )
))
