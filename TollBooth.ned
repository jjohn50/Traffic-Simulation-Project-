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

import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network TollBooth
{
    @display("bgb=668.136,342.104");
    submodules:
        Drivers: Source {

            @display("p=47,161");
        }
        LaneSelector: Router {
            @display("p=159,161");
        }
        Lane1: Queue {
            @display("p=373,61");
        }
        Lane2: Queue {
            @display("p=373,122");
        }
        Lane3: Queue {
            @display("p=373,189");
        }
        Lane4: Queue {
            @display("p=373,255");
        }
        Lane1_2: Router {
            @display("p=259.448,92.988");
        }
        Lane3_4: Router {
            @display("p=259.448,216.972");
        }
        Turnpike: Sink {
            @display("p=561.372,160.72");
        }
    connections:
        Drivers.out --> LaneSelector.in++;
        LaneSelector.out++ --> Lane1_2.in++;
        LaneSelector.out++ --> Lane3_4.in++;
        Lane1_2.out++ --> Lane1.in++;
        Lane1_2.out++ --> Lane2.in++;
        Lane3_4.out++ --> Lane3.in++;
        Lane3_4.out++ --> Lane4.in++;
        Lane1.out --> Turnpike.in++;
        Lane2.out --> Turnpike.in++;
        Lane3.out --> Turnpike.in++;
        Lane4.out --> Turnpike.in++;
}
