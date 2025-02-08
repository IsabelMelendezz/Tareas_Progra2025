/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author visitante
 */
public class alumno {
    String carnet_alumno;
    String nombrealumno;
    String direalumno;
    String telefono;
    String emailalumno;
    String Estatus_alumno;
    

    public alumno() {
    }

    public alumno(String carnet_alumno, String nombrealumno, String direalumno, String telefono, String emailalumno, String Estatus_alumno) {
        this.carnet_alumno= carnet_alumno;
        this.nombrealumno= nombrealumno;
        this.direalumno= direalumno;
        this.telefono=telefono;
        this.emailalumno=emailalumno;
        this.Estatus_alumno= Estatus_alumno;
        
    }
   

    public String getcarnet_alumno() {
        return carnet_alumno;
    }
    
    public void setcarnet_alumno(String carnet_alumno) {
        this.carnet_alumno = carnet_alumno;
    }
    //-------------------------------------------------------------------------
    
     public String getnombrealumno() {
        return nombrealumno;
    }
    
    public void setnombrealumno(String nombrealumno) {
        this.nombrealumno = nombrealumno;
    }
    //---------------------------------------------------------------------------
     public String getdirealumno() {
        return direalumno;
    }
    
    public void setdirealumno(String direalumno) {
        this.direalumno = direalumno;
    }
    //---------------------------------------------------------------------------
     public String gettelefono() {
        return telefono;
    }
    
    public void settelefono(String telefono) {
        this.telefono = telefono;
    }
    //--------------------------------------------------------------------------------
     public String getemailalumno() {
        return carnet_alumno;
    }
    
    public void setemailalumno(String emailalumno) {
        this.emailalumno = emailalumno;
    }
    
   //---------------------------------------------------------------------------------------

     public String getEstatus_alumno() {
        return Estatus_alumno;
    }
    
    public void setEstatus_alumno(String Estatus_alumno) {
        this.Estatus_alumno = Estatus_alumno;
    }
    //----------------------------------------------------------------------------------
   
    

    @Override
    public String toString() {
        return "Alumnos{" + "carnet_alumno=" + carnet_alumno + ", nombrealumno=" + nombrealumno + ", direalumno=" + direalumno + ", Email Alumno =" + emailalumno +  ", Estatus alumno =" + Estatus_alumno +'}';
    }
    
}
