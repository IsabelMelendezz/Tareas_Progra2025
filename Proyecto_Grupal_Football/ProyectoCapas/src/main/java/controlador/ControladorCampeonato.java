package controlador;

import domain.Equipo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class ControladorCampeonato {
    //creamos el nuestra lista para EQUIPO
    private ArrayList<Equipo> equipos;
    
    //creamos nuestro metodo para controlar el campeonato y se asignan los equipos 
    public ControladorCampeonato() {
        equipos = new ArrayList<>();
    }

    // Agregar un equipo
    public void agregarEquipo(String nombre) {
        Equipo equipo = new Equipo();
        equipo.setNombre(nombre);
        equipos.add(equipo);

        // Almacenar el equipo en la base de datos
        almacenarEquipoEnBD(equipo);
    }

    // Método para almacenar el equipo en la base de datos
    private void almacenarEquipoEnBD(Equipo equipo) {
        String sql = "INSERT INTO equipos (nombre, partidos_jugados, partidos_ganados, partidos_empatados, partidos_perdidos, goles_a_favor, goles_en_contra, puntos) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Establecer los valores del equipo
            pstmt.setString(1, equipo.getNombre());
            pstmt.setInt(2, equipo.getPartidosJugados());
            pstmt.setInt(3, equipo.getPartidosGanados());
            pstmt.setInt(4, equipo.getPartidosEmpatados());
            pstmt.setInt(5, equipo.getPartidosPerdidos());
            pstmt.setInt(6, equipo.getGolesAFavor());
            pstmt.setInt(7, equipo.getGolesEnContra());
            pstmt.setInt(8, equipo.getPuntos());

            // Ejecutar la inserción
            pstmt.executeUpdate();
            System.out.println("Equipo almacenado en la base de datos: " + equipo.getNombre());

        } catch (SQLException e) {
            System.err.println("Error al almacenar el equipo en la base de datos: " + e.getMessage());
        }
    }

    // Generar partidos aleatorios
    public void generarPartidosAleatorios() {
        Random rand = new Random();

        // Cada equipo debe jugar exactamente 12 partidos
        while (!todosHanJugado12Partidos()) {
            //controla el numero de partidos equipo A 
            for (int i = 0; i < equipos.size(); i++) {
                //controla el numero de partidos para el equipo B
                for (int j = i + 1; j < equipos.size(); j++) {
                    // Verificar si los equipos ya jugaron entre sí
                    // contador i es para un equipo y contador j compara con el otro
                    if (equipos.get(i).getPartidosJugados() < 12 && equipos.get(j).getPartidosJugados() < 12) {
                        int golesEquipoA = rand.nextInt(11); // Goles entre 0 y 10 porque empieza desde la posicion 0
                        int golesEquipoB = rand.nextInt(11); // Goles entre 0 y 10

                        // Actualizar estadísticas de los equipos
                        actualizarEstadisticas(equipos.get(i), golesEquipoA, golesEquipoB);
                        actualizarEstadisticas(equipos.get(j), golesEquipoB, golesEquipoA);

                        // Actualizar estadísticas en la base de datos
                        actualizarEquipoEnBD(equipos.get(i));
                        actualizarEquipoEnBD(equipos.get(j));
                    }
                }
            }
        }
    }

    // Verificar si todos los equipos han jugado 12 partidos
    private boolean todosHanJugado12Partidos() {
        for (Equipo equipo : equipos) {
            if (equipo.getPartidosJugados() < 12) {
                return false;
            }
        }
        return true;
    }

    // Actualizar estadísticas de un equipo
    private void actualizarEstadisticas(Equipo equipo, int golesAFavor, int golesEnContra) {
        equipo.setPartidosJugados(equipo.getPartidosJugados() + 1);
        equipo.setGolesAFavor(equipo.getGolesAFavor() + golesAFavor);
        equipo.setGolesEnContra(equipo.getGolesEnContra() + golesEnContra);

        if (golesAFavor > golesEnContra) {
            //contador de partidos ganados---------------------------------------
            equipo.setPartidosGanados(equipo.getPartidosGanados() + 1);
            //asignacion de puntos por ganar--------------------------------------
            equipo.setPuntos(equipo.getPuntos() + 3);
         
            //contador de partidos ---------------------------------------
 
        } else if (golesAFavor == golesEnContra) {
            equipo.setPartidosEmpatados(equipo.getPartidosEmpatados() + 1);
            //asignacion de puntos por empatar 
            equipo.setPuntos(equipo.getPuntos() + 1);
        } else {
            //unicamente contador de partidos perdidos NO SUMA NINGUN PUNTO
            equipo.setPartidosPerdidos(equipo.getPartidosPerdidos() + 1);
        }
    }

    // Actualizar equipo en la base de datos
    private void actualizarEquipoEnBD(Equipo equipo) {
        String sql = "UPDATE equipos SET partidos_jugados = ?, partidos_ganados = ?, partidos_empatados = ?, partidos_perdidos = ?, goles_a_favor = ?, goles_en_contra = ?, puntos = ? WHERE nombre = ?";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Establecer los valores del equipo
            pstmt.setInt(1, equipo.getPartidosJugados());
            pstmt.setInt(2, equipo.getPartidosGanados());
            pstmt.setInt(3, equipo.getPartidosEmpatados());
            pstmt.setInt(4, equipo.getPartidosPerdidos());
            pstmt.setInt(5, equipo.getGolesAFavor());
            pstmt.setInt(6, equipo.getGolesEnContra());
            pstmt.setInt(7, equipo.getPuntos());
            pstmt.setString(8, equipo.getNombre());

            // Ejecutar la actualización
            pstmt.executeUpdate();
            System.out.println("Equipo actualizado en la base de datos: " + equipo.getNombre());

        } catch (SQLException e) {
            System.err.println("Error al actualizar el equipo en la base de datos: " + e.getMessage());
        }
    }

    // Obtener la lista de equipos ordenada por puntos
    public ArrayList<Equipo> getEquipos() {
        // Ordenar los equipos por puntos (de mayor a menor)
        equipos.sort((e1, e2) -> Integer.compare(e2.getPuntos(), e1.getPuntos()));
        return equipos;
    }
}