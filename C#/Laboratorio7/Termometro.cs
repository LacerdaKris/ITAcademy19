public class Termometro {
    private double temperatura;
    public Termometro() {
        temperatura = 0.0;
    }
    public double Temperatura {
        get {
            return temperatura;
        }
    }
    public void Aumentar(double t) {
        temperatura += t;
    }
    public void Diminuir(double t) {
        temperatura -= t;
    }
}