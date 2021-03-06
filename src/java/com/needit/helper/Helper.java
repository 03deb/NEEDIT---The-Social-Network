
package com.needit.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.sql.SQLException;


public class Helper {
    
    public static boolean deleteFile(String path)  
    {
        boolean f = false;
        
        try{
           
            File file = new File(path);
            f = file.delete();
  
        }
        
        catch (Exception e){
            
            e.printStackTrace();
            
        }
        
        return f;
    }
    
    
    
    public static boolean saveFile(InputStream is, String path) throws IOException
    {
        boolean f = false;
        
        try{
            
            byte b[] = new byte[is.available()];

            is.read(b);

            FileOutputStream fos = new FileOutputStream(path);

            fos.write(b);

            fos.flush();
            fos.close();
            f = true;
            
            
        }
        catch (Exception e){
            
            e.printStackTrace();
            
        }
        
        return f;
    }
    
}
