import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.StandardHost;
import inet.visualizer.common.DataLinkVisualizer;
import ned.IdealChannel;


network Network1
{
    submodules:
        linkVisualizer: DataLinkVisualizer {
            parameters:
                @display("p=38,47");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=50,124");
        }
        wiredSource: StandardHost {
            @display("p=305,43");
        }
        wiredDestination: StandardHost {
            @display("p=303,299");
        }
    connections:
        wiredSource.ethg++ <--> Eth100M <--> wiredDestination.ethg++;
}


@license(LGPL);
