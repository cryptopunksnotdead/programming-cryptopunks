package webstart.notifier;


// todo:
//   add log4j logger!!!!


import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.lang.ProcessBuilder;


import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.program.Program;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;




//// fix/todo:
// move to utils

class StreamGobbler extends Thread
{
  InputStream _in;
  
  public StreamGobbler( InputStream in ) {
    _in = in;
  }
  
  public void run() {
    try {
      int c;
      while( (c=_in.read()) != -1 )
          ;      
    }
    catch( IOException ex ) {
      // ignore errors
       System.out.println( "*** error: StreamGobbler#read failed - " +  ex );
    }
  }
}


public class Notifier 
{
    // contains list of all active popup shells
    private static List<Balloon> __activeBalloons = new ArrayList<Balloon>();
    
    // 
    private static Shell __notifyShell;
    
    ///////
    // Creates and shows a notification dialog with a specific title and message 
 
    public static void notifyAsync( final String title, final String message, final int displayTime )
    {
      // note  make sure we always run on main-ui thread use
      //   asyncExec
      
      System.out.println( "[notifier] enter notifyAsync" );
      
        Display.getDefault().asyncExec( new Runnable() {
           public void run() {
                System.out.println( "[notifier] enter run" );

             Notifier.notify( title, message, displayTime );
             
                System.out.println( "[notifier] leave run" );             
           } 
        });      
    }

    
  public static void openBrowser( String url )
   {
       System.out.println( "openBrowser - url=>>" + url + "<<" );
    Program.launch( url );

         /* try {
           Runtime.getRuntime().exec("cmd /c start \"\" " + url);
         } catch (IOException e) {
           __log.debug("Runtime.getRuntime().exec()", e);
           Program.launch( url );
         }*/
   }
    
    public static void startProgArg0( String cmd, String arg0 )
    {
      // cmd    = "c:\\windows\\notepad.exe"; 
      // arg0   = "c:\\src\\service_controller.rb";

      try 
      {
          System.out.println( "ProcessBuilder - cmd: " + cmd );
          System.out.println( "ProcessBuilder - arg0: " + arg0 );

          ProcessBuilder builder = new ProcessBuilder( cmd, arg0 );
          builder.redirectErrorStream( true );  // merge stderr with stdout; only need to read stdout  

          Process proc = builder.start();
          StreamGobbler gobbler = new StreamGobbler( proc.getInputStream() );
          gobbler.start();
          
          // use thread waitFor n join ???
          //   int exitValue = proc.waitFor();
          //   gobbler.join();
      }
      catch( IOException ex ) 
      {
       System.out.println( "*** error: ProccessBuilder#start failed - " +  ex );
    }
    }

    
    public static void notifyAsyncStartProgArg0( final String title, final String message, final int displayTime, final String cmd, final String arg0 )
    {
      // note  make sure we always run on main-ui thread use
      //   asyncExec
      
      System.out.println( "[notifier] enter notifyAsync" );
      
      
        Display.getDefault().asyncExec( new Runnable() {
           
          public void run() {
                System.out.println( "[notifier] enter run" );

                BalloonListener l = new BalloonListener() {
                  public void onClick( Balloon balloon ) {                    
                    startProgArg0( cmd, arg0 );
                  }};
                
                
             Notifier.notify( title, message, displayTime, l );
             
                System.out.println( "[notifier] leave run" );             
           } 
        });      
    }
  
  
    public static void notifyAsyncOpenBrowser( final String title, final String message, final int displayTime, final String url )
    {
      // note  make sure we always run on main-ui thread use
      //   asyncExec
      
      System.out.println( "[notifier] enter notifyAsync" );

      
      
        Display.getDefault().asyncExec( new Runnable() {
           
          public void run() {
                System.out.println( "[notifier] enter run" );

                BalloonListener l = new BalloonListener() {
                  public void onClick( Balloon balloon ) {                    
                    openBrowser( url );                    
                  }};
                
                
             Notifier.notify( title, message, displayTime, l );
             
                System.out.println( "[notifier] leave run" );             
           } 
        });      
    }
    

    
    public static void notify( String title, String message, int displayTime )  {
       notify( title, message, displayTime, new BalloonListener() {
         public void onClick( Balloon balloon ) { /* do nothing */ }
       });
    }
    
    public static void notify( String title, String message, int displayTime, final BalloonListener listener )  {

      System.out.println( "[notifier] enter notify" );
      
      // lets use our own "dummy" shell instead of Display.getDefault().getActiveShell()  - (might return null)
      if( __notifyShell == null )
        __notifyShell = new Shell( Display.getDefault() );

      
      // Shell activeShell = Display.getDefault().getActiveShell();
      //
      // if( activeShell == null )
        //    System.out.println( "[notifier] *** warn: activeShell == null" );
      // else
        //    System.out.println( "[notifier] activeShell OK" );        
      
      
        final Balloon newBalloon = new Balloon( 
                           __notifyShell, 
                           title, 
                           message, 
                           displayTime );

        
        newBalloon.addListener( new BalloonListener() {
          public void onClick( Balloon balloon ) {
            System.out.println( "*** balloon clicked ***" );

            // balloon.dispose();  //  unshow/close ballon
              // __activeBalloons.remove( balloon );
            
            listener.onClick( balloon );  // pass along to "outer" listener
            }
         });
        
        
        
       newBalloon.getShell().addListener( SWT.Dispose, new Listener()  {
          public void handleEvent(Event event) {
              __activeBalloons.remove( newBalloon );
          }
      });

       

        // if( Display.getDefault().getActiveShell() == null || 
        //   Display.getDefault().getActiveShell().getMonitor() == null )
        // { 
        //   System.out.println( "[notifier] *** warn: activeShell == null" );
        //  // error: sorry can't get active shell!!!!!
        //  return; 
        // }

        // Rectangle clientArea = Display.getDefault().getActiveShell().getMonitor().getClientArea();
        Rectangle clientArea = __notifyShell.getMonitor().getClientArea();

        int startX = clientArea.x + clientArea.width - 352;
        int startY = clientArea.y + clientArea.height - 102;

        // move other balloons up
        if( !__activeBalloons.isEmpty() ) {
            List<Balloon> modifiable = new ArrayList<Balloon>(__activeBalloons);
            Collections.reverse( modifiable );
            for( Balloon balloon : modifiable ) {
              Shell shell = balloon.getShell();
                Point curLoc = shell.getLocation();
                shell.setLocation( curLoc.x, curLoc.y - 100 );
                if( curLoc.y - 100 < 0 ) {                    
                  __activeBalloons.remove( balloon );
                    balloon.dispose();
                }
            }
        }

        newBalloon.getShell().setLocation( startX, startY );
        newBalloon.getShell().setAlpha( 0 );
        newBalloon.getShell().setVisible( true );

        __activeBalloons.add( newBalloon );
        
        newBalloon.fadeInOut( new BalloonCallback() {
          public void onComplete( Balloon balloon )
          {
           __activeBalloons.remove( balloon );
          }
        });
    }
    
}  // class Notifier
