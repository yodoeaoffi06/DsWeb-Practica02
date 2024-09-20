package org.uv.dsweb.practica02;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {
    int id;
    String nombre;
    String telefono;
    String direccion;
}

