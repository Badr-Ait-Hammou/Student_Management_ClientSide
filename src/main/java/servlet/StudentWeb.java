package servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.IDaoLocal;
import entities.Filiere;
import entities.Role;
import entities.Student;

/**
 * Servlet implementation class StudentWeb
 */
public class StudentWeb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentWeb() {
        super();
        // TODO Auto-generated constructor stub
    }
    @EJB(beanName = "studentService")
	private IDaoLocal<Student> daoLocal;

	@EJB(beanName = "filiereService")
	private IDaoLocal<Filiere> filiereDao;
	
	@EJB(beanName = "roleService")
	private IDaoLocal<Role> roleDao;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		List<Student> students = daoLocal.findAll();
		List<Filiere> filieres = filiereDao.findAll();
		List<Role> roles=roleDao.findAll();
		request.setAttribute("students", students);
		request.setAttribute("filieres", filieres);
		request.setAttribute("roles", roles);
		request.getRequestDispatcher("Student.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idFiliere = 0;
		int idRole=0;
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String telephone = request.getParameter("telephone");
		if (request.getParameter("filiere") != null && !request.getParameter("filiere").isEmpty()) {
			idFiliere = Integer.parseInt(request.getParameter("filiere"));
		}
		if (request.getParameter("role") != null && !request.getParameter("role").isEmpty()) {
			idRole = Integer.parseInt(request.getParameter("role"));
		}
		System.out.println();
		System.out.println();
		System.err.println("filiere = " + idFiliere);
		System.out.println();
		System.out.println();
		int id = 0;

		if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) {
			String action = request.getParameter("action");
			System.out.println();
			System.out.println();
			System.err.println("action = " + action);
			System.out.println();
			System.out.println();
			switch (action) {
			case "add":
				System.out.println(password + " " + login + " " + firstName + " " + " " + lastName + " " + " " + telephone + " "
						+ idFiliere);
				daoLocal.create(new Student(password, login, firstName, lastName, telephone, filiereDao.findById(idFiliere)));
				break;
			
		       case "update":
		            Student student = daoLocal.findById(id);
		            System.err.println(student.toString());
		            System.out.println(id + " " + password + " " + login + " " + firstName + " " + " " + lastName + " " + " " + telephone + " "
		                    + idFiliere);
		            student.setPassword(password);
		            student.setLogin(login);
		            student.setFirstName(firstName);
		            student.setLastName(lastName);
		            student.setTelephone(telephone);
		            student.setFiliere(filiereDao.findById(idFiliere));
		            daoLocal.update(student);
		            break;
			case "del":
				System.out.println();
				System.out.println();
				System.err.println("id = " + id);
				System.out.println();
				System.out.println();
				daoLocal.delete(daoLocal.findById(id));
				break;
			case "affect":
		
				daoLocal.affect(roleDao.findById(idRole), daoLocal.findById(id));
			default:
				System.out.println("default");
				break;
			}
		}
		doGet(request, response);
	}

}
