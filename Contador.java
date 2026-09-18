public class Contador {
    // Estado mutable externo a la función
    private int total = 0;

    // Esta función TIENE efectos secundarios
    public int agregarYCalcular(int valor) {
        // Efecto secundario 1: Modifica una variable fuera del ámbito de la función
        this.total += valor; 
        
        // Efecto secundario 2: Imprime en consola (I/O)
        System.out.println("Nuevo total: " + this.total); 
        
        return this.total;
    }
}