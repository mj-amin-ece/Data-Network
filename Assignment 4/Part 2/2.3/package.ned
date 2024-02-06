import inet.node.aodv.AodvRouter;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.common.IntegratedVisualizer;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;


network Network3
{
    @display("bgb=660,630");
    submodules:
        visualizer: IntegratedVisualizer {
            @display("p=44.38,390.544");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=181.324,541.436");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=67.204,535.096");
        }
        source: AodvRouter {
            @display("p=229,46");
        }
        destination: AodvRouter {
            @display("p=488.832,512.952");
        }
        aodvRouter1: AodvRouter {
            @display("p=421.296,295.872");
        }
        aodvRouter2: AodvRouter {
            @display("p=273.36002,440.592");
        }
        aodvRouter3: AodvRouter {
            @display("p=305.52,188.136");
        }
        aodvRouter4: AodvRouter {
            @display("p=562.8,328.032");
        }
        aodvRouter5: AodvRouter {
            @display("p=421.296,77.184");
        }
}
@license(LGPL);
