package classes;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author labweb
 */
public class Usuario {
    public String login;
    public String senha;
    public String nome;

    public Usuario(String Login, String Senha, String Nome) {
        login = Login;
        senha = Senha;
        nome = Nome;
    }
}
