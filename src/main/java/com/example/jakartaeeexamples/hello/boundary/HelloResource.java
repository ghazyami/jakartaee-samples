package com.example.jakartaeeexamples.hello.boundary;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

@Path("hello")
public class HelloResource {

	@GET
	public String hello() {
		return "Hello Jakarta EE samples";
	}

}