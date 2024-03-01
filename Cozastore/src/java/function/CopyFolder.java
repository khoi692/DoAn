/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package function;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author Drag
 */
public class CopyFolder {
    public void CopyFolder(String srcPath, String desPath) throws FileNotFoundException, IOException {
        File src = new File(srcPath);
        src.mkdirs();
        File des = new File(desPath);
        des.mkdirs();

        for (File file : src.listFiles()) {
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            byte[] buffer = new byte[bis.available()];
            int byteRead;
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(des.getPath() + "\\" + file.getName()));
            while ((byteRead = bis.read(buffer)) != -1) {
                bos.write(buffer, 0, byteRead);
            }
            bos.flush();
        }
    }
}
