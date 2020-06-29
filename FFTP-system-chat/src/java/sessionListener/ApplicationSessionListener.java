
package sessionListener;


import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class ApplicationSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        System.out.println("Session Created");
    }

   
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        //TODO
        System.out.println("Session Destroyed");
    }
}
