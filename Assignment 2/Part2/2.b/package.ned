import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;
import inet.visualizer.common.IntegratedVisualizer;

network Network3
{
    @display("bgb=1816.92,886.83");
    submodules:
        visualizer: IntegratedVisualizer {
            @display("p=228.9175,784.0875");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=64.89,773.2725");
        }
        etherSwitch1: EthernetSwitch {
            @display("p=479.465,273.98");
        }
        etherSwitch3: EthernetSwitch {
            @display("p=1056.265,250.5475");
        }
        source1: StandardHost {
            @display("p=201.88,205.485");
        }
        etherSwitch4: EthernetSwitch {
            @display("p=764.26,250.5475");
        }
        destination1: StandardHost {
            @display("p=616.455,693.9625");
        }
        destination2: StandardHost {
            @display("p=1341.06,198.27501");
        }
        source2: StandardHost {
            @display("p=180.25,344.2775");
        }
        etherSwitch2: EthernetSwitch {
            @display("p=751.6425,432.6");
        }
        host1: StandardHost {
            @display("p=904.85504,659.715");
        }
        host2: StandardHost {
            @display("p=1333.85,410.97");
        }
        source3: StandardHost {
            @display("p=185.6575,486.67502");
        }
        destination3: StandardHost {
            @display("p=508.305,63.0875");
        }
        etherSwitch5: EthernetSwitch {
            @display("p=775.075,102.7425");
        }
    connections:
        source1.ethg++ <--> Eth100M <--> etherSwitch1.ethg++;
        source2.ethg++ <--> Eth100M <--> etherSwitch1.ethg++;
        source3.ethg++ <--> Eth100M <--> etherSwitch1.ethg++;


        etherSwitch1.ethg++ <--> Eth100M <--> etherSwitch4.ethg++;

        etherSwitch4.ethg++ <--> Eth100M <--> etherSwitch3.ethg++;
        etherSwitch4.ethg++ <--> Eth100M <--> etherSwitch2.ethg++;

        etherSwitch2.ethg++ <--> Eth100M <--> destination1.ethg++;
        etherSwitch2.ethg++ <--> Eth100M <--> host1.ethg++;

        etherSwitch3.ethg++ <--> Eth100M <--> destination2.ethg++;
        etherSwitch3.ethg++ <--> Eth100M <--> host2.ethg++;

        destination3.ethg++ <--> Eth100M <--> etherSwitch5.ethg++;
        etherSwitch5.ethg++ <--> Eth100M <--> etherSwitch4.ethg++;
}



@license(LGPL);
