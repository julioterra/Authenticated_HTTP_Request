import java.net.*;
import java.io.*;

public class URLAuthReader {

  private static String inputLine, inputPage = "";
  private static BufferedReader data;
  
  public static String authenticated_http_request_read(String web_address, String username, String password) throws Exception {
      authenticated_http_request(web_address, username, password);
      return read_http_request();
  }
  
  public static void authenticated_http_request(String web_address, String username, String password) throws Exception {
      Authenticator.setDefault(new MyAuthenticator(username, password));
      URL url = new URL(web_address);
      URLConnection connection = url.openConnection();
      data = new BufferedReader( new InputStreamReader(connection.getInputStream()) );
  }

  public static String read_http_request() throws Exception {
      while ((inputLine = data.readLine()) != null) inputPage += inputLine;
      data.close();
      return inputPage;
  }

  protected static class MyAuthenticator extends Authenticator {
      private String username, password;
      public MyAuthenticator(String user, String pwd) {
          username = user;
          password = pwd;
      }
      protected PasswordAuthentication getPasswordAuthentication() { return new PasswordAuthentication(username, password.toCharArray()); }
     
  }

} 

