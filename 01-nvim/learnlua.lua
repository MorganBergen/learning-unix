-- learn x in y minutes
-- where x = lua
-- https://learnxinyminutes.com/docs/lua/

-- two dashes start one-line comments
-- [[
-- adding two brackets starts a multiline comment
--]]

------------------------------------------------------------
-- 1. variables and flow control
------------------------------------------------------------


num = 42 -- all numbers are doubles

s = 'walternate' -- double-quoted strings
t = "double-quoted strings are also fine"
u = [[ double brackets
       start and end 
       multi-line strings ]]
t = nil -- undefinews t; lua has garbage collection

-- blocks are denoted with keywords like do/end
while num < 50 do
	num = num + 1
end

-- if clauses
if num > 40 then
	print('over 40')
elseif s ~= 'walternate' then -- ~= means "not equal"
	-- equality check is == like python; ok for strings
	io.write('not over 40\n')
else
	-- variables are global by default
	thisIsGlobal = 5 -- camelCase is common in lua

	-- how to make a variable local
	local line = io.read()

------------------------------------------------------------

-- this is a comment
num = 22 -- this global variable represents a number
local num2 = 33 -- local variable
str1 = 'this is a string'
str2 = "and so is this"
str3 = [[ and this is a string too ]]
str4 = "string " .. "concatenation"
val = true and not false -- booleans and logical operators

if str1 == 'something' then
  print("YES")
elseif str2 ~= 'is not equal' then
  print('Maybe')
else
  print('no')
end

function printText(text)
  print(text)
  return true
end

tab1 = { 'this', 'is, 'a', 'table' } -- aka array
-- tables are both arrays and dictionaries
tab2 = { also = 'this is a table' }
tab2["new_key"] = "new value"

print(tab2["also"])

require('plugins') -- will find and execute plugins.lua file
