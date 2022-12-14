//
// Copyright (C) 2012 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.examples.internetcloud.earthcloud;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.internetcloud.InternetCloud;


network SimpleContinentCloud
{
    parameters:
        int numClients;
        @display("i=device/lan-ring");
    gates:
        inout pppg[];
    submodules:
        router: Router {
            @display("p=250,100");
        }
        client[numClients]: StandardHost {
            @display("p=400,100,col,100");
        }
        server: StandardHost {
            @display("p=100,100");
        }
    connections:
        for i=0..sizeof(pppg)-1 {
            pppg[i] <--> router.pppg++;
        }
        router.ethg++ <--> Eth100M <--> server.ethg++;
        for i=0..numClients-1 {
            router.ethg++ <--> Eth100M <--> client[i].ethg++;
        }
}

network EarthCloud
{
    @display("bgi=maps/world;bgb=875,414");
    submodules:
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=100,200;is=s");
        }

        internet: InternetCloud {
            @display("p=387,185;is=vl");
        }
        africa: SimpleContinentCloud {
            @display("p=465,288");
        }
        asia: SimpleContinentCloud {
            @display("p=662,121");
        }
        australia: SimpleContinentCloud {
            @display("p=759,299;");
        }
        europe: SimpleContinentCloud {
            @display("p=446,77");
        }
        northAmerica: SimpleContinentCloud {
            @display("p=170,120");
        }
        southAmerica: SimpleContinentCloud {
            @display("p=260,270");
        }
    connections:
        africa.pppg++ <--> {  datarate = 100Mbps; delay = 2ms; } <--> internet.pppg++;
        asia.pppg++ <--> {  datarate = 100Mbps; delay = 2ms; } <--> internet.pppg++;
        australia.pppg++ <--> {  datarate = 100Mbps; delay = 2ms; } <--> internet.pppg++;
        europe.pppg++ <--> {  datarate = 100Mbps; delay = 2ms; } <--> internet.pppg++;
        northAmerica.pppg++ <--> {  datarate = 100Mbps; delay = 2ms; } <--> internet.pppg++;
        southAmerica.pppg++ <--> {  datarate = 100Mbps; delay = 2ms; } <--> internet.pppg++;
}

