package servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.IDaoLocal;
import entities.Filiere;
import entities.Student;

/**
 * Servlet implementation class StudentFiliereWeb
 */
public class StudentFiliereWeb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentFiliereWeb() {
        super();
        // TODO Auto-generated constructor stub
    }
    @EJB(beanName = "studentService")
	private IDaoLocal<Student> daoLocal;

	@EJB(beanName = "filiereService")
	private IDaoLocal<Filiere> filiereDao;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Filiere> filieres = filiereDao.findAll();
		int idFiliere=0;
		if (request.getParameter("filiere") != null && !request.getParameter("filiere").isEmpty()) {
			idFiliere = Integer.parseInt(request.getParameter("filiere"));
			List<Student> students =	daoLocal.findAllByFiliere(filiereDao.findById(idFiliere));
			request.setAttribute("students", students);
			System.out.println();
			 for (Student student : students) {
		         System.out.println("Name: " + student.getFirstName() + " " + student.getRoles()+" ");
		         System.out.println();
		     }
			System.out.println();
		
	}
	System.out.println();
	System.out.println("idFiliere "+idFiliere);

	System.out.println();
		request.setAttribute("filieres", filieres);
		request.getRequestDispatcher("StudentFiliere.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
