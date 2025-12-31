import inet.networks.base.TsnNetworkBase;
import inet.node.contract.IEthernetNetworkNode;
import inet.node.ethernet.Eth1G;
import inet.node.mpls.LdpMplsRouter;
import inet.node.tsn.TsnClock;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;
import inet.showcases.tsn.gatescheduling.TsnSwitch1;


network car_network extends TsnNetworkBase
{
    submodules:
        Cam1: TsnDevice {
            @display("p=300,400");
        }
        Cam2: TsnDevice {
            @display("p=400,650");
        }
        DaCam: TsnDevice {
            @display("p=400,300");
        }
        HU: TsnDevice {
            @display("p=400,500");
        }
        Cam3: TsnDevice {
            @display("p=400,150");
        }
        SW1: TsnSwitch {
            @display("p=550,400");
        }
        SW2: TsnSwitch {
            @display("p=800,400");
        }
        RSE: TsnDevice {
            @display("p=650,300");
        }
        Telematics: TsnDevice {
            @display("p=650,500");
        }
        CU: TsnDevice {
            @display("p=850,550");
        }
        CdAudioDVD: TsnDevice {
            @display("p=850,250");
        }
        Cam4: TsnDevice {
            @display("p=1050,400");
        }
        masterClock: <> like IEthernetNetworkNode if typename != "" {
            @display("p=1105,34;i=device/card");
        }

    connections:
        Cam1.ethg++ <--> Eth1G <--> SW1.ethg++;
        HU.ethg++ <--> Eth1G <--> SW1.ethg++;
        DaCam.ethg++ <--> Eth1G <--> SW1.ethg++;
        Cam2.ethg++ <--> Eth1G <--> SW1.ethg++;
        Cam3.ethg++ <--> Eth1G <--> SW1.ethg++;
        SW1.ethg++ <--> Eth1G <--> SW2.ethg++;
        RSE.ethg++ <--> Eth1G <--> SW2.ethg++;
        Telematics.ethg++ <--> Eth1G <--> SW2.ethg++;
        CU.ethg++ <--> Eth1G <--> SW2.ethg++;
        CdAudioDVD.ethg++ <--> Eth1G <--> SW2.ethg++;
        Cam4.ethg++ <--> Eth1G <--> SW2.ethg++;
}
