package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Application;
import csjobs.model.dao.ApplicationDao;



@Repository
public class ApplicationDaoImpl implements ApplicationDao {

    @PersistenceContext
    private EntityManager entityManager;

   

	@Override
	public List<Application> getApplications() {
		return entityManager.createQuery( "from Application", Application.class )
	            .getResultList();
	}

	@Override
	@PostAuthorize("@myMethodSecurityExpressionHandler.hasPermission(principal.username,returnObject.job) or hasRole('ROLE_ADMIN') or principal.username == returnObject.applicant.email")
	public Application getApplication(long id) {
		return entityManager.find( Application.class,id);
	}

	@Override
	public List<Application> getSubmittedApplications(long userid) {
		// TODO Auto-generated method stub
		return  entityManager.createQuery("from Application a where a.applicant.id=:userId", Application.class).setParameter("userId", userid).getResultList();
	}

	@Override
	@Transactional
	public Application saveApplication(Application application) {
		return entityManager.merge(application);
	}	

}