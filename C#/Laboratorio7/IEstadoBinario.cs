public enum EstadoBinario { Ligado, Desligado };

interface IEstadoBinario {
    void Ligar();
    void Desligar();
    EstadoBinario Estado { get; }
}