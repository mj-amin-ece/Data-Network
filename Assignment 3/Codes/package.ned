
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.WirelessHost;
import inet.physicallayer.wireless.unitdisk.UnitDiskRadioMedium;
import inet.environment.common.PhysicalEnvironment;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;

network Network
{
    parameters:
        @figure[rcvdPkText](type=indicatorText; pos=200,20; anchor=w; font=10; textFormat="Number of packets received: %g"; initialValue=0);
        @statistic[packetReceived](source=hostB.udp.packetReceived; record=figure(count); targetFigure=rcvdPkText);
        @display("bgb=946.07495,505.32498");
    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=58.344,180.642");
        }
        physicalEnvironment: PhysicalEnvironment {
            @display("p=52.25,418");
        }

        hostA: WirelessHost {
            @display("p=300,272");
        }
        hostB: WirelessHost {
            @display("p=450,100");
        }
        hostC: WirelessHost {
            @display("p=600,272");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=58.344,72.93");
        }

        radioMedium: UnitDiskRadioMedium {
            @display("p=59.375,288.5625");
        }
}
@license(LGPL);
