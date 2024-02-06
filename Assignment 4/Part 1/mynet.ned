

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth10G;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;
import inet.node.ospfv2.OspfRouter;


network Network
{
    parameters:
        @display("p=10,10;b=712,152;bgb=1596.8625,760.2375");

    submodules:
        configurator: Ipv4NetworkConfigurator {
            parameters:
                
                config = xml("<config>"+
                            "<interface among='PC1 PC2 Router1' address='192.168.1.x' netmask='255.255.255.0' />"+
                            
                            "<interface among='PC5 PC6 PC7 PC8 Router' address='192.168.2.x' netmask='255.255.255.x' />"+
                           
                            "<interface among='PC3 PC4 PC9 PC10 Router2' address='192.168.3.x' netmask='255.255.255.x' />"+
                            
                            "<interface among='PC11 PC12 Router3 Router1 Router2 Router' address='192.168.4.x' netmask='255.255.255.x' />"+
                          
                            "<route hosts='PC1 PC10' destination='*' netmask='0.0.0.0' interface='eth0' />"+
                            "<route hosts='PC5 PC11' destination='*' netmask='0.0.0.0' interface='eth0' />"+
                            "<route hosts='PC2 PC7' destination='*' netmask='0.0.0.0' interface='eth0' />"+
                            
                            "</config>");
                addStaticRoutes = false;
                addDefaultRoutes = false;
                @display("p=100,100;is=s");
        }
        PC1: StandardHost {
            @display("p=206,422");
            gates:
                ethg[1];
        }
        PC2: StandardHost {
            @display("p=208,268");
            gates:
                ethg[1];
        }
        Switch3: EthernetSwitch {
            @display("p=305,344");
            gates:
                ethg[3];
        }
        Router1: OspfRouter {
            @display("p=446,337");
            gates:
                ethg[2];
        }
        Router2: OspfRouter {
            @display("p=824,359");
            gates:
                ethg[3];
        }
        Router3: OspfRouter {
            @display("p=636,304");
            gates:
                ethg[5];
        }
        Router: OspfRouter {
            @display("p=646,184");
            gates:
                ethg[3];
        }
        Switch4: EthernetSwitch {
            @display("p=453,101");
            gates:
                ethg[3];
        }
        Switch1: EthernetSwitch {
            @display("p=785,96");
            gates:
                ethg[3];
        }
        Switch5: EthernetSwitch {
            @display("p=969.39374,494.7");
            gates:
                ethg[3];
        }
        Switch2: EthernetSwitch {
            @display("p=1014.8625,256.44376");
            gates:
                ethg[3];
        }
        PC10: StandardHost {
            @display("p=1109.4375,576.54376");
            gates:
                ethg[1];
        }
        PC9: StandardHost {
            @display("p=1138.5375,474.69376");
            gates:
                ethg[1];
        }
        PC4: StandardHost {
            @display("p=1187.6438,300.09375");
            gates:
                ethg[1];
        }
        PC3: StandardHost {
            @display("p=1153.0875,194.60625");
            gates:
                ethg[1];
        }
        PC5: StandardHost {
            @display("p=878,41");
            gates:
                ethg[1];
        }
        PC6: StandardHost {
            @display("p=711,33");
            gates:
                ethg[1];
        }
        PC8: StandardHost {
            @display("p=359,46");
            gates:
                ethg[1];
        }
        PC7: StandardHost {
            @display("p=535,46");
            gates:
                ethg[1];
        }
        PC11: StandardHost {
            @display("p=543.8063,547.4438");
            gates:
                ethg[1];
        }
        PC12: StandardHost {
            @display("p=687.4875,549.2625");
            gates:
                ethg[1];
        }
    connections:
        PC2.ethg[0] <--> Eth10G <--> Switch3.ethg[1];
        PC1.ethg[0] <--> Eth10G <--> Switch3.ethg[0];
        Switch3.ethg[2] <--> Eth10G <--> Router1.ethg[0];
        Router1.ethg[1] <--> Eth10G <--> Router3.ethg[0];

        Router3.ethg[1] <--> Eth10G <--> PC11.ethg[0];
        Router3.ethg[2] <--> Eth10G <--> PC12.ethg[0];
        Router3.ethg[3] <--> Eth10G <--> Router.ethg[0];

        Router.ethg[1] <--> Eth10G <--> Switch4.ethg[2];
        Router.ethg[2] <--> Eth10G <--> Switch1.ethg[2];

        Switch1.ethg[0] <--> Eth10G <--> PC5.ethg[0];
        Switch1.ethg[1] <--> Eth10G <--> PC6.ethg[0];

        Switch4.ethg[0] <--> Eth10G <--> PC7.ethg[0];
        Switch4.ethg[1] <--> Eth10G <--> PC8.ethg[0];

        Router3.ethg[4] <--> Eth10G <--> Router2.ethg[2];
        Router2.ethg[0] <--> Eth10G <--> Switch2.ethg[2];
        Router2.ethg[1] <--> Eth10G <--> Switch5.ethg[2];

        Switch2.ethg[0] <--> Eth10G <--> PC3.ethg[0];
        Switch2.ethg[1] <--> Eth10G <--> PC4.ethg[0];

        Switch5.ethg[0] <--> Eth10G <--> PC9.ethg[0];
        Switch5.ethg[1] <--> Eth10G <--> PC10.ethg[0];
}
