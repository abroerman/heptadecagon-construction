# heptadecagon-construction

This project is a numerical approximation of the geometric construction of a regular heptadecagon, a 17-sided polygon. This construction was discovered by H.W. Richmond, and is detailed <a href="https://www.uwgb.edu/dutchs/PSEUDOSC/17-gon.HTM">here</a>.

Lines are represented by vectors of x and y points along it. Points are found by calculating intersections of curves by the methodology detailed <a href="https://blogs.mathworks.com/pick/2011/09/09/detect-curve-intersections-quickly-and-easily/">here</a>. Every line and point generated for eventual display in the construction is saved, since in constructions one must use lines and points drawn earlier.

To make the construction consistent, I defined some rules. I required that every line necessary for a pure construction would be shown, that every line should be contained within the outside circle, and that no line should have unconnected endpoints. I also kept in mind some loose notion of the "scope" of a line.

This code closely analogs real geometric construction. All points are found only by intersections of lines, and lines are only drawn using previously-found points as inputs to functions that mimic the capabilities of compasses and straightedges.

To generate the construction, first run "Construction.m". This will find two vertices (three if you count one on the end of the drawn diameter) of a regular heptadecagon drawn inside the circle. Then, run one of the "seventeenthizeX.m" scripts. There are multiple ways to construct the rest of the heptadecagon from those two vertices, of which two are coded here. I think "seventeenthize2.m" looks better since it stays out of the way of the stuff happening near the center. Finally, run "plotconstruction.m" to view the construction.

It should be noted that I didn't bother making this code clean, since I only need to run it once to generate the construction.
