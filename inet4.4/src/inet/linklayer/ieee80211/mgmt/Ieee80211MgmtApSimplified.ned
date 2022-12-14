//
// Copyright (C) 2006 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.linklayer.ieee80211.mgmt;

//
// Used in 802.11 infrastructure mode: handles management frames for
// an access point (AP). It relies on a connected ~Ieee80211Mac for actual
// reception and transmission of frames.
//
// This management module variant does not implement beacons, probes,
// authentication and association -- it simply treats all stations
// as associated all the time. This also means that you cannot use this
// module in a simulation that involves handovers; for that you need
// to use the full version, ~Ieee80211MgmtAp.
//
// When simulating an AP that has other (Ethernet or wireless) interfaces
// as well, this module can be connected to a ~IMacRelayUnit which performs
// bridging of Ethernet frames. This module will perform conversion from/to
// ~EtherFrame for ~IMacRelayUnit.
//
// This module never switches channels, that is, it will operate on the channel
// the physical layer is configured for (see channelNumber in ~Ieee80211Radio).
//
// This module checks if there is an other module connected above the management
// module (e.g. RelayUnit) and sends a copy of the frame there and at the same time
// sends the frame back to the wireless interface. The relay unit will send it out
// on the interface which is towards the destination or will broadcast it on all
// interfaces (except on which it was received).
//
simple Ieee80211MgmtApSimplified like IIeee80211Mgmt
{
    parameters:
        string interfaceTableModule;
        string mibModule;
        string macModule;               // The path to the MAC module
        string ssid = default("SSID");
        @display("i=block/cogwheel");
    gates:
        input macIn @labels(Ieee80211MacHeader); // from ~Ieee80211Mac
        output macOut @labels(Ieee80211MacHeader); // to ~Ieee80211Mac
        input agentIn @loose;   // unused dummy to statisfy the IIeee80211Mgmt interface
        output agentOut @loose; // unused dummy to statisfy the IIeee80211Mgmt interface
}

