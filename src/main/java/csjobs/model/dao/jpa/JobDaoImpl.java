package csjobs.model.dao.jpa;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Job;
import csjobs.model.dao.JobDao;



@Repository
public class JobDaoImpl implements JobDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
	public List<Job> getJobs() {
		return entityManager.createQuery( "from Job ", Job.class )
	            .getResultList();
	}

	@Override
	public Job getJob(long id) {
		return entityManager.find( Job.class,id);
	}

	@Override
	public List<Job> getRemainingJobs(long userid) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from Job j where j.id not in (select app.job.id from Application app where app.applicant.id=:userid)", Job.class).setParameter("userid", userid).getResultList();
	}

	@Override
	public List<Job> openJobs() {
		
	        String query = "from Job where publishDate < :now "
	            + "and (closeDate is null or closeDate > :now) "
	            + "order by publishDate asc";

	        return entityManager.createQuery( query, Job.class )
	            .setParameter( "now", new Date() )
	            .getResultList();
	    
	}

	@Override
	public List<Job> getlatestJobs() {
		  return entityManager
		            .createQuery( "from Job order by id desc", Job.class )
		            .getResultList();
	}
	
	@Override
    @Transactional
    @PreAuthorize ("hasRole('ROLE_ADMIN')")
    public Job saveJob( Job job )
    {
        return entityManager.merge( job );
    }


}