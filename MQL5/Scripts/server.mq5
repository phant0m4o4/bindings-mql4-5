﻿//+------------------------------------------------------------------+
//|                                                       server.mq5 |
//|                                          Copyright 2017, Hitback |
//|                                                 mauro@hitback.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Hitback"
#property link      "mauro@hitback.us"
#property version   "1.00"
#property strict
#include <Zmq/Zmq.mqh>
//+------------------------------------------------------------------+
//| Hello World client in MQL                                        |
//| Connects REQ socket to tcp://localhost:5555                      |
//| Sends "Hello" to server, expects "World" back                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   Context context;
   Socket socket(context,ZMQ_REP);

   socket.bind("tcp://*:5555");

   while(true)
     {
      ZmqMsg request;

      // Wait for next request from client

      // MetaTrader note: this will block the script thread
      // and if you try to terminate this script, MetaTrader
      // will hang (and crash if you force closing it)
      socket.recv(request);
      Print("Receive Hello");

      Sleep(1000);

      ZmqMsg reply("World");
      // Send reply back to client
      socket.send(reply);
     }
  }
//+------------------------------------------------------------------+
