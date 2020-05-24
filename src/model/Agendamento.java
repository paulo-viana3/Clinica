package model;

import java.sql.Date;

public class Agendamento {
	
	int idAgendamento;
	Date data;
	int idMedico;
	String nomeMedico;
	int idPaciente;
	String nomePaciente;
	String status;
	String horario;
	String diagnostico;
	String prescricao;
	String especialidade;
	
	
	public String getEspecialidade() {
		return especialidade;
	}
	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}
	public String getDataformatada() {
		return dataformatada;
	}
	public void setDataformatada(String dataformatada) {
		this.dataformatada = dataformatada;
	}
	String dataformatada;

	public String getNomeMedico() {
		return nomeMedico;
	}
	public void setNomeMedico(String nomeMedico) {
		this.nomeMedico = nomeMedico;
	}
	public String getNomePaciente() {
		return nomePaciente;
	}
	public void setNomePaciente(String nomePaciente) {
		this.nomePaciente = nomePaciente;
	}
	public int getIdAgendamento() {
		return idAgendamento;
	}
	public void setIdAgendamento(int idAgendamento) {
		this.idAgendamento = idAgendamento;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public int getIdMedico() {
		return idMedico;
	}
	public void setIdMedico(int idMedico) {
		this.idMedico = idMedico;
	}
	public int getIdPaciente() {
		return idPaciente;
	}
	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	public String getDiagnostico() {
		return diagnostico;
	}
	public void setDiagnostico(String diagnostico) {
		this.diagnostico = diagnostico;
	}
	public String getPrescricao() {
		return prescricao;
	}
	public void setPrescricao(String prescricao) {
		this.prescricao = prescricao;
	}
	
}
