
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;


import webstart.notifier.Notifier;



public class Tester {

    public static void main(String[] args) 
    {
        Display display = new Display();
        Shell shell = new Shell(display);
        shell.setText( "Test Shell" );
        shell.setSize(200, 200);
        shell.setLayout(new FillLayout());
      
        Button tester = new Button( shell, SWT.PUSH );
        tester.setText( "Click Here for Testing" );
        
        
        tester.addListener( SWT.Selection, new Listener() {
            public void handleEvent(Event event) {
              
                Notifier.notify( 
                  "Notifier Test Title", 
                   "Message Message Message Message Message Message Message Message\n\n"+
                  "More More More More More More",
                   3500  // 7000ms is 7secs
                 );
                
                Notifier.notifyAsyncOpenBrowser( 
                      "Notifier Open Browser Test Title", 
                       "Message Message Message Message Message Message Message Message\n\n"+
                      "More More More More More More",
                       8000,  // 7000ms is 7secs
                       "http://intranet.uniqa.at"
                     );
                
            }
        });
        shell.open();        
        
        
        Notifier.notifyAsync(
            "Notifier Test Title (Async)", 
               "Message Message Message Message Message Message Message Message\n\n"+
              "More More More More More More",
               7000  // 7000ms is 7secs
             );
 

        while (!shell.isDisposed()) {
            if (!display.readAndDispatch()) display.sleep();
        }
        display.dispose();

    }
}
