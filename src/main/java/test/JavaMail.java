package test;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;  
class Mailer{  
    public static void send(String from,String password,String to,String sub,String msg){  
          //Get gmail properties object    
    	  //發送 Mail (SMTP) Server
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");  //需要 TLS or SSL:smtp.gmail.com(使用身份驗證)  
          props.put("mail.smtp.socketFactory.port", "465");  
          props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");  //SSL的Port號:465    
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session); //以Session 為參數 建立一封電子郵件   
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub); //郵件的主旨   
           message.setText(msg); //郵件的內容   
           //send message  
           Transport.send(message); //寄送郵件   
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             
    }  
}  
public class JavaMail{ 
	//要測試要開Server(Tomcat)
 public static void main(String[] args) {    
     //from,password,to,subject,message  
     Mailer.send("eeit92iwow@gmail.com","iwow0428","crimson520@gmail.com","hello javamail","How r u?");  
     //change from, password and to  
 }    
}    