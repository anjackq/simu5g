//
// Copyright (C) 2000 Institut fuer Telematik, Universitaet Karlsruhe
// Copyright (C) 2004,2011 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//

import inet.common.INETDefs;
import inet.common.Protocol;
import inet.common.socket.SocketCommand;
import inet.linklayer.common.MacAddress;

namespace inet;

class EthernetBindCommand extends SocketBindCommand
{
    MacAddress localAddress;
    MacAddress remoteAddress;
    const Protocol *protocol;
}
