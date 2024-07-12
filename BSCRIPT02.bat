@echo off
rem prompt user three shapes()
rem circle request radius and calculate the area ()
rem triangle request the lengths of the sides calculate the area()
rem triangle =determine if it is an isosceles, scalene or equilateral triangle()
rem quadrilateral request the length and width calculate the area()
rem determine whether it is a square or rectangle 
rem file name BSCRIPT02()

:main
echo Select one of three shapes: 1.Circle 2.Triangle 3.Quadrilateral 4.End Execute
choice /c 1234 /m "Choose"

if errorlevel 4 goto end
if errorlevel 3 goto Quadrilateral
if errorlevel 2 goto triangle
if errorlevel 1 goto circle

:circle
echo Look for the area of Circle
set /p rad= Insert the radius:
set /a pi = 31416
set /a area=%pi% * %rad% * %rad% / 10000
echo The area of a circle with radius %rad% is %area% square units.
goto main

:triangle
echo Look for the area of Triangle
set /p base=Insert the base length: 
set /p height=Insert the height: 

set /a area= (%base% * %height%) / 2
echo The area of a triangle with base %base% and height %height% is %area% square units.

if %base% equ %height% (
    echo This is an equilateral triangle.
) else if %base% equ 0 (
    echo This is not a triangle.
) else if %base% equ %height% (
    echo This is an isosceles triangle.
) else (
    echo This is a scalene triangle.
)
goto main

:Quadrilateral
set /p length=Insert the base length: 
set /p width=Insert the width: 
set /a area= %length% * %width%
echo The area of a Quadrilateral with length %length% and width %width% is %area% square units.

if %length% equ %width% (
    echo This is a square.
) else (
    echo This is a rectangle.
)
goto main

:end
echo thank you 
exit /b
