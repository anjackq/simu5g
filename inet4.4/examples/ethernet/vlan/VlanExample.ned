//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.examples.ethernet.vlan;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;

network VlanExample
{
    submodules:
        configurator: Ipv4NetworkConfigurator {
            @display("p=100,100;is=s");
        }
        host1: StandardHost {
            @display("p=250,100");
        }
        switch1: EthernetSwitch {
            @display("p=350,100");
        }
        switch2: EthernetSwitch {
            @display("p=450,100");
        }
        host2: StandardHost {
            @display("p=550,100");
        }
    connections:
        host1.ethg++ <--> Eth100M <--> switch1.ethg++;
        host2.ethg++ <--> Eth100M <--> switch2.ethg++;
        switch1.ethg++ <--> Eth100M <--> switch2.ethg++;
}

