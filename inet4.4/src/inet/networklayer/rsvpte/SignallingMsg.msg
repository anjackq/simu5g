//
// Copyright (C) 2005 Vojtech Janota
// Copyright (C) 2003 Xuan Thang Nguyen
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//

import inet.common.INETDefs;
import inet.networklayer.contract.ipv4.Ipv4Address;
import inet.networklayer.rsvpte.IntServ;

namespace inet;

enum SignallingConstants {
    MSG_PSB_TIMER         = 1;
    MSG_PSB_TIMEOUT       = 2;

    MSG_RSB_REFRESH_TIMER = 3;
    MSG_RSB_COMMIT_TIMER  = 4;
    MSG_RSB_TIMEOUT       = 5;

    MSG_HELLO_TIMER       = 6;
    MSG_HELLO_TIMEOUT     = 7;

    MSG_PATH_NOTIFY       = 8;

    PATH_CREATED          = 1;
    PATH_UNFEASIBLE       = 2;
    PATH_FAILED           = 3;
    PATH_PREEMPTED        = 4;
    PATH_RETRY            = 5;
}

//
// FIXME missing documentation
//
message SignallingMsg
{
    int command = 0;
}

//
// FIXME missing documentation
//
message PsbTimerMsg extends SignallingMsg
{
    int id;

    command = MSG_PSB_TIMER;
}

//
// FIXME missing documentation
//
message PsbTimeoutMsg extends SignallingMsg
{
    int id;

    command = MSG_PSB_TIMEOUT;
}

//
// FIXME missing documentation
//
message RsbRefreshTimerMsg extends SignallingMsg
{
    int id;

    command = MSG_RSB_REFRESH_TIMER;
}

//
// FIXME missing documentation
//
message RsbCommitTimerMsg extends SignallingMsg
{
    int id;

    command = MSG_RSB_COMMIT_TIMER;
}

//
// FIXME missing documentation
//
message RsbTimeoutMsg extends SignallingMsg
{
    int id;

    command = MSG_RSB_TIMEOUT;
}

//
// FIXME missing documentation
//
message HelloTimerMsg extends SignallingMsg
{
    Ipv4Address peer;

    command = MSG_HELLO_TIMER;
}

//
// FIXME missing documentation
//
message HelloTimeoutMsg extends SignallingMsg
{
    Ipv4Address peer;

    command = MSG_HELLO_TIMEOUT;
}

//
// FIXME missing documentation
//
message PathNotifyMsg extends SignallingMsg
{
    SessionObj session;
    SenderTemplateObj sender;

    int status;

    command = MSG_PATH_NOTIFY;
}
