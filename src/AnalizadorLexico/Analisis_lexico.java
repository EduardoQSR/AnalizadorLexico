package AnalizadorLexico;

import java.io.File;

/**
 *
 * @author EduardoQSR
 */
public class Analisis_lexico {

    public static void main(String[] args) {
        String path = "src/AnalizadorLexico/Lexer.flex";
        generarLexer(path);
        Interfaz in = new Interfaz();
        in.setVisible(true);
        in.setTitle("Analizador Lexico");
        in.setResizable(false);
    }
    
    public static void generarLexer(String path){
        File file = new File(path);
        JFlex.Main.generate(file);
    }
    
}
