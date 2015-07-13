package ro.bibliardar.users.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Roles")
public class Role 
{  
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	
	@Column(name = "rolename", unique = true, nullable = false, length = 15)
	private String rolename;
     
    //@OneToOne(cascade=CascadeType.ALL)
    //@JoinTable(name="UserRole", 
    //    joinColumns = {@JoinColumn(name="roleId", referencedColumnName="id")},
    //    inverseJoinColumns = {@JoinColumn(name="userId", referencedColumnName="id")})
    //private Set<User> userRole;
 
    public Integer getId() 
    {
        return id;
    }
 
    public void setId(Integer id) 
    {
        this.id = id;
    }
 
    public String getRolename() 
    {
        return rolename;
    }
 
    public void setRolename(String rolename) 
    {
        this.rolename = rolename;
    }
 
    //public Set<User> getUserRole() 
    //{
    //    return userRole;
    //}
 
    //public void setUserRole(Set<User> userRole) 
    //{
    //    this.userRole = userRole;
    //}
     
}