package webstart.utils;


import java.util.ArrayList;
import java.util.List;

import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.FontData;
import org.eclipse.swt.widgets.Display;

/**
 * Caching class for fonts. Also deals with re-creating fonts should they have been disposed when the 
 * caller asks for a font.
 */

public class FontCache {

    private static List<OneFont> _existing = new ArrayList<OneFont>();

    /**
     * Disposes all fonts and clears out the cache. Never call this unless you are shutting down your 
     * code/client/etc.
     */
    public static void disposeAll() {
        for (OneFont of : _existing) {
            if (of.getFont() != null && !of.getFont().isDisposed()) {
                of.getFont().dispose();
            }
        }
        
        _existing.clear();
    }
    
    /**
     * Gets a font from existing FontData
     * 
     * @param fd FontData
     * @return Font or null on error
     */
    public static Font getFont(FontData fd) {
        try {
            boolean disposed = false;
            OneFont toRemove = null;
            for (OneFont of : _existing) {
                if (of.matches(fd)) {
                    if (of.getFont().isDisposed()) {
                        disposed = true;
                        toRemove = of;
                        break;
                    }
                        
                    return of.getFont(); 
                }
            }
            if (disposed) {
                _existing.remove(toRemove);
            }
            
            OneFont of = new OneFont(fd);
            _existing.add(of);
            return of.getFont();
        } catch (Exception err) {
            err.printStackTrace();
        }

        return null;
    }

    public static int getCount() {
        return _existing.size();
    }
    
    /**
     * Gets a font from an existing fonts data.
     * 
     * @param font Font
     * @return Font or null on error
     */
    public static Font getFont(Font font) {
        try {
            if (font == null || font.isDisposed()) return null;

            FontData fd = font.getFontData()[0];
            return getFont(fd);

        } catch (Exception err) {
            err.printStackTrace();
        }

        return null;
    }

    /**
     * Gets a font for a given font name and style.
     * 
     * @param fontName Name of font
     * @param height Height of font
     * @param style Style of font
     * @return Font or null on error
     */
    public static Font getFont(String fontName, int height, int style) {
        try {
            boolean disposed = false;
            OneFont toRemove = null;
            for (OneFont of : _existing) {
                if (of.getName().equals(fontName) && of.getHeight() == height && of.getStyle() == style) {
                    if (of.getFont().isDisposed()) {
                        disposed = true;
                        toRemove = of;
                        break;
                    }
                    return of.getFont();
                }
            }
            if (disposed) {
                _existing.remove(toRemove);
            }
            
            OneFont of = new OneFont(fontName, height, style);
            _existing.add(of);
            return of.getFont();
        }
        catch (Exception err) {
            err.printStackTrace();
        }
        
        return null;
    }

}

class OneFont {

    private String _name;
    private int    _height;
    private int    _style;
    private Font   _font;

    public OneFont(String name, int height, int style) {
        _name = name;
        _height = height;
        _style = style;
        _font = new Font(Display.getDefault(), name, height, style);
    }

    public OneFont(FontData fd) {
        _name = fd.getName();
        _height = fd.getHeight();
        _style = fd.getStyle();
        _font = new Font(Display.getDefault(), fd);
    }

    public String getName() {
        return _name;
    }

    public int getHeight() {
        return _height;
    }

    public int getStyle() {
        return _style;
    }

    public void setFont(Font font) {
        _font = font;
    }

    public Font getFont() {
        return _font;
    }

    public boolean matches(FontData fd) {
        return (fd.getName().equals(_name) && fd.getHeight() == _height && fd.getStyle() == _style);
    }

    @Override
    public String toString() {
        return "Font: " + _name + " " + _height + " " + _style;
    }
}
