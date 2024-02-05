/*
 * node.cc
 *
 *  Created on: Dec 5, 2023
 *      Author: mjamin
 */
#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;



class NodeA : public cSimpleModule
{
private:
    simtime_t Tf;
    simtime_t TotalTime;
    simtime_t timeout;  // timeout
    simtime_t delay;    // delay time
    cMessage *timeoutEvent;  // holds pointer to the timeout self-message
    cMessage *sendEvent;     // pointer to the event object which we'll use for timing
    cOutVector linkUtilizationVector;
    //cHistogram linkUtilizationHistogram;  // Use cHistogram instead of cStatistic

protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;

public:
    NodeA();
    virtual ~NodeA();
};

Define_Module(NodeA);

NodeA::NodeA()
{
    sendEvent = timeoutEvent = nullptr;
    TotalTime = 0;
}

NodeA::~NodeA()
{
    cancelAndDelete(timeoutEvent);
    cancelAndDelete(sendEvent);
}

void NodeA::initialize()
{
    // Initialize variables.
    timeout = 5.0;
    delay = 2.0;
    Tf = delay;
    timeoutEvent = new cMessage("timeout");
    sendEvent = new cMessage("Send");

    linkUtilizationVector.setName("LinkUtilizationVector");


    // Generate and send an initial message.
    scheduleAt(simTime() + delay, sendEvent);
}

void NodeA::handleMessage(cMessage *msg)
{
    if (msg == timeoutEvent)
    {
        // If we receive the timeout event, that means the packet hasn't
        // arrived in time and we have to re-send it.
        EV << "Timeout expired, resending the message \n";
        scheduleAt(simTime() + delay, sendEvent);
    }
    else if (msg == sendEvent)
    {
        // Ready to send another one.

        EV << "Sending a message.\n";
        cMessage *newMsg = new cMessage("Hello");
        send(newMsg, "out");
        scheduleAt(simTime() + timeout, timeoutEvent);
    }
    else
    {
        // Message arrived
        // Acknowledgement received
        delete msg;
        EV << "Timer cancelled.\n";
        cancelEvent(timeoutEvent);
        scheduleAt(simTime() + delay, sendEvent);

        TotalTime = simTime() - TotalTime;
        double utilization = (Tf / TotalTime) * 100;

        linkUtilizationVector.record(utilization);

        EV << "Link Utilization: " << utilization << "%" << endl;

        // Reset TotalTime
        TotalTime = simTime();
    }
}


class NodeB : public cSimpleModule
{
  protected:
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(NodeB);

void NodeB::handleMessage(cMessage *msg)
{
    if (uniform(0, 1) > 0.8)
    {
        EV << "\"Losing\" message.\n";
        bubble("message lost");
        delete msg;
    }
    else
    {
        delete msg;
        cMessage *newMssg = new cMessage("ACK");
        EV << "Sending Acknowledgment.\n";
        send(newMssg, "out");
    }
}
