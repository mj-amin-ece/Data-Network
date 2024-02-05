//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package hw2;

simple NodeA
{
    gates:
        input in;
        output out;
}

simple NodeB
{
    gates:
        input in;
        output out;
}


network TictocNet
{
    @display("bgb=387,257");
    submodules:
        tic: NodeA {
            @display("p=265,159");
        }
        toc: NodeB {
            @display("p=118,110");
        }
    connections:
        tic.out --> {  delay = 2000ms; } --> toc.in;
        tic.in <-- {  delay = 2000ms; } <-- toc.out;
}
