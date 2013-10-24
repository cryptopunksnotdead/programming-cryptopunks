package webstart.notifier;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.CLabel;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.FontData;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;

import swt.utils.ColorCache;
import swt.utils.FontCache;




interface BalloonCallback {
  public void onComplete( Balloon balloon );
}


interface BalloonListener {
  public void onClick( Balloon balloon );
}

public class Balloon {

    // title foreground color
    private static Color       __titleFgColor = ColorCache.getColor(40, 73, 97);
    // text foreground color
    private static Color       __fgColor      = __titleFgColor;
    
    // shell gradient background color - top
    private static Color       __bgFgGradient = ColorCache.getColor(226, 239, 249);
    // shell gradient background color - bottom    
    private static Color       __bgBgGradient = ColorCache.getColor(177, 211, 243);
    // shell border color
    private static Color       __borderColor  = ColorCache.getColor(40, 73, 97);

    
    
    
    Shell _shell;
    int   _displayTimeInMs;

    // image used when drawing - one (cached) background image for all balloon shells (gets recreated on resize)
    private Image       _backgroundImage;

    private BalloonCallback _callback;

    
    CLabel _titleLabel;
    Label  _bodyLabel;
    
  
  public Shell getShell() { return _shell; }
  
  Balloon( Shell parent, String title, String message, int displayTimeInMs )
  {
     _displayTimeInMs = displayTimeInMs;
    
     // for now always on top - make configurable via parameter (passed in)
     // NOTE:  use SWT.ON_TOP and __NOT__ SWT.TOP
     _shell = new Shell( parent, SWT.NO_FOCUS | SWT.NO_TRIM | SWT.ON_TOP );
     _shell.setLayout( new FillLayout() );
     _shell.setForeground( __fgColor );
     _shell.setBackgroundMode( SWT.INHERIT_DEFAULT );
   
     
       final Composite inner = new Composite( _shell, SWT.NONE );

       GridLayout gl = new GridLayout( 2, false );
       gl.marginLeft   = 5;
       gl.marginTop    = 0;
       gl.marginRight  = 5;
       gl.marginBottom = 5;

       inner.setLayout( gl );
       
       _shell.addListener( SWT.Resize, new Listener() {
           @Override
           public void handleEvent(Event e) {
               try {
                   // get the size of the drawing area
                   Rectangle rect = _shell.getClientArea();
                   // create a new image with that size
                   Image newImage = new Image( Display.getDefault(), Math.max(1, rect.width), rect.height);
                   // create a GC object we can use to draw with
                   GC gc = new GC( newImage );

                   // fill background
                   gc.setForeground( __bgFgGradient );
                   gc.setBackground( __bgBgGradient );
                   gc.fillGradientRectangle(rect.x, rect.y, rect.width, rect.height, true);

                   // draw shell edge
                   gc.setLineWidth(2);
                   gc.setForeground( __borderColor );
                   gc.drawRectangle(rect.x + 1, rect.y + 1, rect.width - 2, rect.height - 2);
                   // remember to dispose the GC object!
                   gc.dispose();

                   // now set the background image on the shell
                   _shell.setBackgroundImage( newImage );

                   // remember/dispose old used image
                   if( _backgroundImage != null )
                       _backgroundImage.dispose();
                   
                   _backgroundImage = newImage;
               } catch( Exception err ) {
                   err.printStackTrace();
               }
           }
       });
     

       GC gc = new GC( _shell );

       String lines[] = message.split( "\n" );
       Point longest = null;
       int typicalHeight = gc.stringExtent("X").y;

       for( String line : lines ) {
           Point extent = gc.stringExtent(line);
           if( longest == null ) {
               longest = extent;
               continue;
           }

           if( extent.x > longest.x) 
               longest = extent;            
       }
       gc.dispose();
     
       int minHeight = typicalHeight * lines.length;

       CLabel imgLabel = new CLabel(inner, SWT.NONE);
       imgLabel.setLayoutData( new GridData(GridData.VERTICAL_ALIGN_BEGINNING | GridData.HORIZONTAL_ALIGN_BEGINNING) );
       // imgLabel.setImage(type.getImage());

       _titleLabel = new CLabel(inner, SWT.NONE);
       _titleLabel.setLayoutData( new GridData(GridData.FILL_HORIZONTAL | GridData.VERTICAL_ALIGN_CENTER) );
       _titleLabel.setText(title);
       _titleLabel.setForeground( __titleFgColor );
       Font f = _titleLabel.getFont();
       FontData fd = f.getFontData()[0];
       fd.setStyle( SWT.BOLD );
       fd.height = 11;
       _titleLabel.setFont( FontCache.getFont(fd) );

       _bodyLabel = new Label(inner, SWT.WRAP);
       Font tf = _bodyLabel.getFont();
       FontData tfd = tf.getFontData()[0];
       tfd.setStyle(SWT.BOLD);
       tfd.height = 8;
       _bodyLabel.setFont(FontCache.getFont(tfd));
       GridData gd = new GridData(GridData.FILL_BOTH);
       gd.horizontalSpan = 2;
       _bodyLabel.setLayoutData(gd);
       _bodyLabel.setForeground( __fgColor );
       _bodyLabel.setText(message);

       minHeight = 100;

       _shell.setSize(350, minHeight);
  }
  
