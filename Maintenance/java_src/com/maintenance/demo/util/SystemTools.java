package com.maintenance.demo.util;

import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

public class SystemTools {
	 public static String getLinuxIP() throws SocketException{
	        //根据网卡取本机配置的IP   
	        Enumeration netInterfaces=NetworkInterface.getNetworkInterfaces();   
	        InetAddress ipAddress = null;   
	        String ip="";
	        while(netInterfaces.hasMoreElements())   
	        {   
	            NetworkInterface ni=(NetworkInterface)netInterfaces.nextElement();  
	            if(!ni.getName().equals("eth0")){
	                continue;
	            }
	            else{
	                Enumeration<?> e2=ni.getInetAddresses();
	                while(e2.hasMoreElements()){
	                     ipAddress=(InetAddress) e2.nextElement();
	                     if(ipAddress instanceof Inet6Address)
	                         continue;
	                     ip=ipAddress.getHostAddress();
	                     System.out.println("getLinuxIp:"+ip);
	                }
	                break;
	            }
	        }  
	        return ip;
	    }
}
