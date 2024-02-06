
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth10G;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.common.IntegratedVisualizer;
import inet.visualizer.common.NetworkRouteVisualizer;


network Network2
{
    @display("bgb=1050,720");
    submodules:
        visualizer: IntegratedVisualizer {
            parameters:
                @display("p=369.24,629.88");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=518.38403,612.504");
        }
        router1: Router {
            @display("p=761.648,218.648");
            gates:
                ethg[3];
        }
        router2: Router {
            @display("p=399.648,312.768");
            gates:
                ethg[4];

        }
        router3: Router {
            @display("p=486.528,428.608");
            gates:
                ethg[3];
        }
        router4: Router {
            @display("p=666.08,321.456");
            gates:
                ethg[4];
        }
        router0: Router {
            @display("p=551.688,162.176");
            gates:
                ethg[4];
        }
        source1: StandardHost {
            @display("p=250,50");
            gates:
                ethg[1];
        }
        source2: StandardHost {
            @display("p=825.36,99.912");
            gates:
                ethg[1];
        }
        destination1: StandardHost {
            @display("p=938.304,495.216");
            gates:
                ethg[1];
        }
        destination2: StandardHost {
            @display("p=107.152,564.72003");
            gates:
                ethg[1];
        }
        host1: StandardHost {
            @display("p=379.488,49.848");
            gates:
                ethg[1];
        }
        videoClient: StandardHost {
            @display("p=955.68,98.464005");
            gates:
                ethg[1];
        }
        host2: StandardHost {
            @display("p=806.536,586.44");
            gates:
                ethg[1];
        }
        videoServer: StandardHost {
            @display("p=94.12,440.19202");
            gates:
                ethg[1];
        }
        etherSwitch0: EthernetSwitch {
            @display("p=249.24,160.8");
            gates:
                ethg[3];
        }
        etherSwitch1: EthernetSwitch {
            @display("p=947.52496,229.665");
            gates:
                ethg[3];
        }
        etherSwitch2: EthernetSwitch {
            @display("p=263.536,425.712");
            gates:
                ethg[3];
        }
        etherSwitch3: EthernetSwitch {
            @display("p=731.665,448.03497");
            gates:
                ethg[3];
        }

    connections:
        etherSwitch0.ethg[0] <--> Eth10G <--> source1.ethg[0];
        etherSwitch0.ethg[1] <--> Eth10G <--> host1.ethg[0];
        etherSwitch0.ethg[2] <--> Eth10G <--> router0.ethg[0];

        router0.ethg[1] <--> Eth10G <--> router2.ethg[3];
        router0.ethg[2] <--> Eth10G <--> router1.ethg[0];
        router0.ethg[3] <--> Eth10G <--> router4.ethg[0];

        router1.ethg[1] <--> Eth10G <--> etherSwitch1.ethg[2];
        router1.ethg[2] <--> Eth10G <--> router4.ethg[1];

        etherSwitch1.ethg[0] <--> Eth10G <--> source2.ethg[0];
        etherSwitch1.ethg[1] <--> Eth10G <--> videoClient.ethg[0];

        etherSwitch3.ethg[0] <--> Eth10G <--> host2.ethg[0];
        etherSwitch3.ethg[1] <--> Eth10G <--> destination1.ethg[0];

        router3.ethg[0] <--> Eth10G <--> etherSwitch3.ethg[2];
        router3.ethg[1] <--> Eth10G <--> router4.ethg[2];
        router3.ethg[2] <--> Eth10G <--> router2.ethg[1];

        router4.ethg[3] <--> Eth10G <--> router2.ethg[2];

        router2.ethg[0] <--> Eth10G <--> etherSwitch2.ethg[2];

        etherSwitch2.ethg[0] <--> Eth10G <--> videoServer.ethg[0];
        etherSwitch2.ethg[1] <--> Eth10G <--> destination2.ethg[0];

}
@license(LGPL);
