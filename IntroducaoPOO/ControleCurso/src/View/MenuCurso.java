package View;

import java.util.Scanner;

import Controller.Curso;
import Model.Aluno;
import Model.Professor;

public class MenuCurso {
    //atributos
    private boolean continuar = true;
    private int operacao;
    Scanner sc = new Scanner(System.in);
    //método
    public void menu(){
        //instancia curso e professor
        Professor professor = new Professor("José Pereira", "123.456.789-98", 15000.00);
        Curso curso = new Curso("Programação Java", professor);
        
        while (continuar) {
           System.out.println("==Sistema de Gestão Escolar==");
           System.out.println("1. Cadastrar Aluno no Curso");
           System.out.println("2. Informações do Curso");
           System.out.println("3. Status da Turma");
           System.out.println("4. Sair");
           System.out.println("Escolha a Opção Desejada:");
           operacao = sc.nextInt();
           switch (operacao) {
            case 1:
                System.out.println("Informe o Nome do aluno");
                String nomeAluno =sc.next();
                System.out.println("Informe o CPF do aluno");
                String cpfAluno = sc.next();
                System.out.println("Informe o nº da Matricula");
                String matriculaAluno = sc.next();
                System.out.println("Informe a Nota do Aluno");
                double notaAluno = sc.nextDouble();
                Aluno aluno = new Aluno(nomeAluno, cpfAluno, matriculaAluno, notaAluno);
                curso.adicionarAluno(aluno);
                break;
            case 2:
                curso.exibirInformacoesCurso();
                break;
            case 3: //a fazer
                break;
            case 4:
                System.out.println("Saindo...");
                continuar = false;
                break;
            default:
                System.out.println("Informe uma Operação Válida");
                break;
           }
        }

    }
}
