package csjobs.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import csjobs.model.User;

@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) 
	{
		return User.class.isAssignableFrom(clazz);
	}
	
	
	@Override
	public void validate(Object target, Errors errors) 
	{
		User user = (User) target;
		
		if( !StringUtils.hasText(user.getFirstName() ))
		{
			errors.rejectValue("firstName", "error.field.empty");
		}
		
		if( !StringUtils.hasText(user.getLastName() ))
		{
			errors.rejectValue("lastName", "error.field.empty");
		}
		
		if( !StringUtils.hasText(user.getPhone() ))
		{
			errors.rejectValue("phone", "error.field.empty");
		}
		
		if( !StringUtils.hasText(user.getAddress() ))
		{
			errors.rejectValue("address", "error.field.empty");
		}
		
		if( !StringUtils.hasText(user.getEmail() ))
		{
			errors.rejectValue("email", "error.field.empty");
		}
		
			
		if( !StringUtils.hasText(user.getPassword() ))
		{
			errors.rejectValue("password", "error.field.empty");
		}
		
		if(!StringUtils.pathEquals(user.getPassword(),user.getPassword2()) ){
			errors.rejectValue("password2", "error.password.missmatch");
			
		}
		
		
	}

}
