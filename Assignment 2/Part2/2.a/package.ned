import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;

import inet.visualizer.common.IntegratedVisualizer;

network Network2
{
    @display("bgb=1175.384,599.16797");
    submodules:
        visualizer: IntegratedVisualizer {
            @display("p=82.144,310.456");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=82.144,408.304");
        }
        etherSwitch1: EthernetSwitch {
            @display("p=422.8,136.504");
        }
        etherSwitch3: EthernetSwitch {
            @display("p=771.912,147.37599");
        }
        source1: StandardHost {
            @display("p=210.192,100.264");
        }
        etherSwitch4: EthernetSwitch {
            @display("p=587.088,141.336");
        }
        destination1: StandardHost {
            @display("p=509.776,408.304");
        }
        destination2: StandardHost {
            @display("p=954.32,152.208");
        }
        source2: StandardHost {
            @display("p=213.816,184.824");
        }
        etherSwitch2: EthernetSwitch {
            @display("p=564.136,279.048");
        }
        host1: StandardHost {
            @display("p=607.624,407.096");
        }
        host2: StandardHost {
            @display("p=942.24,236.76799");
        }
    connections:
        source1.ethg++ <--> Eth100M <--> etherSwitch1.ethg++;
        source2.ethg++ <--> Eth100M <--> etherSwitch1.ethg++;

        etherSwitch1.ethg++ <--> Eth100M <--> etherSwitch4.ethg++;

        etherSwitch4.ethg++ <--> Eth100M <--> etherSwitch3.ethg++;
        etherSwitch4.ethg++ <--> Eth100M <--> etherSwitch2.ethg++;

        etherSwitch2.ethg++ <--> Eth100M <--> destination1.ethg++;
        etherSwitch2.ethg++ <--> Eth100M <--> host1.ethg++;

        etherSwitch3.ethg++ <--> Eth100M <--> destination2.ethg++;
        etherSwitch3.ethg++ <--> Eth100M <--> host2.ethg++;

}


@license(LGPL);
