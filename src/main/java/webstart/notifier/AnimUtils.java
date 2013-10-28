package webstart.notifier;

import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;


interface FadeOutCallback
{
   public void onComplete();
}

interface FadeInCallback
{
   public void onComplete();
}


public class AnimUtils 
{
    // how long each tick is when fading in (in ms)
    private static final int   FADE_TIMER_TICK_IN_MS = 50;

    // how high the alpha value is when we have finished fading in 
    private static final int   FINAL_ALPHA   = 225;

    // how long each tick is when fading out (in ms)
    private static final int   FADE_IN_STEP  = 30;

    // how many tick steps we use when fading out 
    private static final int   FADE_OUT_STEP = 8;

    
    public static void fadeIn( final Shell shell, final FadeInCallback callback ) {
       
        Display.getDefault().timerExec( FADE_TIMER_TICK_IN_MS, new Runnable() {

            public void run() {
                try {
                    if( shell.isDisposed() ) 
                       return;

                    int cur = shell.getAlpha();
                    cur += FADE_IN_STEP;

                    if( cur > FINAL_ALPHA ) 
                    {
                        shell.setAlpha( FINAL_ALPHA );
                        
                        callback.onComplete();
                        return;
                    }

                    shell.setAlpha( cur );

                    Display.getDefault().timerExec( FADE_TIMER_TICK_IN_MS, this );
                } catch( Exception err ) {
                    err.printStackTrace();
                }
            }
        } );
    }

    public static void fadeOut( final Shell shell, final FadeOutCallback callback ) 
    {
        Display.getDefault().timerExec( FADE_TIMER_TICK_IN_MS, new Runnable() {

            public void run() {
                try {
                    if( shell.isDisposed() )  
                      return;

                    int cur = shell.getAlpha();
                    cur -= FADE_OUT_STEP;

                    if( cur <= 0 ) {
                        
                      shell.setAlpha( 0 );
                        
                      callback.onComplete();
                        return;
                    }

                    shell.setAlpha( cur );

                    Display.getDefault().timerExec( FADE_TIMER_TICK_IN_MS, this );

                } catch( Exception err ) {
                    err.printStackTrace();
                }
            }
        } );
    }
  
}  // class AnimUtils
