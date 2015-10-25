<%@ page import="java.io.*" %> 
<%@ page import="java.net.*" %> 

<% 
String src = request.getParameter("src"); 
URL url = new URL("http://" + src);  
HttpURLConnection conn = (HttpURLConnection)url.openConnection();  
conn.setRequestMethod("GET");  
conn.setConnectTimeout(5 * 1000);  
InputStream in = conn.getInputStream();  
OutputStream o = response.getOutputStream(); 
  int l = 0; 
  byte[] buffer = new byte[4096]; 
while((l = in.read(buffer)) != -1){ 
o.write(buffer,0,l); 
} 
o.flush(); 
in.close(); 
o.close(); 
out.clear();
out = pageContext.pushBody();
%> 