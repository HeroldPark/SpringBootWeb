package com.newlecture.web;

import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import ch.qos.logback.classic.Logger;

@SpringBootApplication
public class SpringBootWebApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(SpringBootWebApplication.class, args);
		
		run();
	}

	//	log level test
	// application.properties
	// logging.level.root=info
	private static void run() {
		Logger logger = (Logger) LoggerFactory.getLogger(SpringBootWebApplication.class);
		
		logger.trace("trace -- Hello world.");
		logger.debug("debug -- Hello world.");
		logger.info("info -- Hello world.");
		logger.warn("warn -- Hello world.");
		logger.error("error -- Hello world.");
		
		return ;
	}

}
