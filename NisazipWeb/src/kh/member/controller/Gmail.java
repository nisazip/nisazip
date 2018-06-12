package kh.member.controller;

 

import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;

 

public class Gmail extends Authenticator{

 

		@Override

		protected PasswordAuthentication getPasswordAuthentication(){

			return new PasswordAuthentication("jejuyoulivein","jeju3youlivein");

			

		

	}

}