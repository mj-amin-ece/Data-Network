import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth10M;
import inet.node.inet.StandardHost;
import inet.visualizer.common.NetworkRouteVisualizer;

network Network1
{
    @display("bgb=600,250");
    submodules:
        pathVisualizer: NetworkRouteVisualizer {
            parameters:
                @display("p=320,202");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=197,205");
        }
        source: StandardHost {
            @display("p=90,75");
            gates:
                ethg[1];
        }
        destination: StandardHost {
            @display("p=390,75");
            gates:
                ethg[1];
        }

    connections:
        source.ethg[0] <--> Eth10M <--> destination.ethg[0];
}
@license(LGPL);
