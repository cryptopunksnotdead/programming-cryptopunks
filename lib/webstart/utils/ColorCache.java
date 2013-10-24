package webstart.utils;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.RGB;
import org.eclipse.swt.widgets.Display;


public final class ColorCache {

    public static final RGB BLACK = new RGB(0, 0, 0);
    public static final RGB WHITE = new RGB(255, 255, 255);

    private static Map<RGB, Color> __colorTable;

    static {
        __colorTable = new HashMap<RGB, Color>();
    }

    public static Color getColorFromRGB( RGB rgb ) {
        Color color = __colorTable.get(rgb);

        if( color == null ) {
            color = new Color( Display.getCurrent(), rgb );
            __colorTable.put( rgb, color );
        }

        return color;
    }

    public static Color getColor( int r, int g, int b ) { return getColorFromRGB( new RGB(r, g, b) ); }

    public static Color getWhite() { return getColorFromRGB(new RGB(255, 255, 255)); }
    public static Color getBlack() { return getColorFromRGB(new RGB(0, 0, 0)); }

    
    // Note:
    //  Disposes of all colors. DO ONLY CALL THIS WHEN YOU ARE SHUTTING DOWN YOUR
    //   APPLICATION!

    public static void disposeColors() {
        Iterator<Color> e = __colorTable.values().iterator();
        while(e.hasNext() )
            e.next().dispose();

        __colorTable.clear();
    }
    
} // class ColorCache
