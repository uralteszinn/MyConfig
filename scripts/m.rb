#!/usr/bin/ruby

#EDITOR = "gvim --servername GVIM --remote-silent-tab"
EDITOR = "v"
PDF_VIEWER = "evince"
IMAGE_VIEWER = "eog"

DEFAULT = "clear && ls"

args=ARGV.join(" ")

args=args.split("TRENNZEICHEN")

output = String.new
ndir = 0

args.each { |arg|
  path = File.absolute_path(arg)
  type = File.extname(path)
  if File.directory?(path)
    ndir += 1
  end
}

texts = String.new
pdfs = String.new
images = String.new

args.each { |arg|
  path = File.absolute_path(arg)
  wpath = "\"#{path}\""
  
  if File.directory?(path)
    if ndir == 1
      output += "cd #{wpath} && "
    else 
      output += " echo #{arg.gsub(/\/$/,"")}: && ls #{wpath} && "
    end
  else
    type = File.extname(path)
    if type == ".pdf"
      pdfs += wpath + " "
    elsif [ ".gif", ".jpg", ".jpeg", ".png", ".bmp", ".GIF", ".JPG", ".JPEG", ".PNG", ".BMP"].include?(type)
      images += wpath + " "
    else
      texts += wpath + " "
    end
  end

}

if texts != ""
  output += "#{EDITOR} #{texts} && "
end

if pdfs != ""
  output += "#{PDF_VIEWER} #{pdfs} 2>/dev/null & "
end

if images != ""
  output += "#{IMAGE_VIEWER} #{images} 2>/dev/null & "
end

output.gsub!(/&& $/,"")

if output == ""
  output = DEFAULT
end

puts output
