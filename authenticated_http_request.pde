/****************************************************************
 * AUTHENTICATED HTTP REQUEST - POSTEROUS
 * by: Julio Terra || julioterra.com/journal
 *
 * Sample code used to download data from posterous.com. Code 
 * connects to posterous using their API version 2. It uses Java's
 * IO and Net libraries.
 * 
 * The class URLAuthReader encapsulates all the functionality that
 * enables the reading of data from posterous. This functionality is 
 * provided via three static functions:
 * (1) authenticated_http_request: opens connection to posterous server
 *     and makes the appropriate request, with user name and password.
 * (2) read_http_request: reads data that was sent in response to the 
 *     request and returns that data.
 * (3) authenticated_http_request_read: this joins the previous two 
 *     functions together. It makes the http request and then 
 *     returns a String with the results.
 *
 ****************************************************************/

  String username = "username_here";
  String password = "password_here";
  String posterous_url = "url_string_here";
  String read_data = "";
  
  void setup() {
      try { 
        URLAuthReader.authenticated_http_request(posterous_url, username, password); 
        read_data = URLAuthReader.read_http_request(); 
        println(read_data);
      } 

      catch (Exception e) { 
        println("error reading data from the web"); 
      }
  }

  void draw() {
  }

