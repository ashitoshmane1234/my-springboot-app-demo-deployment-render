package com.as;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

/**
 * Main class.
 *
 * @author Mindbowser | rohit.kavthekar@mindbowser.com
 */
@SpringBootApplication
@PropertySource("classpath:exception-message.properties")
@PropertySource("classpath:response-message.properties")
public class AsApiApplication {

  /**
   * Main class.
   *
   * @author Mindbowser | rohit.kavthekar@mindbowser.com
   * @param args runtime arguments
   */
  public static void main(String[] args) {
    SpringApplication.run(AsApiApplication.class, args);
  }
}
