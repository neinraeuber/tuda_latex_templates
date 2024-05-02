#!/usr/bin/env texlua

module="tuda-ci"

sourcefiledir="tex"
sourcefiles={"*.dtx", "*.ins","*.sty", "*.cls", "*.cfg", "*.clo", "*.def"} 
installfiles={"*.sty", "*.cls", "*.cfg", "*.clo", "*.def"}

excludefiles={"Examples-*"}

textfiles= {"README.md"}

flatten=false

typesetsuppfiles={"*.lco"}

typesetexe="lualatex"
typesetopts=""
unpackexe="pdflatex"

demofiles = {"examples-de/*", "examples/*", "*.tex"}
typesetdemofiles = {"*.tex"}

tagfiles = {"*.sty", "*.cls", "*.cfg", "*.md", "*.clo", "examples/*.tex", "examples/*.lco", "*.def", "examples/*.bib"}

function update_tag(file,content,tagname,tagdate)
	local replaced  = string.gsub(content,"tuda%-ci v%d+.%d+%-*%w* %(%d%d%d%d%-%d%d%-%d%d%)", "tuda-ci v"..tagname.." ("..tagdate..")")
	replaced = string.gsub(replaced,"\\def\\filedate{%d%d%d%d%-%d%d%-%d%d%}","\\def\\filedate{"..tagdate.."}")
	replaced = string.gsub(replaced,"\\def\\fileversion{%d+.%d%d%-*%w*}","\\def\\fileversion{"..tagname.."}")
	replaced = string.gsub(replaced,"version %d+.%d+%-*%w* %(%d%d%d%d%-%d%d%-%d%d%)","version "..tagname.." ("..tagdate..")")
	return replaced
end