  public void addListener( final BalloonListener listener )
  {
    System.out.println( "notify addListener" );
    
    Listener l = new Listener() {
       public void handleEvent( Event e ) {
         switch( e.type ) {
           case SWT.MouseEnter:
              System.out.println( "Mouse entered" );
              break;
           case SWT.MouseMove:
             System.out.println( "Mouse move" );
             break;
           case SWT.MouseExit:
             System.out.println( "Mouse exit" );
             break;
           case SWT.MouseDown:
             System.out.println( "Mouse down" );
             System.out.println( "before listener.onClick" );
             listener.onClick( Balloon.this );
             System.out.println( "after listener.onClick" );
             break;
           case SWT.MouseUp:
             System.out.println( "Mouse up" );
             break;
         }
       }      
    };
    
    // _shell.addListener( SWT.MouseEnter, l);
    // _shell.addListener( SWT.MouseExit, l);

    _titleLabel.addListener( SWT.MouseEnter, l);
    _titleLabel.addListener( SWT.MouseExit, l);
    _titleLabel.addListener( SWT.MouseUp, l);
    _titleLabel.addListener( SWT.MouseDown, l);

    _bodyLabel.addListener( SWT.MouseEnter, l);
    _bodyLabel.addListener( SWT.MouseExit, l);
    _bodyLabel.addListener( SWT.MouseUp, l);
    _bodyLabel.addListener( SWT.MouseDown, l);

    
    // lets you add onclick listeners (optional)
    
    // _shell.addMouseListener( listener );
    
    // _bodyLabel.addMouseListener( listener );
    // _titleLabel.addMouseListener( listener );
  }
  
  
  public void dispose()
  {
    // todo: check for isDisposed() tooo!!!
    _shell.dispose();
    
        if( _backgroundImage != null )
        {
          _backgroundImage.dispose();
          // todo: set to  = null   - too!!!
        }
  }
  
  
  public void fadeInOut( BalloonCallback callback )
  {
    _callback = callback;
    
    // kick off fadeIn animation
    _fadeIn();
  }
  

  
  private void _fadeIn()
  {
      AnimUtils.fadeIn( getShell(), new FadeInCallback() {        
        public void onComplete() {
           _startFadeOutTimer();
          }
      } );
  }

    private void _startFadeOutTimer() {
        Display.getDefault().timerExec( _displayTimeInMs, new Runnable() {

            public void run() {
                try {
                    if( _shell.isDisposed() )  // do nothing; already disposed 
                       return;

                    _fadeOut();
                } catch( Exception err ) {
                    err.printStackTrace();
                }
            }
        } );        
     }
  
  
    private void _fadeOut() {

      AnimUtils.fadeOut( getShell(), new FadeOutCallback() {        
        public void onComplete() {
          dispose();
          _callback.onComplete( Balloon.this );
          }
      } );
      
    } // method fadeOut

  
}  // class Balloon



