package br.com.nadd.domain.model;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.EqualsAndHashCode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.Collections;

@JsonRootName("pessoa")
@Data
@Entity
@Table(name = "na01pessoa")
public class Pessoa implements UserDetails {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na01idpessoa")
    private Long id;

    @Column(name = "na01nome", nullable = false, length = 80)
    private String nome;

    @Column(name = "na01celular", nullable = false, length = 12)
    private int celular;

    @Column(name = "na01email", nullable = false, length = 30)
    private  String email;

    @Column(name = "na01senha", nullable = false, length = 30)
    private String senha;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
    }

    @Override
    public String getPassword() {
        return this.senha;
    }

    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }
}
