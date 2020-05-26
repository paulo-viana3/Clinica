package model;

import java.sql.Date;

public class Paciente {

	private int idPaciente;
	private String nome;
	private String cpf;
	private Date dataNasc;
	private String email;
	private String senha;
	private String telContato;
	private String dataFormatada;
	
	public String getTelContato() {
		return telContato;
	}
	public void setTelContato(String telContato) {
		this.telContato = telContato;
	}
	public int getIdPaciente() {
		return idPaciente;
	}
	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public Date getDataNasc() {
		return dataNasc;
	}
	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getDataFormatada() {
		return dataFormatada;
	}
	public void setDataFormatada(String dataFormatada) {
		this.dataFormatada = dataFormatada;
	}
	
}
